--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
	Notes:
]]

local Util 		= BFUtil;
local Const 	= BFConst;
local UILib 	= BFUILib;
local CustomAction = BFCustomAction;
local Button 	= BFButton;
local Bar		= BFBar;
local EventFull	= BFEventFrames["Full"];
local ConfigureLayer = BFConfigureLayer;
local DestroyBarOverlay = BFDestroyBarOverlay;

--This will get the currently applicable locale, or allocate it if needed (note that locales other than enUS will need the metatable set)
BFLocales[GetLocale()] = BFLocales[GetLocale()] or {};
local Locale = BFLocales[GetLocale()];
if (GetLocale() ~= "enUS") then
	setmetatable(Locale, BFLocales["enUS"]);
end


Util.ActiveButtons = {};
Util.InactiveButtons = {};
Util.ActiveMacros = {};
Util.ActiveSpells = {};
Util.ActiveItems = {};
Util.ActiveBonusActions = {};

Util.RangeTimerButtons = {};
Util.FlashButtons = {};

Util.ActiveBars = {};
Util.InactiveBars = {};

Util.ActiveTabs = {};
Util.InactiveTabs = {};

Util.SpellIndex = {};
Util.SpellMana = {};
Util.NewSpellIndex = {};

Util.PetSpellIndex = {};
Util.NewPetSpellIndex = {};

Util.BagItemNameIndex = {};
Util.BagItemIdIndex = {};
Util.InvItemNameIndex = {};
Util.InvItemIdIndex = {};

Util.GridHidden = true;

--[[
	Make sure that the saved data is kept inline with the version being run
--]]
function Util.UpdateSavedData()
	
	--Need to allocate save structure
	if (not ButtonForgeSave) then
		--Swap v0.9.0 / v0.9.1 / v0.9.2 users to the new save structure
		if (type(BFSave) == "table" and BFSave["Version"] and BFSave["VersionMinor"] and
			BFSave["Version"] == 0.9 and BFSave["VersionMinor"] <= 2) then
			--the above test checks if a legitimate ButtonForge BFSave exists before we adopt it to the new table name
			ButtonForgeSave = BFSave;
			BFSave = nil;
		else
			ButtonForgeSave = {};
			ButtonForgeSave["ConfigureMode"] = true;
			ButtonForgeSave["AdvancedMode"] = false;
			ButtonForgeSave["RightClickSelfCast"] = false;
			ButtonForgeSave["Version"] = Const.Version;
			ButtonForgeSave["VersionMinor"] = Const.VersionMinor;
			ButtonForgeSave.Bars = {};
		end
		ButtonForgeSave["AddonName"] = "Button Forge";
	end
	
	--v0.9.3 update
	if (ButtonForgeSave["Version"] == 0.9 and ButtonForgeSave["VersionMinor"] < 3) then
		for i = 1, #ButtonForgeSave.Bars do
			ButtonForgeSave.Bars[i]["HBonusBar"] = true;
		end
		ButtonForgeSave["VersionMinor"] = 3;
		DEFAULT_CHAT_FRAME:AddMessage(Util.GetLocaleString("UpgradedChatMsg").."v0.9.3", .5, 1, 0, 1);
	end
	
	--Bring v up to the latest version
	if (ButtonForgeSave["Version"] < Const.Version) then
		ButtonForgeSave["Version"] = Const.Version;
		ButtonForgeSave["VersionMinor"] = Const.VersionMinor;
		DEFAULT_CHAT_FRAME:AddMessage(Util.GetLocaleString("UpgradedChatMsg").."v"..Const.Version.."."..Const.VersionMinor, .5, 1, 0, 1);
	elseif (ButtonForgeSave["Version"] == Const.Version and ButtonForgeSave["VersionMinor"] < Const.VersionMinor) then
		ButtonForgeSave["VersionMinor"] = Const.VersionMinor;
		DEFAULT_CHAT_FRAME:AddMessage(Util.GetLocaleString("UpgradedChatMsg").."v"..Const.Version.."."..Const.VersionMinor, .5, 1, 0, 1);
	end
end

--[[
		Load the bars and buttons from the saved addon values
--]]
function Util.Load()

	if (ButtonForgeSave.ConfigureMode) then
		ConfigureLayer:Show();
	end
	if (ButtonForgeSave.AdvancedMode) then
		UILib.ToggleAdvancedTools();
	end
	for i = 1, #ButtonForgeSave.Bars do
		Util.NewBar(0, 0, ButtonForgeSave.Bars[i]);
	end
	UILib.ToggleRightClickSelfCast(ButtonForgeSave["RightClickSelfCast"] or false);
	Util.Loaded = true;
	Util.RefreshOnUpdateFunction();
