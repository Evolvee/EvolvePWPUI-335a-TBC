--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
Notes:
	- Texture retrieval on Spells will not return different state textures for a spell (e.g. Wisp, when a Hunter Aspect is selected)
	- Texture retrieval on Macros will however return the different state textures - I do not believe this can be leveraged to fix the above
	- Index refers to the players index to a macro, spell, Companion etc...
	- Id refers to the universal Id where one exists
	- I would have liked to add operations to the CheckButton instances, but this may or may not be safe, so instead I create an instance with a CheckButton member
	- Because Frames can be dynamically created, abandoned Frames need to be managed... This could lead to recycling them, but consider that later on
	- OnClick of the SecureButtonTemplate has some subtle but important behaviour as follows
		- Clears the Cursor
		- If the Cursor is a Spell and the button type is spell it wont trigger the action, other situations it does (workaround is to temporarily clear the type attribute)
	- Querying Companion information is dicey when the player first enters the gameworld (during a new session, or perhaps empty cache??)
		- A COMPANION_UPDATE event triggers when this data is available for query, unfortunately other things can trigger the same event before this as well, making it not as useful
		- A work around is to continually try to create the companion cache until it successfully runs to completetion
	- Macros with Companions as the action, will return the action as though it were a spell :S
		- Since basically none of the spell functions actually work with companions (even though they have a spell id!?!?) we need to detect if it really is a spell or not
		- This is done by creating a reverse cache of the companions for easy lookup
	- MouseOver macro conditional changed has the following considerations
		- The Event CURSOR_UPDATE is not sufficient for this, since if the cursor does not change such as mousing from one enemy to the next, or moving onto the enemy name plate (cursor changes but mouseover hasn't, but now we wont get a cursor_update when they move completely off)
		- The Event UPDATE_MOUSEOVER_UNIT would have done the trick, except it does not fire when the player mouses off a target to nothing
		- The solution is to check the players mouseover target on a per frame basis, and put a 1 frame delay in before refreshing, so far this does not appear to incur a big penalty (i'd still like to avoid doing it however)

	- Button is inherited for each Button created
		- each created Button has a table entry called Widget, this is the actual button widget shown on screen
		- The above is important to remember since sometimes a Button function called be called with the first parameter as the Widget (not the Button, in these cases, the : operator has not been used
			and the first parameter will be Widget)... This is due to the setting of some Button functions as Scripts for events on the Widget.
]]

--Create a mapping to the needed elements (allocate the item if necessary)

local Util = BFUtil;
local Const = BFConst;
local Button = BFButton;
local UILib = BFUILib;
local CustomAction = BFCustomAction;
local KeyBinder = BFKeyBinder;
Button.__index = Button;

local IsUsableSpell = IsUsableSpell;

--[[--------------------------------------------------------------
		Create a New Button
----------------------------------------------------------------]]
function Button.New(Parent, ButtonSave, ButtonLocked, TooltipEnabled)
	if (InCombatLockdown()) then
		return;
	end
	local NewButton = {};
	setmetatable(NewButton, Button);		

	NewButton.Widget = Button.CreateButtonWidget(Parent);
	local Name = NewButton.Widget:GetName();
	NewButton.WIcon 			= _G[Name.."Icon"];
	NewButton.WNormalTexture 	= _G[Name.."NormalTexture"];
	NewButton.WCooldown 		= _G[Name.."Cooldown"];	
	NewButton.WCount 			= _G[Name.."Count"];
	NewButton.WBorder 			= _G[Name.."Border"];
	NewButton.WFlashTexture 	= _G[Name.."Flash"];
	NewButton.WHotKey 			= _G[Name.."HotKey"];
	NewButton.WName 			= _G[Name.."Name"];
	NewButton.Widget.ParentButton = NewButton;
	
	NewButton.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0, 0.5);	

	NewButton.UpdateTooltip = Button.Empty;
	NewButton:Configure(Parent, ButtonSave, ButtonLocked, TooltipEnabled);
	
	return NewButton;
end

function Button.CreateButtonWidget(Parent)
	local Widget = CreateFrame("CheckButton", Const.ButtonNaming..Const.ButtonSeq, Parent, "SecureActionButtonTemplate, ActionButtonTemplate");
	Const.ButtonSeq = Const.ButtonSeq + 1;
	Widget:SetAttribute("checkselfcast", true);
	Widget:SetAttribute("checkfocuscast", true);
	Widget:RegisterForDrag("LeftButton", "RightButton");
	Widget:RegisterForClicks("AnyUp");
	Widget:SetScript("OnReceiveDrag", Button.OnReceiveDrag);
	Widget:SetScript("OnDragStart", Button.OnDragStart);
	Widget:SetScript("PostClick", Button.PostClick);
	Widget:SetScript("PreClick", Button.PreClick);
	
	return Widget;
end

--[[ Configure the button for use --]]
function Button:Configure(Parent, ButtonSave, ButtonLocked, TooltipEnabled)
	self.Widget:SetParent(Parent);
	self.ButtonSave = ButtonSave;
	
	local Mode = ButtonSave["Mode"];
	if (Mode == "spell") then
		self:SetCommandExplicitSpell(ButtonSave["SpellId"], ButtonSave["SpellNameRank"], ButtonSave["SpellName"], ButtonSave["SpellBook"]);	--the util functions will get both the index and the book
		
	elseif (Mode == "item") then
		self:SetCommandExplicitItem(ButtonSave["ItemId"], ButtonSave["ItemName"], ButtonSave["ItemLink"]);
	
	elseif (Mode == "macro") then
		self:SetCommandExplicitMacro(ButtonSave["MacroIndex"], ButtonSave["MacroName"], ButtonSave["MacroBody"]);
		
	elseif (Mode == "companion") then
		self:SetCommandExplicitCompanion(ButtonSave["CompanionId"], ButtonSave["CompanionType"], ButtonSave["CompanionIndex"], ButtonSave["CompanionName"], ButtonSave["CompanionSpellName"]);
		
	elseif (Mode == "equipmentset") then
		self:SetCommandExplicitEquipmentSet(ButtonSave["EquipmentSetId"], ButtonSave["EquipmentSetName"]);
	
	elseif (Mode == "bonusaction") then
		self:SetCommandExplicitBonusAction(ButtonSave["BonusActionId"]);
		
	elseif (Mode == "customaction") then
		self:SetCommandExplicitCustomAction(ButtonSave["CustomActionName"]);
		
	else
		self:ClearCommand();
	end
	
	if (ButtonForgeSave["RightClickSelfCast"]) then
		self.Widget:SetAttribute("unit2", "player");
	else
		self.Widget:SetAttribute("unit2", nil);
	end
	self:SetButtonLock(ButtonLocked);
	self:SetTooltipEnabled(TooltipEnabled);
	self:SetKeyBind(ButtonSave["KeyBinding"]);
	self:Show();
	self:FullRefresh();
end





--[[--------------------------------------------------------------
	Deallocate the Button
----------------------------------------------------------------]]
function Button:Deallocate()
	self:ClearCommand();
	self:SetKeyBind(nil);
	self:Hide();
end





--[[--------------------------------------------------------------
	Set functions
----------------------------------------------------------------]]
function Button:SetButtonLock(Value)
	self.Locked = Value;
end

function Button:SetTooltipEnabled(Value)
	self.TooltipEnabled = Value;
	self:SetOnEnter();
end

