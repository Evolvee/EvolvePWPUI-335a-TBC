--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
	Notes: Primary locale (will be used if a particular locale is not loaded)

--]]


BFLocales["enUS"] = {};
local Locale = BFLocales["enUS"];
Locale.__index = Locale;			--This line is only needed for the enUS (primary) locale

local Const = BFConst;

Locale["ScaleTooltip"] = "Scale\n|c"..Const.LightBlue.."(Double Click to Default)|r";
Locale["ColsTooltip"] = "Add/Remove Button Columns";
Locale["RowsTooltip"] = "Add/Remove Button Rows";
Locale["GridTooltip"] = "Empty Button Visibility\n";
Locale["TooltipsTooltip"] = "Tooltip Visibility\n";
Locale["ButtonLockTooltip"] = "Action Buttons Lock\n";
Locale["HideVehicleTooltip"] = "Hide Bar when in a Vehicle\n";
Locale["HideSpec1Tooltip"] = "Hide Bar during Talent Spec 1\n";
Locale["HideSpec2Tooltip"] = "Hide Bar during Talent Spec 2\n";
Locale["HideBonusBarTooltip"] = "Hide Bar when BonusBar:5 is Active\n";
Locale["SendToBackTooltip"] = "Send Bar to Back";
Locale["SendToFrontTooltip"] = "Send Bar to Front";
Locale["VisibilityTooltip"] = "Visibility Macro\n";
Locale["VisibilityEgTooltip"] = "e.g. |c"..Const.LightBlue.."[combat] hide; show|r";		--Appended to the Visibility tooltip if no driver is set for that bar
Locale["KeyBindModeTooltip"] = "Key Bindings";
Locale["LabelModeTooltip"] = "Enter/Edit a Bar Label";
Locale["AdvancedToolsTooltip"] = "Advanced Bar Configuration Options";
Locale["DestroyBarTooltip"] = "Destroy Bar";
Locale["CreateBarTooltip"] = "Create Bar";
Locale["CreateBonusBarTooltip"] = "Create a BonusBar\n|c"..Const.LightBlue.."(For possession, vehicles, and special abilities in certain fights)|r";
Locale["RightClickSelfCastTooltip"] = "Right Click Self Cast\n"
Locale["ConfigureModePrimaryTooltip"] = "Button Forge Bar Configuration\nTip: |c"..Const.LightBlue.."Can be Dragged to a BF Bar|r";
Locale["ConfigureModeTooltip"] = "Button Forge Bar Configuration";
Locale["BonusActionTooltip"] = "Bonus Bar Action";
Locale["Shown"] = "|c"..Const.DarkOrange.."Not Hidden|r";
Locale["Hidden"] = "|c"..Const.DarkOrange.."Hidden|r";
Locale["Locked"] = "|c"..Const.DarkOrange.."Locked|r";
Locale["Unlocked"] = "|c"..Const.DarkOrange.."Unlocked|r";
Locale["Enabled"] = "|c"..Const.DarkOrange.."Enabled|r";
Locale["Disabled"] = "|c"..Const.DarkOrange.."Disabled|r";
Locale["CancelPossessionTooltip"] = "Cancel Possession";
Locale["UpgradedChatMsg"] = "Button Forge Saved Data Upgraded to: ";

--The next entries control logic
Locale["SpellWispContains"] = {"^Aspect", "^Ice Block$", "Aura$", "Form$", "^Tree of Life$"};		--Rules to identify spells that turn into wisp icons when their buff is active
Locale["SpellWispExcludes"] = {"^Immolation Aura$"};					--Rules to exclude spells that may accidentally be matched by the first rule
Locale["SpellRank"] = "Rank";								--Rank keyword found in spells (so that the game can tell which spells are viable for promotion when new spell ranks are learnt)


--Warning/error messages
Locale["CreateBonusBarError"] = "Can only be done In Button Forge Configuration Mode.";