end



--[[
		Button Allocation Functions
--]]
function Util.NewButton(Parent, ButtonSave, ButtonLocked, TooltipOn)
	if (InCombatLockdown()) then
		return;
	end
	local NewButton;
	if (#(Util.InactiveButtons) > 0) then
		NewButton = table.remove(Util.InactiveButtons);				
		NewButton:Configure(Parent, ButtonSave, ButtonLocked, TooltipOn);
	else
		NewButton = Button.New(Parent, ButtonSave, ButtonLocked, TooltipOn);
	end

	table.insert(Util.ActiveButtons, NewButton);
	return NewButton;
end

function Util.DeallocateButton(Value)
	if (InCombatLockdown()) then
		return;
	end
	Value:Deallocate();
	table.remove(Util.ActiveButtons, Util.FindInTable(Util.ActiveButtons, Value));
	table.insert(Util.InactiveButtons, Value);
end



--[[
		Bar Allocation Functions
--]]
function Util.NewBarSave()
	local Save = {};
	Save["Left"]	= 0;
	Save["Top"]		= 0;
	Save["Scale"]	= 1;
	Save["Order"]	= #Util.ActiveBars;
	Save["Label"]	= nil;
	Save["Rows"]	= Const.DefaultRows;
	Save["Cols"]	= Const.DefaultCols;
	Save["VDriver"]	= nil;
	Save["HVehicle"]	= true;
	Save["HSpec1"]	= false;
	Save["HSpec2"]	= false;
	Save["HBonusBar"] = true;
	Save["GridAlwaysOn"] = true;
	Save["ButtonsLocked"] = false;
	Save["TooltipsOn"] = true;
	Save["BonusBar"] = false;
	Save["Buttons"]	= {};
	
	return Save;
end

function Util.NewBar(Left, Top, BarSave)
	if (InCombatLockdown()) then
		return;
	end
	local NewBar;
	
	if (not BarSave) then
		BarSave = Util.NewBarSave();
		BarSave["Left"] = Left;
		BarSave["Top"] = Top;
		table.insert(ButtonForgeSave.Bars, BarSave);
		PlaySoundFile("Sound\\Interface\\Pickup\\Putdownsmallmetal.Wav");
		--PlaySoundFile("Sound\\Item\\Weapons\\Mace2h\\2hmacehitplate1a.Wav");
	end
	
	if (#(Util.InactiveBars) > 0) then
		NewBar = table.remove(Util.InactiveBars);
		NewBar:Configure(BarSave);
	else
		NewBar = Bar.New(BarSave);
	end
	
	table.insert(Util.ActiveBars, NewBar);
	if (NewBar.Cols * NewBar.Rows == 0) then
		--Failed to allocate buttons, get rid of the bar
		NewBar:Deallocate();
		return nil;
	else
		Util.RefreshTab(NewBar.ControlFrame:GetLeft(), NewBar.ControlFrame:GetTop());
		return NewBar;
	end
end

function Util.NewBonusBar(Left, Top)
	if (InCombatLockdown()) then
		return;
	end
	local BarSave = Util.NewBarSave();
	BarSave["BonusBar"] = true;
	BarSave["Left"] = Left;
	BarSave["Top"] = Top;
	BarSave["Rows"] = 1;
	BarSave["Cols"] = 14;
	BarSave["HBonusBar"] = false;
	BarSave["HVehicle"] = false;
	BarSave["VDriver"] = "[bonusbar:5] show; hide";
	BarSave["ButtonsLocked"] = true;
	BarSave["GridAlwaysOn"] = false;
	table.insert(ButtonForgeSave.Bars, BarSave);
	PlaySoundFile("Sound\\Interface\\Pickup\\Putdownsmallmetal.Wav");
	return Util.NewBar(Left, Top, BarSave);
end

function Util.DeallocateBar(Value)
	if (InCombatLockdown()) then
		return;
	end
	Value:Deallocate();		--Note that deallocating a bar will call a function that changes the bars state (primarily it removes all buttons, and changes it's order... both of which change the save state data)
	table.remove(Util.ActiveBars, Util.FindInTable(Util.ActiveBars, Value));
	table.remove(ButtonForgeSave.Bars, Util.FindInTable(ButtonForgeSave.Bars, Value.BarSave));
	table.insert(Util.InactiveBars, Value);
	local Left, Top = Value.ControlFrame:GetLeft(), Value.ControlFrame:GetTop();
	Util.RefreshTab(Left, Top);
end



--[[
	Bar Management Functions
--]]
function Util.ReorderBar(Bar, NewPosition)
	local CurrentPosition = Bar.BarSave["Order"];
	local Order;
	if (CurrentPosition > NewPosition) then
		for i = 1, #Util.ActiveBars do
			Order = Util.ActiveBars[i].BarSave["Order"];
			if (Order < CurrentPosition and Order >= NewPosition) then
				Util.ActiveBars[i]:SetOrder(Order + 1);
			end
		end
	elseif (CurrentPosition < NewPosition) then
		for i = 1, #Util.ActiveBars do
			Order = Util.ActiveBars[i].BarSave["Order"];
			if (Order > CurrentPosition and Order <= NewPosition) then
				Util.ActiveBars[i]:SetOrder(Order - 1);
			end
		end
	end
	Bar:SetOrder(NewPosition);
end

function Util.DockCoords(Left, Top, ExcludeBar)
	local CLeft, CTop, CDist, CBar = 0, 0, 100000000, nil;	--This is an arbitrary number that will be big enough here
	local Dist, X, Y;
	local Bars = Util.ActiveBars;
	for i = 1, #Bars do
		X = Bars[i].ControlFrame:GetLeft();--BarSave["Left"];
		Y = Bars[i].ControlFrame:GetTop();--BarSave["Top"];
		Dist = ((Left - X) ^ 2)+ ((Top - Y) ^ 2);
		if (Dist < CDist and Bars[i] ~= ExcludeBar) then
			CLeft = X;
			CTop = Y;
			CDist = Dist;
			CBar = Bars[i];
		end
	end
	return CLeft, CTop, CDist, CBar;
end

--[[ While the Configure overlay is shown make sure that all bars are visible (unless in combat), this function also cleansup when the overlay is hidden again --]]
function Util.VDriverOverride()
	if (InCombatLockdown()) then
		return;
	end
	local Bars = Util.ActiveBars;
	if (ConfigureLayer:IsShown() or DestroyBarOverlay:IsShown()) then
		for i = 1, #Bars do
			Bars[i]:SetTempShowVD();
		end
	else
		for i = 1, #Bars do
			Bars[i]:ClearTempShowVD();
		end
	end
end

function Util.RefreshGridStatus()
	local Hide;
	Hide = Util.InCombat or not (Util.CursorAction or ConfigureLayer:IsShown() or DestroyBarOverlay:IsShown());
	if (Hide ~= Util.GridHidden) then
		Util.GridHidden = Hide;
		local Bars = Util.ActiveBars;
		if (Hide) then
			for i = 1, #Bars do
				if (not Bars[i].BarSave["GridAlwaysOn"]) then
					Bars[i]:GridHide();
				end
			end
		else
			for i = 1, #Bars do
				if (not Bars[i].BarSave["GridAlwaysOn"]) then
					Bars[i]:GridShow();
				end
			end
		end
	end
end

function Util.RefreshTab(Left, Top)

	local Count = 0;
	local Bar;
	local StackedBar;
	local Label;
	for i = 1, #Util.ActiveBars do
		Bar = Util.ActiveBars[i];
		if (Bar.BarSave.Label == "fdg" or Bar.BarSave.Label == "Cat bar") then
			--print(Bar.BarSave.Label, Bar.ControlFrame:GetLeft(), Bar.ControlFrame:GetTop(), Left, Top);
		end
		
		if (math.abs(Bar.ControlFrame:GetLeft() - Left) < 0.01 and math.abs(Bar.ControlFrame:GetTop() - Top) < 0.01) then
			Count = Count + 1;
			StackedBar = Bar;
		end
	end

	if (Count == 0) then
		return;
	end
	if (Count == 1) then
		--Set it's label back in and dealloc the tabframe
		StackedBar.Tabbed = false;
		Label = StackedBar.LabelFrame;
		Label:ClearAllPoints();
		Label:SetPoint("TOPLEFT", StackedBar.TopIconsFrame, "TOPLEFT", Const.BarInset, -Const.BarEdge); --Const.MiniIconSize + Const.MiniIconGap +Const.BarEdge, -Const.BarEdge);
		Label:SetBackdropColor(0, 0, 0, 1);
		Label:SetAlpha(1);
		Label:EnableMouse(false);
		Label:SetScript("OnMouseDown", nil);
		Label:SetScript("OnEnter", nil);
		Label:SetScript("OnLeave", nil);
		Util.DeallocateTab(Left, Top);
		StackedBar:ReflowUI();
		return;
	end
	
	local Offset = 0;
	local HighestBar;
	local TabFrame = Util.GetTabFrame(Left, Top);
	for i = 1, #Util.ActiveBars do
		Bar = Util.ActiveBars[i];
		if (math.abs(Bar.ControlFrame:GetLeft() - Left) < 0.01 and math.abs(Bar.ControlFrame:GetTop() - Top) < 0.01) then
			if (not HighestBar) then
				--anchor tabframe
				HighestBar = Bar;
				TabFrame:ClearAllPoints();
				TabFrame:SetPoint("TOPLEFT", Bar.ControlFrame, "TOPLEFT", 0, Const.MiniIconSize);
			elseif (HighestBar.BarSave["Order"] < Bar.BarSave["Order"]) then
				HighestBar = Bar;
			end
			Bar.Tabbed = true;
			Label = Bar.LabelFrame;
			Label:ClearAllPoints();
			Label:SetPoint("TOPLEFT", TabFrame, "TOPLEFT", Offset, 0);
			Label:SetBackdropColor(0, 0, 0, 1);
			Label:SetAlpha(.5);
			Label:EnableMouse(true);
			Label:SetScript("OnMouseDown", Bar.SendToFront);
			Label:SetScript("OnEnter", Bar.LabelOnEnter);
			Label:SetScript("OnLeave", Bar.LabelOnLeave);
			if (Label:GetWidth() > 4.5) then
				Offset = Offset + Label:GetWidth();
			end
			Bar:ReflowUI();
		end
	end
	TabFrame:SetSize(Offset, Const.MiniIconSize);
	Label = HighestBar.LabelFrame;
	Label:SetAlpha(1);
	--Label:SetScript("OnMouseDown", nil);
	Label:SetScript("OnEnter", nil);
	Label:SetScript("OnLeave", nil);
end

function Util.DeallocateTab(Left, Top)
	if (Util.ActiveTabs[Left.." "..Top]) then
		table.insert(Util.InactiveTabs, Util.ActiveTabs[Left.." "..Top]);
		Util.ActiveTabs[Left.." "..Top] = nil;
	end
end

function Util.GetTabFrame(Left, Top)
	if (not Util.ActiveTabs[Left.." "..Top]) then
		if (#Util.InactiveTabs > 0) then
			Util.ActiveTabs[Left.." "..Top] = table.remove(Util.InactiveTabs);
		else
			Util.ActiveTabs[Left.." "..Top] = CreateFrame("FRAME", nil, ConfigureLayer);
			Util.ActiveTabs[Left.." "..Top]:SetSize(1, 1);
			Util.ActiveTabs[Left.." "..Top]:SetClampedToScreen(true);
		end
	end
	return Util.ActiveTabs[Left.." "..Top];
end

function Util.BarHasButton(Bar, Command, Data, Subvalue)
	local BCommand, BData, BSubvalue
	for i = 1, #Bar.Buttons do
		BCommand, BData, BSubvalue = Bar.Buttons[i]:GetCursor();
		if (Command == BCommand and Data == BData and Subvalue == BSubvalue) then
			return true;
		end
	end
	return false;
end



--[[
		Helper functions
--]]
function Util.FindInTable(Table, Value)
	for i = 1, #Table do
		if (Table[i] == Value) then
			return i;
		end
	end
	return nil;
end

function Util.GetLocaleString(Value)
	return Locale[Value];
end

--[[ Store cursor type info for later use --]]
function Util.StoreCursor(Command, Data, Subvalue)
	Util.Command = Command;
	Util.Data = Data;
	Util.Subvalue = Subvalue;
end

function Util.GetStoredCursor()
	return Util.Command, Util.Data, Util.Subvalue;
end

--[[ Set the cursor based on the triplet passed in --]]
function Util.SetCursor(Command, Data, Subvalue)
	ClearCursor();
	UILib.StopDraggingIcon();
	if (Command == "spell") then
		PickupSpell(Data);
	elseif (Command == "item") then
		PickupItem(Data);
	elseif (Command == "macro") then
		PickupMacro(Data);
	elseif (Command == "companion") then
		PickupCompanion(Subvalue, Data);
	elseif (Command == "equipmentset") then
		PickupEquipmentSetByName(Data);
	elseif (Command == "bonusaction") then
		local Texture = GetActionTexture(Data + 120);
		if (Texture and GetBonusBarOffset() == 5) then
			UILib.StartDraggingIcon(Texture, 23, 23, "bonusaction", Data);
		else
			UILib.StartDraggingIcon(Const.ImagesDir.."Bonus"..Data, 23, 23, "bonusaction", Data);
		end
	elseif (Command == "customaction") then
		CustomAction.SetCursor(Data);
	end
end

--[[ These two functions will take care of non secure gui updates when the player enters or exits combat ]]--
function Util.PreCombatStateUpdate()
	Util.InCombat = true;
	Util.RefreshGridStatus();
	UILib.ToggleCreateBarMode(true);
	UILib.ToggleDestroyBarMode(true);
end

function Util.PostCombatStateUpdate()
	Util.InCombat = false;
	Util.VDriverOverride();
	Util.RefreshGridStatus();
	
	if (Util.DelayedRefreshMacros) then
		Util.RefreshMacros();
		Util.DelayedRefreshMacros = nil;
	end
	if (Util.DelayedPromoteSpells) then
		Util.PromoteSpells();
		Util.DelayedPromoteSpells = nil;
	end
	if (Util.DelayedRefreshCompanions) then
		Util.RefreshCompanions();
		Util.DelayedRefreshCompanions = nil;
	end
	if (Util.DelayedRefreshEquipmentSets) then
		Util.RefreshEquipmentSets();
		Util.DelayedRefreshEquipmentSets = nil;
	end

end

--[[ Add and remove buttons to a list that gets updated for the range timer --]]
function Util.AddToRangeTimer(Value)
	if (#Util.RangeTimerButtons == 0) then
		--BF
	end
	Util.RangeTimerButtons[Value] = true;
end

function Util.RemoveFromRangeTimer(Value)
	Util.RangeTimerButtons[Value] = nil;
end

--[[ Add and remove buttons to a list that gets updated for flashing --]]
function Util.AddToFlash(Value)
	if (#Util.FlashButtons == 0) then
		--BF
	end
	Util.FlashButtons[Value] = true;
end

function Util.RemoveFromFlash(Value)
	Util.FlashButtons[Value] = nil;
end

function Util.RightClickSelfCast(Value)
	if (InCombatLockdown()) then
		return;
	end
	
	if (Value) then
		for i = 1, #Util.ActiveButtons do
			Util.ActiveButtons[i].Widget:SetAttribute("unit2", "player");
		end
	else
		for i = 1, #Util.ActiveButtons do
			Util.ActiveButtons[i].Widget:SetAttribute("unit2", nil);
		end	
	end
	
	ButtonForgeSave["RightClickSelfCast"] = Value;
end





--[[---------------------------------------
	Spell Functions
-------------------------------------------]]
function Util.GetFullSpellName(Name, Rank)
	if (Name) then
		return Name.."("..Rank..")";
	end
end

function Util.GetSpellId(NameRank)
	local Link = GetSpellLink(NameRank);
	return select(3, strfind(Link, "spell:(%d+)|"));
end

function Util.CacheSpellIndexes()
	local i = 1;
	local NewSI = {};
	local NewSM = {-10000000, 10000000};
	local ManaPoints = {};
	Util.NewSpellIndex = {};
	while true do
		local Name, Rank, Icon, PowerCost, IsFunnel, PowerType = GetSpellInfo(i, BOOKTYPE_SPELL);
		local NameRank = Util.GetFullSpellName(Name, Rank);

		if (not NameRank) then
			break;
		end
		if (not Util.SpellIndex[NameRank]) then
			Util.NewSpellIndex[NameRank] = i;
		end
		if (PowerType == 0 and not ManaPoints[Power]) then
			ManaPoints[PowerCost] = true;
			table.insert(NewSM, PowerCost);
		end
		NewSI[NameRank] = i;
		i = i + 1;
	end
--	local total = 0;
	--for j = 1, GetNumSpellTabs() do
	--	total = total + select(4, GetSpellTabInfo(j));
	--end
	--print("Calc total = "..total, "actual total = "..i);
	Util.SpellIndex = NewSI;
	table.sort(NewSM);
	Util.SpellMana = NewSM;
end

function Util.CachePetSpellIndexes()
	local i = 1;
	local NewPSI = {};
	--Util.NewPetSpellIndex = {};
	while true do
		local NameRank = Util.GetFullSpellName(GetSpellInfo(i, BOOKTYPE_PET));
		if (not NameRank) then
			break;
		end
		--if (not Util.PetSpellIndex[NameRank]) then
		--	Util.NewPetSpellIndex[NameRanl] = i;
		--end
		NewPSI[NameRank] = i;
		i = i + 1;
	end

	Util.PetSpellIndex = NewPSI;
	
end

function Util.LookupSpellIndex(NameRank)
	local Index = Util.SpellIndex[NameRank];
	
	if (Index) then
		return Index, BOOKTYPE_SPELL;
	end
	Index = Util.PetSpellIndex[NameRank];
	if (Index) then
		return Index, BOOKTYPE_PET;
	end
end

function Util.LookupNewSpellIndex(NameRank)
	local Index = Util.NewSpellIndex[NameRank];
	
	if (Index) then
		return Index, BOOKTYPE_SPELL;
	end
	Index = Util.NewPetSpellIndex[NameRank];
	if (Index) then
		return Index, BOOKTYPE_PET;
	end
end

--[[ Used when the players mana crosses a threshold to find the next thresholds to test against --]]
function Util.FindNewThresholds(Mana, Index, SearchDown)
	local SpellMana = Util.SpellMana;
	if (SearchDown) then
		for i = Index-1, 1, -1 do
			if (SpellMana[i] <= Mana) then
				return SpellMana[i], SpellMana[i+1], i;
			end
		end
	else
		for i = Index+2, #SpellMana do
			if (SpellMana[i] > Mana) then
				return SpellMana[i-1], SpellMana[i], i-1;
			end
		end
	end
end
--[[ I will probably need to do the above for Rage/Energy and Runic Power, but for now will skip such tests --]]

--[[ If a spell is learnt this will promote any usage of that spell to it's highest rank --]]
function Util.PromoteSpells()
	if (InCombatLockdown()) then
		Util.DelayedPromoteSpells = true;	--Since this relies on the NewSpell table this may not work too well? (ultimately this is minor and perhaps not worth the extra code paths to manage)
		return;
	end
	for k, v in pairs(Util.ActiveButtons) do
		v:PromoteSpell();
	end

end

function Util.RefreshSpells()
	--Unlike the others this can be done during combat (ironically)
	for k, v in pairs(Util.ActiveButtons) do
		v:RefreshSpell();
	end
end

function Util.AddSpell(Value)
	if (not Util.FindInTable(Util.ActiveSpells, Value)) then
		table.insert(Util.ActiveSpells, Value);
	end
end

function Util.RemoveSpell(Value)
	local Index = Util.FindInTable(Util.ActiveSpells, Value);
	if (Index) then
		table.remove(Util.ActiveSpells, Index);
	end
end






--[[---------------------------------------
	Companion Functions
-------------------------------------------]]
function Util.CacheCompanions()
    Util.Critters = {};
    for i = 1, GetNumCompanions("CRITTER") do
        local Id, Name = GetCompanionInfo("CRITTER", i);
		if (not Name) then
			return;
		end
        Util.Critters[Name] = i;
    end
	
    Util.Mounts = {};
    for i = 1, GetNumCompanions("MOUNT") do
        local Id, Name = GetCompanionInfo("MOUNT", i);
		if (not Name) then
			return;
		end
        Util.Mounts[Name] = i;
    end
	Util.CompanionsCached = true;
end

function Util.LookupCompanion(Name)
    if (Util.Critters[Name]) then
        return "CRITTER", Util.Critters[Name]; 
    elseif (Util.Mounts[Name]) then
        return "MOUNT", Util.Mounts[Name];
    else
        return nil, nil;
    end
end

function Util.RefreshCompanions()
	if (InCombatLockdown()) then
		Util.DelayedRefreshCompanions = true;
		return;
	end
	for k, v in pairs(Util.ActiveButtons) do
		v:RefreshCompanion();
	end
end




--[[---------------------------------------
	Item Functions
-------------------------------------------]]

function Util.GetItemId(Link)
	return select(3, strfind(Link, "item:(%d+)|"));
end

function Util.CacheBagItems()
	local BagItemNameIndexes = {};
	local BagItemIdIndexes = {};
	local ItemId;
	local ItemName;
	for b = 4, 0, -1 do
		for s = GetContainerNumSlots(b), 1, -1 do
			ItemId = GetContainerItemID(b, s);
			ItemName = GetItemInfo(ItemId or "");
			if (ItemName) then
				BagItemNameIndexes[ItemName] = {b, s};
				BagItemIdIndexes[ItemId] = {b, s};
			end
		end
	end
	
	Util.BagItemNameIndexes = BagItemNameIndexes;
	Util.BagItemIdIndexes = BagItemIdIndexes;
end

function Util.CacheInvItems()
	local InvItemNameIndexes = {};
	local InvItemIdIndexes = {};
	local ItemId;
	local ItemName;
	for s = 32, 0, -1 do
		ItemId = GetInventoryItemID("player", s);
		ItemName = GetItemInfo(ItemId or "");
		if (ItemName) then
			InvItemNameIndexes[ItemName] = s;
			InvItemIdIndexes[ItemId] = s;
		end
	end
	
	Util.InvItemNameIndexes = InvItemNameIndexes;
	Util.InvItemIdIndexes = InvItemIdIndexes;
end

--[[ Look for the item in players equipped slots --]]
function Util.LookupItemNameEquippedSlot(ItemName)
	return Util.InvItemNameIndexes[ItemName];
end
function Util.LookupItemIdEquippedSlot(ItemId)
	return Util.InvItemIdIndexes[ItemId];
end

--[[ Look for the item in the players inventory --]]
function Util.LookupItemNameBagSlot(ItemName)
	local Result = Util.BagItemNameIndexes[ItemName];
	if (Result) then
		return Result[1], Result[2];
	else
		return nil, nil;
	end
end
function Util.LookupItemIdBagSlot(ItemId)
	local Result = Util.BagItemIdIndexes[ItemId];
	if (Result) then
		return Result[1], Result[2];
	else
		return nil, nil;
	end
end



--[[ Look for the item in players equipped slots --]]
function Util.LookupItemEquippedSlot(ItemId)
	for s = 0,23 do
		local Id = GetInventoryItemID("player", s);
		if (ItemId == Id) then
			return s;
		end
	end
	return nil;
end

--[[ Look for the item in the players inventory 
Notes: Don't use this function, the above functions are better
Reason: In the simple case profiling shows that the performance hit is neglible from doing this scan...
That is until GetItemInfo is used to get the name of the item
all other things being equal that call increases my perf time from 0.04ms (approx 100 bag slots, with half used) to 0.44ms
The above caching mechanism requires more work of the addon (not a good thing, complexity breeds issues) but it avoids the whole perf issue and doesn't even register (i.e. 0.00ms) --]]
function Util.LookupItemInvSlot(ItemId)

	local Id;
	local Name = "";
	for b = 0, 4 do
		for s = 1, GetContainerNumSlots(b) do
			Id = GetContainerItemID(b, s);
			if (Id) then
				Name = GetItemInfo(Id);
				if (ItemId == Id) then
					return b, s;
				end
			end
		end
	end
	return nil, nil;
end
--[[ Look the item in the players bank (not sure if I need to make such a function so will leave this stub for now --]]
function Util.LookupItemBankSlot(ItemName)
	return nil, nil;
end

function Util.AddItem(Value)
	if (not Util.FindInTable(Util.ActiveItems, Value)) then
		table.insert(Util.ActiveItems, Value);
	end
end

function Util.RemoveItem(Value)
	local Index = Util.FindInTable(Util.ActiveItems, Value);
	if (Index) then
		table.remove(Util.ActiveItems, Index);
	end
end



--[[---------------------------------------
	EquipmentSet Functions
-------------------------------------------]]
function Util.RefreshEquipmentSets()
	if (InCombatLockdown()) then
		Util.DelayedRefreshEquipmentSets = true;
		return;
	end
	for k, v in pairs(Util.ActiveButtons) do
		v:RefreshEquipmentSet();
	end
end




--[[---------------------------------------
	Bonus Action Functions
-------------------------------------------]]
function Util.AddBonusAction(Value)
	if (not Util.FindInTable(Util.ActiveBonusActions, Value)) then
		table.insert(Util.ActiveBonusActions, Value);
	end
end

function Util.RemoveBonusAction(Value)
	local Index = Util.FindInTable(Util.ActiveBonusActions, Value);
	if (Index) then
		table.remove(Util.ActiveBonusActions, Index);
	end
end




--[[---------------------------------------
	Macro Functions
-------------------------------------------]]
function Util.RefreshMacros()
	if (InCombatLockdown()) then
		Util.DelayedRefreshMacros = true;
		return;
	end
	for i = 1, #Util.ActiveButtons do
		Util.ActiveButtons[i]:RefreshMacro();
	end
end

function Util.AddMacro(Value)
	if (not Util.FindInTable(Util.ActiveMacros, Value)) then
		table.insert(Util.ActiveMacros, Value);
	end
	Util.RefreshOnUpdateFunction();
end

function Util.RemoveMacro(Value)
	local Index = Util.FindInTable(Util.ActiveMacros, Value);
	if (Index) then
		table.remove(Util.ActiveMacros, Index);
		Util.RefreshOnUpdateFunction();
	end
end

--[[
		The following creates an OnUpdate function designed to scan for macro conditionals that can't
		adequately be covered by events alone - it will only perform processing for conditionals that actually
		exist in allocated macros
--]]
function Util.RefreshOnUpdateFunction()
	if (not Util.Loaded) then
		return;
	end

	local ConcatMacros = "";
	local FunctionString =
	[[return function (self, Elapsed)
	]];
	
	for i = 1, #(Util.ActiveMacros) do
		if (Util.ActiveMacros[i].Mode == "macro") then
			ConcatMacros = ConcatMacros..":"..(GetMacroBody(Util.ActiveMacros[i].MacroIndex) or "");
		end
	end

	ConcatMacros = strupper(ConcatMacros);
	
	--The following tests should be performed the buttons are updated
	if (strfind(ConcatMacros, "FLYING", 1, true)) then FunctionString = FunctionString..Util.SnippetIsFlying(); end
	if (strfind(ConcatMacros, "MOUNTED", 1, true)) then FunctionString = FunctionString..Util.SnippetIsMounted(); end
	FunctionString = FunctionString..Util.SnippetRefreshButtons();	
	
	--The following tests need to be performed after the buttons are updated (so that the buttons can be updated at the next onupdate)
	if (strfind(ConcatMacros, "FLYABLE", 1, true)) then FunctionString = FunctionString..Util.SnippetIsFlyable(); end
	if (strfind(ConcatMacros, "MOUSEOVER", 1, true)) then FunctionString = FunctionString..Util.SnippetMouseOver();	end

	FunctionString = FunctionString.."end";

	local Func = assert(loadstring(FunctionString, "ButtonForgeOnUpdate"));
	Util.OnUpdate = Func();
	EventFull:SetScript("OnUpdate", Util.OnUpdate);
end

function Util.SnippetRefreshButtons()
	return
	[[if (self.RefreshButtons) then
		local ActiveButtons = self.Util.ActiveButtons;
		for i = 1, #ActiveButtons do
			ActiveButtons[i]:UpdateTexture();	--make sure the texture is always upto date (most actions wont need to do anything here, really this is just for spellwisp)
		end
		if (self.RefChecked) then
			for i = 1, #ActiveButtons do
				ActiveButtons[i]:UpdateChecked();
			end
		end
		if (self.RefEquipped) then
			for i = 1, #ActiveButtons do
				ActiveButtons[i]:UpdateEquipped();
			end
		end
		if (self.RefUsable) then
			--print("Usable");
			for i = 1, #ActiveButtons do
				ActiveButtons[i]:UpdateUsable();
			end
		end
		if (self.RefCooldown) then
			for i = 1, #ActiveButtons do
				ActiveButtons[i]:UpdateCooldown();
			end
		end
		if (self.RefText) then
			for i = 1, #ActiveButtons do
				ActiveButtons[i]:UpdateTextCount();
			end
		end
		if (self.RefConditional) then
			local ActiveMacros = self.Util.ActiveMacros;
			for i = 1, #ActiveMacros do
				ActiveMacros[i]:TranslateMacro();
			end
		end
		self.RefreshButtons = false;
		self.RefFull = false;
		self.RefChecked = false;
		self.RefEquipped = false;
		self.RefUsable = false;
		self.RefCooldown = false;
		self.RefText = false;
		self.RefConditional = false;
	end
	]];
end

function Util.SnippetMouseOver()
	return
	[[if (UnitName("mouseover") ~= self.MOUnit or UnitIsDead("mouseover") ~= self.MOUnitDead) then
		self.MOUnit = UnitName("mouseover");
		self.MOUnitDead = UnitIsDead("mouseover");
		self.RefreshButtons = true;
		self.RefConditional = true;
	end
	]];
end

function Util.SnippetIsFlying()
	return
	[[if (IsFlying() ~= self.IsFlying) then
		self.IsFlying = IsFlying();
		self.RefreshButtons = true;
		self.RefConditional = true;
	end
	]];
end

function Util.SnippetIsMounted()
	return
	[[if (IsMounted() ~= self.IsMounted) then
		self.IsMounted = IsMounted();
		self.RefreshButtons = true;
		self.RefConditional = true;
	end
	]];
end

function Util.SnippetIsFlyable()
	return
	[[if (IsFlyableArea() ~= self.IsFlyableArea) then
		self.IsFlyableArea = IsFlyableArea();
		self.RefreshButtons = true;
		self.RefConditional = true;
	end
	]];
end