function Button:SetKeyBind(Key)
	if (InCombatLockdown()) then
		return false;
	end
	
	--Each key owns it's own key binding
	ClearOverrideBindings(self.Widget);
	if (Key ~= "" and Key ~= nil) then
		self.ButtonSave["KeyBinding"] = Key;
		SetOverrideBindingClick(self.Widget, false, Key, self.Widget:GetName());
		self.WHotKey:SetText(GetBindingText(Key, "KEY_", 1));
		self.WHotKey:ClearAllPoints();
		self.WHotKey:SetPoint("TOPLEFT", self.Widget, "TOPLEFT", -2, -2);
		self.WHotKey:SetVertexColor(0.6, 0.6, 0.6);
		self.Widget:SetAttribute("KeyBindValue", Key);
		self.WHotKey:Show();
	else
		--clear the binding
		self.ButtonSave["KeyBinding"] = nil;
		self.WHotKey:SetText(RANGE_INDICATOR);
		self.WHotKey:ClearAllPoints();
		self.WHotKey:SetPoint("TOPLEFT", self.Widget, "TOPLEFT", 1, -2);
		self.Widget:SetAttribute("KeyBindValue", nil);
		self.WHotKey:Hide();
	end

	return true;
end

function Button:SetOnEnter(Value)
	if (Value == "KeyBind") then
		self.Widget:SetScript("OnEnter", Button.OnEnterKeyBind);
		self.Widget:SetScript("OnLeave", nil);
	elseif (self.TooltipEnabled) then
		self.Widget:SetScript("OnEnter", Button.OnEnterTooltip);
		self.Widget:SetScript("OnLeave", Button.OnLeaveTooltip);
	else
		self.Widget:SetScript("OnEnter", nil);		
		self.Widget:SetScript("OnLeave", nil);
	end
end





--[[-------------------------------------------------------------------------
	OnEnter / OnLeave handlers
---------------------------------------------------------------------------]]
function Button.OnLeaveTooltip(Widget)
	GameTooltip:Hide();
	Widget.ParentButton.UpdateTooltip = Button.Empty;
end

function Button.OnEnterTooltip(Widget)
	local self = Widget.ParentButton;
	GameTooltip_SetDefaultAnchor(GameTooltip, Widget);
	self.UpdateTooltip = self.UpdateTooltipFunc;
	self.Widget.UpdateTooltip = self.UpdateTooltip;
	self:UpdateTooltip();
end

function Button.OnEnterKeyBind(Widget)
	UILib.SetMask(Widget.ParentButton, KeyBinder.ShowBindingDialog, KeyBinder.CancelButtonSelectorMode, Widget, "CAST_CURSOR","Interface/TARGETINGFRAME/UI-RaidTargetingIcon_1", {0, 1, 0, 1});
	GameTooltip_SetDefaultAnchor(GameTooltip, Widget);
end





--[[----------------------------------------------------------------------------------
		Button Display altering functions (used when reducing cols/rows or hiding 
		such as when the grid is not always on, or the button is deallocated
------------------------------------------------------------------------------------]]
function Button:Fade(Value)
	if (Value) then
		self.Widget:SetAlpha(0.5);
	else
		self.Widget:SetAlpha(1);
	end
end

function Button:Hide()
	if (InCombatLockdown()) then
		return;
	end
	self.Widget:Hide();
end

function Button:Show()
	if (InCombatLockdown()) then
		return;
	end
	self.Widget:Show();
end





--[[------------------------------------------------------------------------------------------
	Functions that manage setting the action for the button, including the script handlers
	for the player drag/dropping actions
--------------------------------------------------------------------------------------------]]

--[[ Script Handlers --]]
function Button.PreClick(Widget)
	if (InCombatLockdown()) then
		return;
	end
	
	local Command, Data, Subvalue = GetCursorInfo();
	if (not Command) then
		Command, Data, Subvalue = UILib.GetDragInfo();
	end
	Util.StoreCursor(Command, Data, Subvalue);			--Always store this, so that if it is nil PostClick wont try to use it
	if (Command) then
		Widget.BackupType = Widget:GetAttribute("type");
		Widget:SetAttribute("type", "");	--Temp unset the type to prevent any action happening
	end
end

function Button.PostClick(Widget)
	local self = Widget.ParentButton;
	if (not InCombatLockdown()) then
		local Command, Data, Subvalue = Util.GetStoredCursor();
		if (Command) then
			Util.StoreCursor(self:GetCursor());		--Store the info from the button for later setting the cursor
			if (self:SetCommandFromTriplet(Command, Data, Subvalue)) then	--Set the button to the cursor
				Util.SetCursor(Util.GetStoredCursor());					--On success set the cursor to the stored button info
			else
				Util.SetCursor(Command, Data, Subvalue);				--On fail set the cursor to what ever it was
				self.Widget:SetAttribute("type", Widget.BackupType);			--and restore the button mode
			end
		end
	end
	self:UpdateChecked();
end

function Button.OnReceiveDrag(Widget)
	local self = Widget.ParentButton;
	if (not InCombatLockdown()) then
		if (GetCursorInfo()) then
			Util.StoreCursor(self:GetCursor());
			if (self:SetCommandFromTriplet(GetCursorInfo())) then
				Util.SetCursor(Util.GetStoredCursor());
			end
		elseif (UILib.GetDragInfo()) then
			Util.StoreCursor(self:GetCursor());
			if (self:SetCommandFromTriplet(UILib.GetDragInfo())) then
				Util.SetCursor(Util.GetStoredCursor());
			end
		end
	end
end

function Button.OnDragStart(Widget)
	local self = Widget.ParentButton;
	if (not (InCombatLockdown() or self.Locked)) then
		Util.StoreCursor(self:GetCursor());
		if (GetCursorInfo()) then
			if (self:SetCommandFromTriplet(GetCursorInfo())) then
				Util.SetCursor(Util.GetStoredCursor());
			end
		elseif (self:SetCommandFromTriplet(UILib.GetDragInfo())) then
			Util.SetCursor(Util.GetStoredCursor());
		end
	end
end

--[[ Set up the buttons action based on the triplet of data provided from the cursor --]]
function Button:SetCommandFromTriplet(Command, Data, Subvalue)
	if (InCombatLockdown()) then
		return false;
	end
	
	local OldMode = self.Mode;
	
	if (Command == "spell") then
		self:SetCommandSpell(Data, Subvalue);  --Data = Index, Subvalue = Book (spell/pet)
	elseif (Command == "item") then
		self:SetCommandItem(Data, Subvalue);   --Data = Id, Subvalue = Link
	elseif (Command == "macro") then
		self:SetCommandMacro(Data);            --Data = Index
    elseif (Command == "companion") then
        self:SetCommandCompanion(Data, Subvalue);	--Data = Index, Subvalue = MOUNT/CRITTER
	elseif (Command == "equipmentset") then
		self:SetCommandEquipmentSet(Data);			--Data = Name
	elseif (Command == "bonusaction") then
		self:SetCommandBonusAction(Data);			--Data = Id (1 to 12)
	elseif (Command == "customaction") then
		self:SetCommandCustomAction(Data);			--Data = Action
	elseif (Command == nil or Command == "") then
		self:ClearCommand();
	else
		return false;
	end
	
	self:FullRefresh();
	return true;
end

--[[ Function to clear the command on the button --]]
function Button:ClearCommand()
	self:SetEnvClear();
	self:SetAttributes(nil, nil);
	self:SaveClear();
	self:ResetAppearance();
end

--[[ Set the individual types of actions including obtained any extra data they may need --]]
function Button:SetCommandSpell(Index, Book)
	local Name, Rank = GetSpellInfo(Index, Book);
	local NameRank = Util.GetFullSpellName(Name, Rank);
	local Id = Util.GetSpellId(NameRank);
	self:SetCommandExplicitSpell(Id, NameRank, Name, Book);
end
function Button:SetCommandItem(Id, Link)
	local Name;
	Name, Link = GetItemInfo(Id);	--Note this will get a clean link, as the one passed in may have enchants etc encoded in it
	self:SetCommandExplicitItem(Id, Name, Link);
end
function Button:SetCommandMacro(Index)
	local Name, Texture, Body = GetMacroInfo(Index);
	self:SetCommandExplicitMacro(Index, Name, Body);
end
function Button:SetCommandCompanion(Index, Type)
	local Id, Name, SpellId = GetCompanionInfo(Type, Index);
	local SpellName = GetSpellInfo(SpellId);
	self:SetCommandExplicitCompanion(Id, Type, Index, Name, SpellName);
end
function Button:SetCommandEquipmentSet(Name)
	local Id = select(2, GetEquipmentSetInfoByName(Name));	--Id isn't really used, but since it is available and appears reliable (i.e. doesn't change??) I will store it away just in case
	self:SetCommandExplicitEquipmentSet(Id, Name);
end
function Button:SetCommandBonusAction(Id)
	self:SetCommandExplicitBonusAction(Id);
end
function Button:SetCommandCustomAction(Name)
	self:SetCommandExplicitCustomAction(Name);
end

--[[ Set the individual types of actions (all data needed is supplied to the functions as args) --]]
function Button:SetCommandExplicitSpell(Id, NameRank, Name, Book)
	self:SetEnvSpell(Id, NameRank, Name, Book);
	self:SetAttributes("spell", NameRank);
	self:SaveSpell(Id, NameRank, Name, Book);
end
function Button:SetCommandExplicitItem(Id, Name, Link)
	self:SetEnvItem(Id, Name, Link);
	self:SetAttributes("item", Name);
	self:SaveItem(Id, Name, Link);
end
function Button:SetCommandExplicitMacro(Index, Name, Body)
	self:SetEnvMacro(Index, Name, Body);
	self:SetAttributes("macro", Index);
	self:SaveMacro(Index, Name, Body);
end
function Button:SetCommandExplicitCompanion(Id, Type, Index, Name, SpellName)
	self:SetEnvCompanion(Id, Type, Index, Name, SpellName);
	self:SetAttributes("companion", SpellName);
	self:SaveCompanion(Id, Type, Index, Name, SpellName);
end
function Button:SetCommandExplicitEquipmentSet(Id, Name)
	self:SetEnvEquipmentSet(Id, Name);
	self:SetAttributes("equipmentset", Name);
	self:SaveEquipmentSet(Id, Name);
end
function Button:SetCommandExplicitBonusAction(Id)
	self:SetEnvBonusAction(Id);
	self:SetAttributes("bonusaction", Id);
	self:SaveBonusAction(Id);
end
function Button:SetCommandExplicitCustomAction(Name)
	self:SetEnvCustomAction(Name);
	self:SetAttributes("customaction", Name);
	self:SaveCustomAction(Name);
end

--[[ The following functions will configure the button to operate correctly for the specific type of action (these functions must be able to handle the player not knowing spells/macros etc) --]]
function Button:SetEnvSpell(Id, NameRank, Name, Book)
	self.UpdateTexture 	= Button.Empty;	
	self.UpdateChecked 	= Button.UpdateCheckedSpell;
	self.UpdateEquipped = Button.Empty;
	self.UpdateCooldown	= Button.UpdateCooldownSpell;
	self.UpdateUsable 	= Button.UpdateUsableSpell;
	self.UpdateTextCount = Button.Empty;	
	self.UpdateTooltipFunc = Button.UpdateTooltipSpell;
	self.UpdateRangeTimer = Button.UpdateRangeTimerSpell;
	self.CheckRangeTimer = Button.CheckRangeTimerSpell;
	self.UpdateFlash	= Button.UpdateFlashSpell;

	self.GetCursor 		= Button.GetCursorSpell;

	self.FullRefresh 	= Button.FullRefresh;

	local Matched = false;
	for k, v in pairs(Util.GetLocaleString("SpellWispContains")) do
		if (strfind(Name, v)) then
			Matched = true;
		end
	end
	for k, v in pairs(Util.GetLocaleString("SpellWispExcludes")) do
		if (strfind(Name, v)) then
			Matched = false;
		end
	end
	if (Matched) then
		-- This spell may update its icon to the wisp state...
		self.UpdateTexture = Button.UpdateTextureWispSpell;
	end
	
	if (IsConsumableSpell(NameRank)) then
		self.UpdateTextCount = Button.UpdateTextCountSpell;
	end
	
	self.Mode 			= "spell";
	self.SpellId 		= Id;
	self.SpellNameRank 	= NameRank;
	self.SpellName 		= Name;
	self.SpellBook 		= Book;
	self.Texture 		= GetSpellTexture(NameRank);	--safe provided NameRank ~= nil
	self.Target			= "target";
	
	self:ResetAppearance();
	self:DisplayActive();
	Util.AddSpell(self);
end
function Button:SetEnvItem(Id, Name, Link)
	self.UpdateTexture 		= Button.Empty;
	self.UpdateChecked 	= Button.UpdateCheckedItem;
	self.UpdateEquipped = Button.UpdateEquippedItem;
	self.UpdateCooldown = Button.UpdateCooldownItem;
	self.UpdateUsable 	= Button.UpdateUsableItem;
	self.UpdateTextCount = Button.UpdateTextCountItem;
	self.UpdateTooltipFunc 	= Button.UpdateTooltipItem;	
	self.UpdateRangeTimer = Button.UpdateRangeTimerItem;
	self.CheckRangeTimer = Button.CheckRangeTimerItem;
	self.UpdateFlash	= Button.Empty;
	
	self.GetCursor 		= Button.GetCursorItem;


	self.FullRefresh 	= Button.FullRefresh;
	
	self.Mode 			= "item";
	self.ItemId 		= Id;
	self.ItemName 		= Name;
	self.ItemLink 		= Link;
	self.Texture		= GetItemIcon(Id) or "Interface/Icons/INV_Misc_QuestionMark";				--safe no matter what
	self.Target			= "target";
	
	self:ResetAppearance();
	self:DisplayActive();
	Util.AddItem(self);
end
function Button:SetEnvMacro(Index, Name, Body)
	self.UpdateTexture 		= Button.UpdateTextureMacro;
	self.UpdateChecked 	= Button.UpdateCheckedMacro;
	self.UpdateEquipped = Button.UpdateEquippedMacro;
	self.UpdateCooldown	= Button.UpdateCooldownMacro;
	self.UpdateUsable 	= Button.UpdateUsableMacro;
	self.UpdateTextCount = Button.Empty;	
	self.UpdateTooltipFunc	 	= Button.UpdateTooltipMacro;
	self.UpdateRangeTimer = Button.UpdateRangeTimerMacro;
	self.CheckRangeTimer = Button.CheckRangeTimerMacro;
	self.UpdateFlash	= Button.UpdateFlashMacro;
	self.TranslateMacro = Button.TranslateMacro;
	self.GetCursor		= Button.GetCursorMacro;


	self.FullRefresh 	= Button.FullRefreshMacro;
	
	self.Mode 			= "macro";
	self.MacroIndex 	= Index;
	self.MacroName 		= Name;
	self.MacroBody 		= Body;
	self.Texture		= nil;	--set in translate macro
	self.Target			= "target";
	
	self:ResetAppearance();
	self:DisplayActive();
	self.WName:SetText(Name);
	Util.AddMacro(self);
end
function Button:SetEnvCompanion(Id, Type, Index, Name, SpellName)
	self.UpdateTexture 		= Button.Empty;
	self.UpdateChecked 	= Button.UpdateCheckedCompanion;	
	self.UpdateEquipped = Button.Empty;
	self.UpdateCooldown	= Button.UpdateCooldownCompanion;
	self.UpdateUsable 	= Button.UpdateUsableCompanion;
	self.UpdateTextCount = Button.Empty;
	self.UpdateTooltipFunc 	= Button.UpdateTooltipCompanion;
	self.UpdateRangeTimer = Button.Empty;
	self.CheckRangeTimer = Button.Empty;
	self.UpdateFlash	= Button.Empty;
	
	self.GetCursor 		= Button.GetCursorCompanion;

	self.FullRefresh 	= Button.FullRefresh;
	
	self.Mode 				= "companion";
	self.CompanionId 		= Id;
	self.CompanionType 		= Type;
	self.CompanionIndex 	= Index;
	self.CompanionName 		= Name;
	self.CompanionSpellName = SpellName;
	self.Texture 			= select(4, GetCompanionInfo(Type, Index));		--safe provided Type in ("MOUNT", "CRITTER") and Index is numeric
	self.Target			= "target";
	
	self:ResetAppearance();
	self:DisplayActive();
end
function Button:SetEnvEquipmentSet(Id, Name)
	self.UpdateTexture 		= Button.Empty;
	self.UpdateChecked 	= Button.UpdateChecked;
	self.UpdateEquipped = Button.Empty;
	self.UpdateCooldown = Button.Empty;
	self.UpdateUsable 	= Button.Empty;
	self.UpdateTextCount = Button.Empty;
	self.UpdateTooltipFunc = Button.UpdateTooltipEquipmentSet;
	self.UpdateRangeTimer = Button.Empty;
	self.CheckRangeTimer = Button.Empty;
	self.UpdateFlash	= Button.Empty;
	
	self.GetCursor 		= Button.GetCursorEquipmentSet;

	self.FullRefresh 	= Button.FullRefresh;
	
	self.Mode 			= "equipmentset";
	self.EquipmentSetId	= Id;
	self.EquipmentSetName 	= Name;
	self.Texture 		= "Interface/Icons/"..(GetEquipmentSetInfoByName(Name) or "");	--safe provided Name ~= nil
	self.Target			= "target";
	
	self:ResetAppearance();
	self:DisplayActive();
	self.WName:SetText(Name);
end
function Button:SetEnvBonusAction(Id)
	self.UpdateTexture 		= Button.UpdateTextureBonusAction;
	self.UpdateChecked 		= Button.UpdateCheckedBonusAction;
	self.UpdateEquipped 	= Button.Empty;
	self.UpdateCooldown 	= Button.UpdateCooldownBonusAction;
	self.UpdateUsable 		= Button.UpdateUsableBonusAction;
	self.UpdateTextCount 	= Button.UpdateTextCountBonusAction;
	self.UpdateTooltipFunc = Button.UpdateTooltipBonusAction;
	self.UpdateRangeTimer = Button.UpdateRangeTimerBonusAction;
	self.CheckRangeTimer = Button.CheckRangeTimerBonusAction;
	self.UpdateFlash	= Button.UpdateFlashBonusAction;
	
	self.GetCursor 		= Button.GetCursorBonusAction;

	self.FullRefresh 	= Button.FullRefresh;
	
	self.Mode 			= "bonusaction";
	self.BonusActionId	= Id;
	self.BonusActionSlot = Id + 120;
	self.Texture 		= GetActionTexture(self.BonusActionSlot);-- "Interface/Icons/"..(GetEquipmentSetInfoByName(Name) or "");	--safe provided Name ~= nil
	self.Target			= "target";
	self.Tooltip		= Util.GetLocaleString("BonusActionTooltip")..Id;
	self:ResetAppearance();
	self:DisplayActive();
	Util.AddBonusAction(self);
end
function Button:SetEnvCustomAction(Name)
	local TexCoords;
	self.UpdateTexture 		= Button.UpdateTextureCustomAction;
	self.UpdateChecked 	= Button.UpdateCheckedCustomAction;
	self.UpdateEquipped = Button.Empty;
	self.UpdateCooldown = Button.Empty;
	self.UpdateUsable 	= Button.UpdateUsableCustomAction;
	self.UpdateTextCount = Button.Empty;
	self.UpdateTooltipFunc = Button.UpdateTooltipCustomAction;
	self.UpdateRangeTimer = Button.Empty;
	self.CheckRangeTimer = Button.Empty;
	self.UpdateFlash	= Button.Empty;
	
	self.GetCursor 		= Button.GetCursorCustomAction;

	self.FullRefresh 	= Button.FullRefresh;
	
	self.Mode 			= "customaction";
	self.CustomActionName	= Name;
	self.Texture, TexCoords	= CustomAction.GetTexture(Name);
	self.Target			= "target";
	
	self:ResetAppearance();
	self:DisplayActive(TexCoords);
	Util.AddBonusAction(self);
end
function Button:SetEnvClear()
	self.UpdateTexture 		= Button.Empty;
	self.UpdateChecked 	= Button.UpdateChecked;
	self.UpdateEquipped = Button.Empty;
	self.UpdateCooldown = Button.Empty;
	self.UpdateUsable 	= Button.Empty;
	self.UpdateTextCount = Button.Empty;
	self.UpdateTooltipFunc 	= Button.Empty;
	self.UpdateRangeTimer = Button.Empty;
	self.CheckRangeTimer = Button.Empty;
	self.UpdateFlash	= Button.Empty;

	self.GetCursor 		= Button.Empty;

	self.FullRefresh 	= Button.Empty;
	
	self.Mode			= nil;

	self:ResetAppearance();
	self:DisplayEmpty();
end

--[[ These functions will update the save data for the button action --]]
function Button:SaveSpell(Id, NameRank, Name, Book)
	self:SaveClear();
	self.ButtonSave["Mode"] 			= "spell";
	self.ButtonSave["SpellId"] 			= Id;
	self.ButtonSave["SpellNameRank"] 	= NameRank;
	self.ButtonSave["SpellName"] 		= Name;
	self.ButtonSave["SpellBook"] 		= Book;
end
function Button:SaveItem(Id, Name, Link)
	self:SaveClear();
	self.ButtonSave["Mode"] 			= "item";
	self.ButtonSave["ItemId"] 			= Id;
	self.ButtonSave["ItemName"] 		= Name;
	self.ButtonSave["ItemLink"] 		= Link;
end
function Button:SaveMacro(Index, Name, Body)
	self:SaveClear();
	self.ButtonSave["Mode"] 			= "macro";
	self.ButtonSave["MacroIndex"] 		= Index;
	self.ButtonSave["MacroName"] 		= Name;
	self.ButtonSave["MacroBody"] 		= Body;
end
function Button:SaveCompanion(Id, Type, Index, Name, SpellName)
	self:SaveClear();
	self.ButtonSave["Mode"]				= "companion";
	self.ButtonSave["CompanionId"]		= Id;
	self.ButtonSave["CompanionType"]	= Type;
	self.ButtonSave["CompanionIndex"]	= Index;
	self.ButtonSave["CompanionName"]	= Name;
	self.ButtonSave["CompanionSpellName"] = SpellName;
end
function Button:SaveEquipmentSet(Id, Name)
	self:SaveClear();
	self.ButtonSave["Mode"]				= "equipmentset";
	self.ButtonSave["EquipmentSetId"]		= Id;
	self.ButtonSave["EquipmentSetName"]	= Name;
end
function Button:SaveBonusAction(Id)
	self:SaveClear();
	self.ButtonSave["Mode"]				= "bonusaction";
	self.ButtonSave["BonusActionId"]	= Id;
end
function Button:SaveCustomAction(Name)
	self:SaveClear();
	self.ButtonSave["Mode"]				= "customaction";
	self.ButtonSave["CustomActionName"]	= Name;
end
function Button:SaveClear()
	self.ButtonSave["SpellId"] 			= nil;
	self.ButtonSave["SpellNameRank"] 	= nil;
	self.ButtonSave["SpellName"] 		= nil;
	self.ButtonSave["SpellBook"] 		= nil;
	self.ButtonSave["ItemId"] 			= nil;
	self.ButtonSave["ItemName"] 		= nil;
	self.ButtonSave["ItemLink"] 		= nil;
	self.ButtonSave["MacroIndex"] 		= nil;
	self.ButtonSave["MacroName"] 		= nil;
	self.ButtonSave["MacroBody"] 		= nil;
	self.ButtonSave["CompanionId"]		= nil;
	self.ButtonSave["CompanionType"]	= nil;
	self.ButtonSave["CompanionIndex"]	= nil;
	self.ButtonSave["CompanionName"]	= nil;
	self.ButtonSave["CompanionSpellName"] = nil;
	self.ButtonSave["EquipmentSetId"]		= nil;
	self.ButtonSave["EquipmentSetName"]	= nil;
	self.ButtonSave["BonusActionId"]	= nil;
	self.ButtonSave["CustomActionName"]	= nil;
	self.ButtonSave["Mode"] = nil;
end

--[[ Set the buttons attributes (When I get some spare time this could be put in the secure env to allow changing the button during combat) --]]
function Button:SetAttributes(Type, Value)
	--Firstly clear all relevant fields
	self.Widget:SetAttribute("type", nil);
	self.Widget:SetAttribute("spell", nil);
	self.Widget:SetAttribute("item", nil);
	self.Widget:SetAttribute("macro", nil);
	self.Widget:SetAttribute("macrotext", nil);
	self.Widget:SetAttribute("action", nil);
	
	--Now if a valid type is passed in set it
	if (Type == "spell" or Type == "item" or Type == "macro") then
		self.Widget:SetAttribute("type", Type);
		self.Widget:SetAttribute(Type, Value);
		
	elseif (Type == "companion") then
		self.Widget:SetAttribute("type", "spell");
		self.Widget:SetAttribute("spell", Value);
		
	elseif (Type == "equipmentset") then
		self.Widget:SetAttribute("type", "macro");
		self.Widget:SetAttribute("macrotext", "/equipset "..Value);
	elseif (Type == "bonusaction") then
		self.Widget:SetAttribute("type", "action");
		self.Widget:SetAttribute("action", Value + 120);
	elseif (Type == "customaction") then
		CustomAction.SetAttributes(Value, self.Widget);
	end
end





--[[--------------------------------------------------------------------------
	Tidy up the display state for a button (does not include the icon itself)
----------------------------------------------------------------------------]]
function Button:ResetAppearance()
	self.Widget:SetChecked(0);
	
	self.WBorder:Hide();
	
	CooldownFrame_SetTimer(self.WCooldown, 0, 0, 0);
	self.WCooldown:Hide();
	
	self.WIcon:SetAlpha(1);
	self.WIcon:SetVertexColor(1.0, 1.0, 1.0);
	self.WIcon:SetTexCoord(0, 1, 0, 1);
	self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);

	self.WCount:SetText("");
	self.WName:SetText("");
	Util.RemoveMacro(self);
	Util.RemoveSpell(self);
	Util.RemoveItem(self);
	Util.RemoveBonusAction(self);
	self:RemoveFromRangeTimer();
	self:RemoveFromFlash();
	if (self.TooltipEnabled and GetMouseFocus() == self.Widget) then
		Button.OnEnterTooltip(self.Widget);
	end
end





--[[--------------------------------------------------------------------------
	Functions to do a full refresh of the display info for the Button
----------------------------------------------------------------------------]]
function Button:FullRefresh()
	self:UpdateTexture();
	self:UpdateChecked();
	self:UpdateEquipped();
	self:UpdateCooldown();
	self:UpdateUsable();
	self:UpdateTextCount();
	self:UpdateRangeTimer();
	self:UpdateFlash();
	
	self:UpdateTooltip();	

end

function Button:FullRefreshMacro()
	self:TranslateMacro();
	Button.FullRefresh(self);
end





--[[------------------------------------------------------------------------------
	Since macros have to masquerade as potentially several different types this
	function will cache what the macro currently is
--------------------------------------------------------------------------------]]
function Button:TranslateMacro()
	local Texture = select(2, GetMacroInfo(self.MacroIndex));
	--self.Texture = select(2, GetMacroInfo(self.MacroIndex));
	local Action, Target = SecureCmdOptionParse(self.MacroBody);
	self.Target = Target or "target";			--check into if this is the best thing to do or leaving it nil would be better?
	local TargetName = UnitName(self.Target);
	local TargetDead = UnitIsDead(self.Target);
	if (self.Texture ~= Texture or self.MacroAction ~= Action or self.MacroTargetName ~= TargetName or self.MacroTargetDead ~= TargetDead) then
		self.Texture = Texture;
		self.MacroAction = Action;
		self.MacroTargetName = TargetName;
		self.MacroTargetDead = TargetDead;
		local SpellName, SpellRank = GetMacroSpell(self.MacroIndex);
		if (SpellName) then
			local CompanionType, CompanionIndex = Util.LookupCompanion(SpellName);
			if (CompanionType) then
				self.CompanionType = CompanionType;
				self.CompanionIndex = CompanionIndex;
				local SpellId = select(3, GetCompanionInfo(CompanionType, CompanionIndex));
				self.CompanionSpellName = GetSpellInfo(SpellId);
				self.MacroMode = "companion";
			else
				self.SpellNameRank = Util.GetFullSpellName(SpellName, SpellRank);
				self.MacroMode = "spell";
			end
		else
			local ItemName, ItemLink = GetMacroItem(self.MacroIndex);
			if (ItemName) then
				self.ItemId = ItemName; --Util.GetItemId(ItemLink); --basically we can't easily get the id, but for the item function calls below, itemid in the context of a macro should be fine
				self.ItemName = ItemName;
				self.ItemLink = ItemLink;
				self.MacroMode = "item";
			else
				self.MacroMode = "";
			end
		end
		Button.FullRefresh(self);
	end
end





--[[---------------------------------------------------------------------------------
	Texture functions
-----------------------------------------------------------------------------------]]
function Button:UpdateTexture()

end
function Button:UpdateTextureWispSpell()
	if (UnitBuff("player", self.SpellName)) then			--NOTE: This works in en-US, hopefully it will be fine for other locales as well??
		self.WIcon:SetTexture("Interface/Icons/Spell_Nature_WispSplode");
	else
		self.WIcon:SetTexture(self.Texture);
	end
end
function Button:UpdateTextureMacro()
	self.WIcon:SetTexture(self.Texture);
end
function Button:UpdateTextureBonusAction()
	if (GetBonusBarOffset() == 5) then
		local Texture = GetActionTexture(self.BonusActionSlot);
		if (not Texture) then
			self.WIcon:SetTexture(Const.ImagesDir.."Bonus"..self.BonusActionId);
			self.WIcon:SetAlpha(0.1);
		else
			self.WIcon:SetTexture(Texture);
			self.WIcon:SetAlpha(1);
		end

	else
		self.WIcon:SetTexture(Const.ImagesDir.."Bonus"..self.BonusActionId);
		self.WIcon:SetAlpha(1);
	end
end
function Button:UpdateTextureCustomAction()
	self.WIcon:SetTexture(CustomAction.GetTexture(self.CustomActionName));
end

function Button:DisplayActive(TexCoords)
	local Icon = self.WIcon;
	
	Icon:SetTexture(self.Texture);
	self.Widget:SetNormalTexture("Interface/Buttons/UI-Quickslot2");
	if (TexCoords) then
		Icon:SetTexCoord(unpack(TexCoords));
	else
		Icon:SetTexCoord(0, 1, 0, 1);
	end
	Icon:SetVertexColor(1.0, 1.0, 1.0, 1.0);
	Icon:Show();
	
end
function Button:DisplayMissing()
	local Icon = self.WIcon;

	Icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
	self.Widget:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2");
	Icon:SetVertexColor(1.0, 1.0, 1.0, 0.5);
	Icon:Show();

end
function Button:DisplayEmpty()
	self.WIcon:Hide();
	self.Widget:SetNormalTexture("Interface/Buttons/UI-Quickslot");
	self.WCooldown:Hide();	
end






--[[--------------------------------------------------------------------------
		Checked functions
----------------------------------------------------------------------------]]
function Button:UpdateChecked()
    self.Widget:SetChecked(0);
end
function Button:UpdateCheckedSpell()
    if (IsCurrentSpell(self.SpellNameRank) or IsAutoRepeatSpell(self.SpellNameRank)) then
        self.Widget:SetChecked(1);
    else
		self.Widget:SetChecked(0);
	end
end
function Button:UpdateCheckedItem()
    if (IsCurrentItem(self.ItemId)) then
        self.Widget:SetChecked(1);
    else
		self.Widget:SetChecked(0);
	end
end
function Button:UpdateCheckedMacro()
	if (self.MacroMode == "spell") then
		self:UpdateCheckedSpell();	
	elseif (self.MacroMode == "item") then
		self:UpdateCheckedItem();	
	elseif (self.MacroMode == "companion") then
		self:UpdateCheckedCompanion();	
	else
		self.Widget:SetChecked(0);
	end
end
function Button:UpdateCheckedCompanion()
	local Active = select(5, GetCompanionInfo(self.CompanionType, self.CompanionIndex));
	local SpellName = UnitCastingInfo("player");
	self.Widget:SetChecked(Active or SpellName == self.CompanionSpellName);
end
function Button:UpdateCheckedBonusAction()
	if (GetBonusBarOffset() == 5 and (IsCurrentAction(self.BonusActionSlot) or IsAutoRepeatAction(self.BonusActionSlot))) then
		self.Widget:SetChecked(1);
	else
		self.Widget:SetChecked(0);
	end
end
function Button:UpdateCheckedCustomAction()
	self.Widget:SetChecked(CustomAction.GetChecked(self.CustomActionName));
end





--[[---------------------------------------------------------------------------------------
	Equipped functions
-----------------------------------------------------------------------------------------]]
function Button:UpdateEquipped()

end

function Button:UpdateEquippedItem()
	if (IsEquippedItem(self.ItemId)) then
		self.WBorder:SetVertexColor(0, 1.0, 0, 0.35);
		self.WBorder:Show();
	else
		self.WBorder:Hide();
	end
end
function Button:UpdateEquippedMacro()
	if (self.MacroMode == "item") then
		self:UpdateEquippedItem();
	else
		self.WBorder:Hide();
	end
end
-- In future it may be an idea to do an equip set check although I question the value






--[[-------------------------------------------------------------------------------------------
	Cooldown functions	(great care is needed with the cooldowns...)
---------------------------------------------------------------------------------------------]]
function Button:UpdateCooldown()

end
function Button:UpdateCooldownSpell()
	local Start, Duration, Enable = GetSpellCooldown(self.SpellNameRank);
	if (Start ~= nil) then
		CooldownFrame_SetTimer(self.WCooldown, Start, Duration, Enable);
	else
		CooldownFrame_SetTimer(self.WCooldown, 0, 0, 0);
		self.WCooldown:Hide();
	end
end
function Button:UpdateCooldownItem()
	CooldownFrame_SetTimer(self.WCooldown, GetItemCooldown(self.ItemId));
end
function Button:UpdateCooldownMacro()
	if (self.MacroMode == "spell") then
		self:UpdateCooldownSpell();	
	elseif (self.MacroMode == "item") then
		self:UpdateCooldownItem();	
	elseif (self.MacroMode == "companion") then
		self:UpdateCooldownCompanion();	
	else
		CooldownFrame_SetTimer(self.WCooldown, 0, 0, 0);
		self.WCooldown:Hide();
	end
end
function Button:UpdateCooldownCompanion()
	CooldownFrame_SetTimer(self.WCooldown, GetCompanionCooldown(self.CompanionType, self.CompanionIndex));
end
function Button:UpdateCooldownBonusAction()
	if (GetBonusBarOffset() == 5) then
		CooldownFrame_SetTimer(self.WCooldown, GetActionCooldown(self.BonusActionSlot));
	else
		self.WCooldown:Hide();
	end
end




--[[-------------------------------------------------------------------------------------
	Usable Functions
---------------------------------------------------------------------------------------]]
function Button:UpdateUsable()

end
function Button:UpdateUsableSpell()
	local IsUsable, NotEnoughMana = IsUsableSpell(self.SpellNameRank);
	if (IsUsable) then
		self.WIcon:SetVertexColor(1.0, 1.0, 1.0);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	elseif (NotEnoughMana) then
		self.WIcon:SetVertexColor(0.5, 0.5, 1.0);
		self.WNormalTexture:SetVertexColor(0.5, 0.5, 1.0);
	else
		self.WIcon:SetVertexColor(0.4, 0.4, 0.4);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	end
end
function Button:UpdateUsableItem()
	local IsUsable, NotEnoughMana = IsUsableItem(self.ItemId);
	if (IsUsable) then
		self.WIcon:SetVertexColor(1.0, 1.0, 1.0);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	elseif (NotEnoughMana) then
		self.WIcon:SetVertexColor(0.5, 0.5, 1.0);
		self.WNormalTexture:SetVertexColor(0.5, 0.5, 1.0);
	else
		self.WIcon:SetVertexColor(0.4, 0.4, 0.4);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	end
end
function Button:UpdateUsableMacro()
	if (self.MacroMode == "spell") then
		self:UpdateUsableSpell();
	elseif (self.MacroMode == "item") then
		self:UpdateUsableItem();	
	elseif (self.MacroMode == "companion") then
		self:UpdateUsableCompanion();
	else
		self.WIcon:SetVertexColor(1.0, 1.0, 1.0);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	end
end
function Button:UpdateUsableCompanion()
	local IsUsable, NotEnoughMana = IsUsableItem(self.ItemName);
	if (self.CompanionType == "MOUNT" and IsIndoors()) then
		self.WIcon:SetVertexColor(0.4, 0.4, 0.4);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	else
		self.WIcon:SetVertexColor(1.0, 1.0, 1.0);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	end
end
function Button:UpdateUsableBonusAction()
	
	local IsUsable, NotEnoughMana = IsUsableAction(self.BonusActionSlot);
	if (IsUsable or GetBonusBarOffset() ~= 5) then
		self.WIcon:SetVertexColor(1.0, 1.0, 1.0);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	elseif (NotEnoughMana) then
		self.WIcon:SetVertexColor(0.5, 0.5, 1.0);
		self.WNormalTexture:SetVertexColor(0.5, 0.5, 1.0);
	else
		self.WIcon:SetVertexColor(0.4, 0.4, 0.4);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	end
end
function Button:UpdateUsableCustomAction()
	local IsUsable, NotEnoughMana = CustomAction.IsUsable(self.CustomActionName);
	if (IsUsable) then
		self.WIcon:SetVertexColor(1.0, 1.0, 1.0);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	elseif (NotEnoughMana) then
		self.WIcon:SetVertexColor(0.5, 0.5, 1.0);
		self.WNormalTexture:SetVertexColor(0.5, 0.5, 1.0);
	else
		self.WIcon:SetVertexColor(0.4, 0.4, 0.4);
		self.WNormalTexture:SetVertexColor(1.0, 1.0, 1.0);
	end
end



--[[----------------------------------------------------------------------------
	Text functions
------------------------------------------------------------------------------]]
function Button:UpdateTextCount()

end
function Button:UpdateTextCountSpell()
	self.WCount:SetText(GetSpellCount(self.SpellNameRank));
end
function Button:UpdateTextCountItem()
	local ItemCount = GetItemCount(self.ItemId);
	if (IsConsumableItem(self.ItemId) or ItemCount > 1) then
		self.WCount:SetText(ItemCount);
	else
		self.WCount:SetText("");
	end
end
function Button:UpdateTextCountBonusAction()
	if (GetBonusBarOffset() == 5 and (IsConsumableAction(self.BonusActionSlot) or IsStackableAction(self.BonusActionSlot))) then
		self.WCount:SetText(GetActionCount(self.BonusActionSlot));
	else
		self.WCount:SetText("");
	end
end






function Button:UpdateTooltip()

end

function Button:UpdateTooltipFunc()

end

function Button:UpdateTooltipSpell()
	self = self.ParentButton or self;	--This is a sneaky cheat incase the widget was used to get here...
	local Index, BookType = Util.LookupSpellIndex(self.SpellNameRank);

	if (Index) then
		GameTooltip:SetSpell(Index, BookType);
	end
end
function Button:UpdateTooltipItem()
	self = self.ParentButton or self;	--This is a sneaky cheat incase the widget was used to get here...
	local EquippedSlot = Util.LookupItemIdEquippedSlot(self.ItemId);
	if (EquippedSlot ~= nil) then
		GameTooltip:SetInventoryItem("player", EquippedSlot);
	else
		local Bag, BagSlot = Util.LookupItemIdBagSlot(self.ItemId);
		if (Bag ~= nil) then
			GameTooltip:SetBagItem(Bag, BagSlot);
		else
			GameTooltip_SetDefaultAnchor(GameTooltip, self.Widget);		--It appears that the sethyperlink (specifically this one) requires that the anchor be constantly refreshed!?
			GameTooltip:SetHyperlink(self.ItemLink);
		end
	end
end
function Button:UpdateTooltipMacro()
	self = self.ParentButton or self;	--This is a sneaky cheat incase the widget was used to get here...

	if (self.MacroMode == "spell") then
		local Index, BookType = Util.LookupSpellIndex(self.SpellNameRank);
		if (Index) then
			GameTooltip:SetSpell(Index, BookType);
		end
	elseif (self.MacroMode == "item") then
		local EquippedSlot = Util.LookupItemNameEquippedSlot(self.ItemId);
		if (EquippedSlot ~= nil) then
			GameTooltip:SetInventoryItem("player", EquippedSlot);
		else
			local Bag, BagSlot = Util.LookupItemNameBagSlot(self.ItemId);
			if (Bag ~= nil) then
				GameTooltip:SetBagItem(Bag, BagSlot);
			else
				GameTooltip_SetDefaultAnchor(GameTooltip, self.Widget);		--It appears that the sethyperlink (specifically this one) requires that the anchor be constantly refreshed!?
				GameTooltip:SetHyperlink(self.ItemLink);
			end
		end
	elseif (self.MacroMode == "companion") then
		local Id, Name, SpellId = GetCompanionInfo(self.CompanionType, self.CompanionIndex);
		GameTooltip:SetHyperlink("spell:"..SpellId);
	end
end
function Button:UpdateTooltipCompanion()
	self = self.ParentButton or self;	--This is a sneaky cheat incase the widget was used to get here...

	local Id, Name, SpellId = GetCompanionInfo(self.CompanionType, self.CompanionIndex);
	GameTooltip_SetDefaultAnchor(GameTooltip, self.Widget);

	GameTooltip:SetHyperlink("spell:"..SpellId);
end
function Button:UpdateTooltipEquipmentSet()
	self = self.ParentButton or self;	--This is a sneaky cheat incase the widget was used to get here...

	GameTooltip:SetEquipmentSet(self.EquipmentSetName);
end
function Button:UpdateTooltipBonusAction()
	self = self.ParentButton or self;	--This is a sneaky cheat incase the widget was used to get here...

	if (GetBonusBarOffset() == 5) then
		GameTooltip:SetAction(self.BonusActionSlot);
	else
		GameTooltip:SetText(self.Tooltip, nil, nil, nil, nil, 1);
	end
end
function Button:UpdateTooltipCustomAction()
	self = self.ParentButton or self;	--This is a sneaky cheat incase the widget was used to get here...

	CustomAction.UpdateTooltip(self.CustomActionName);
end




--[[---------------------------------------------------------------------
	Cursor functions
-----------------------------------------------------------------------]]
function Button:GetCursor()

end
function Button:GetCursorSpell()
	return self.Mode, self.SpellNameRank, nil;
end
function Button:GetCursorItem()
	return self.Mode, self.ItemId, nil;
end
function Button:GetCursorMacro()
	return self.Mode, self.MacroIndex, nil;
end
function Button:GetCursorCompanion()
	return self.Mode, self.CompanionIndex, self.CompanionType;
end
function Button:GetCursorEquipmentSet()
	return self.Mode, self.EquipmentSetName, nil;
end
function Button:GetCursorBonusAction()
	return self.Mode, self.BonusActionId, nil;
end
function Button:GetCursorCustomAction()
	return self.Mode, self.CustomActionName, nil;
end




--[[------------------------------------------------------------------------
		Flash functions
--------------------------------------------------------------------------]]
function Button:UpdateFlash()

end
function Button:UpdateFlashSpell()
	if ((IsAttackSpell(self.SpellNameRank) and IsCurrentSpell(self.SpellNameRank)) or IsAutoRepeatSpell(self.SpellNameRank)) then
		if (not self.FlashOn) then
			self:AddToFlash();
		end
	elseif (self.FlashOn) then
		self:RemoveFromFlash();
	end
end
function Button:UpdateFlashMacro()
	if (self.MacroMode == "spell") then
		self:UpdateFlashSpell();
	elseif (self.FlashOn) then
		self:RemoveFromFlash();
	end
end
function Button:UpdateFlashBonusAction()
	if (GetBonusBarOffset() == 5 and ((IsAttackAction(self.BonusActionSlot) and IsCurrentAction(self.BonusActionSlot)) or IsAutoRepeatAction(self.BonusActionSlot))) then
		if (not self.FlashOn) then
			self:AddToFlash();
		end
	elseif (self.FlashOn) then
		self:RemoveFromFlash();
	end
end
function Button:AddToFlash()
	Util.AddToFlash(self);
	self.FlashOn = true;
end
function Button:RemoveFromFlash()
	Util.RemoveFromFlash(self);
	self.FlashOn = false;
	self.WFlashTexture:Hide();
end

function Button:FlashShow()
	self.WFlashTexture:Show();
end

function Button:FlashHide()
	self.WFlashTexture:Hide();
end





--[[------------------------------------------------------------------------
		Range Timer functions
--------------------------------------------------------------------------]]
function Button:UpdateRangeTimer()
	
end
function Button:UpdateRangeTimerSpell()
	if (IsSpellInRange(self.SpellNameRank, self.Target)) then
		if (not self.RangeTimerOn) then
			self:AddToRangeTimer();
		end
	elseif (self.RangeTimerOn) then
		self:RemoveFromRangeTimer();
	end
end
function Button:UpdateRangeTimerItem()
	if (IsItemInRange(self.ItemId, self.Target)) then
		if (not self.RangeTimerOn) then
			self:AddToRangeTimer();
		end
	elseif (self.RangeTimerOn) then
		self:RemoveFromRangeTimer();
	end
end
function Button:UpdateRangeTimerMacro()
	if (self.MacroMode == "spell") then
		self:UpdateRangeTimerSpell();
	elseif (self.MacroMode == "item") then
		self:UpdateRangeTimerItem();
	elseif (self.RangeTimerOn) then
		self:RemoveFromRangeTimer();
	end
end
function Button:UpdateRangeTimerBonusAction()
	if (GetBonusBarOffset() == 5 and IsActionInRange(self.BonusActionSlot)) then
		if (not self.RangeTimerOn) then
			self:AddToRangeTimer();
		end
	elseif (self.RangeTimerOn) then
		self:RemoveFromRangeTimer();
	end
end

function Button:AddToRangeTimer()
	Util.AddToRangeTimer(self);
	self.RangeTimerOn = true;
	if (self.WHotKey:GetText() == RANGE_INDICATOR) then
		self.WHotKey:Show();
	end
	self:CheckRangeTimer();
end
function Button:RemoveFromRangeTimer()
	Util.RemoveFromRangeTimer(self);
	self.RangeTimerOn = false;
	if (self.WHotKey:GetText() == RANGE_INDICATOR) then
		self.WHotKey:Hide();
	else
		self.WHotKey:SetVertexColor(0.6, 0.6, 0.6);
	end
end

function Button:CheckRangeTimerSpell()
	if (IsSpellInRange(self.SpellNameRank, self.Target) == 1) then
		self.WHotKey:SetVertexColor(0.6, 0.6, 0.6);
	else
		self.WHotKey:SetVertexColor(1.0, 0.1, 0.1);
	end
end
function Button:CheckRangeTimerItem()
	if (IsItemInRange(self.ItemId, self.Target) == 1) then
		self.WHotKey:SetVertexColor(0.6, 0.6, 0.6);
	else
		self.WHotKey:SetVertexColor(1.0, 0.1, 0.1);
	end
end
function Button:CheckRangeTimerMacro()
	if (self.MacroMode == "spell") then
		self:CheckRangeTimerSpell();
	elseif (self.MacroMode == "item") then
		self:CheckRangeTimerItem();
	else
		self:RemoveFromRangeTimer();
	end
end
function Button:CheckRangeTimerBonusAction()
	if (IsActionInRange(self.BonusActionSlot) == 1) then
		self.WHotKey:SetVertexColor(0.6, 0.6, 0.6);
	else
		self.WHotKey:SetVertexColor(1.0, 0.1, 0.1);
	end
end




--[[--------------------------------------------------------------------------

----------------------------------------------------------------------------]]


--[[
		Make sure the Macro is up to date
--]]
function Button:RefreshMacro()
	if (InCombatLockdown()) then
		return;
	end
	
	if (self.Mode == "macro") then
		local Index = GetMacroIndexByName(self.MacroName);
		if (Index == 0) then
			local AccMacros, CharMacros = GetNumMacros();
			for i = 1, AccMacros do
				local Body = GetMacroBody(i);
				local info = GetMacroInfo(i);

				if (Body == self.MacroBody) then
					self:SetCommandMacro(i);
					self:FullRefresh();
					return;
				end
			end
			for i = Const.MAX_ACCOUNT_MACROS + 1, Const.MAX_ACCOUNT_MACROS + CharMacros do
				local Body = GetMacroBody(i);
				local info = GetMacroInfo(i);

				if (Body == self.MacroBody) then
					self:SetCommandMacro(i);
					self:FullRefresh();
					return;
				end
			end
			
			self:ClearCommand();
			self:FullRefresh();
		else
			self:SetCommandMacro(Index);		--Although the macro may not have changed, the easiest thing is to simply refresh it
			self:FullRefresh();
		end
	end
end


--[[
		
--]]
function Button:PromoteSpell()
	if (InCombatLockdown()) then
		return;
	end
	
	if (self.Mode == "spell") then
		local Name, Rank = GetSpellInfo(self.SpellName);		--This will actually retrieve for the highest rank of the spell
		if (Name) then
			if (Util.LookupNewSpellIndex(Name.."("..Rank..")")) then
				if (strfind(Rank, Util.GetLocaleString("SpellRank"), 1, true) and strfind(self.SpellNameRank, Util.GetLocaleString("SpellRank"), 1, true)) then
					if (Name.."("..Rank..")" ~= self.SpellNameRank) then
						self:SetCommandSpell(Util.LookupNewSpellIndex(Name.."("..Rank..")"));	--It is important to note that to get here we have a valid spell
						self:FullRefresh();
					end
				end
			end
		end
	end
end
function Button:RefreshSpell()
	--in the case of a spell refresh we just need to make sure the texture reflects its current status
	if (self.Mode == "spell") then
		self.Texture = GetSpellTexture(self.SpellNameRank);
		self.Texture = self.Texture or "Interface/Icons/INV_Misc_QuestionMark";
		self:DisplayActive();
	end
end

function Button:RefreshCompanion()
	if (InCombatLockdown()) then
		return;
	end
	if (self.Mode == "companion") then
		local Type, Index = Util.LookupCompanion(self.CompanionName);
		if (Index ~= self.CompanionIndex) then
			self:SetCommandCompanion(Index, Type);
			self:FullRefresh();
		end
	end
end

function Button:RefreshEquipmentSet()
	if (InCombatLockdown()) then
		return;
	end
	if (self.Mode == "equipmentset") then
		local TextureName = GetEquipmentSetInfoByName(self.EquipmentSetName);
		if (TextureName) then
			self.Texture = "Interface/Icons/"..TextureName;
			self:DisplayActive();
		else
			self:ClearCommand();
		end
	end
end


--[[
--			Empty functions
--																]]
function Button:Empty()

end
