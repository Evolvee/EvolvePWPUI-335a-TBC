--[[
    Author: Alternator (Massiner of Nathrezim)
    Translator: moripi
    Copyright 2010
    
    Notes: Primary locale (will be used if a particular locale is not loaded)

--]]


BFLocales["zhTW"] = {};
local Locale = BFLocales["zhTW"];

local Const = BFConst;

Locale["ScaleTooltip"] = "縮放\n|c"..Const.LightBlue.."(雙擊還原預設大小)|r";
Locale["ColsTooltip"] = "新增/移除列";
Locale["RowsTooltip"] = "新增/移除行";
Locale["GridTooltip"] = "隱藏空按鈕\n";
Locale["TooltipsTooltip"] = "顯示提示\n";
Locale["ButtonLockTooltip"] = "鎖定按鈕\n";
Locale["HideVehicleTooltip"] = "進入載具時隱藏按鈕\n";
Locale["HideSpec1Tooltip"] = "使用主天賦時隱藏按鈕\n";
Locale["HideSpec2Tooltip"] = "使用副天賦時隱藏按鈕\n";
Locale["HideSpec3Tooltip"] = "使用副天賦時隱藏按鈕\n";
Locale["HideSpec4Tooltip"] = "使用副天賦時隱藏按鈕\n";
Locale["HideBonusBarTooltip"] = "額外動作條5啟用時隱藏本動作條\n";
Locale["SendToBackTooltip"] = "動作條層級靠後";
Locale["SendToFrontTooltip"] = "動作條層級靠前";
Locale["VisibilityTooltip"] = "宏控制動作條顯示\n";
Locale["VisibilityEgTooltip"] = "例如 |c"..Const.LightBlue.."[combat] hide; show|r";        --Appended to the Visibility tooltip if no driver is set for that bar
Locale["KeyBindModeTooltip"] = "設定快捷鍵";
Locale["LabelModeTooltip"] = "編輯動作條標籤";
Locale["AdvancedToolsTooltip"] = "進階選項設置";
Locale["DestroyBarTooltip"] = "移除動作條";
Locale["CreateBarTooltip"] = "新建動作條";
Locale["CreateBonusBarTooltip"] = "新建額外動作條\n|c"..Const.LightBlue.."(用於控制載具與特殊寵物)|r";
Locale["RightClickSelfCastTooltip"] = "右鍵點擊為自我施法\n"
Locale["ConfigureModePrimaryTooltip"] = "Button Forge動作條設置模式\n提示: |c"..Const.LightBlue.."可以將此按鈕拖到BF動作條上|r";
Locale["ConfigureModeTooltip"] = "Button Forge動作條設置模式";
Locale["BonusActionTooltip"] = "額外動作條";
Locale["Shown"] = "|c"..Const.DarkOrange.."顯示|r";
Locale["Hidden"] = "|c"..Const.DarkOrange.."隱藏|r";
Locale["Locked"] = "|c"..Const.DarkOrange.."鎖定|r";
Locale["Unlocked"] = "|c"..Const.DarkOrange.."解鎖|r";
Locale["Enabled"] = "|c"..Const.DarkOrange.."啟用|r";
Locale["Disabled"] = "|c"..Const.DarkOrange.."禁用|r";
Locale["CancelPossessionTooltip"] = "取消控制";
Locale["UpgradedChatMsg"] = "Button Forge Saved Data Upgraded to: ";
Locale["DisableAutoAlignmentTooltip"] = "按住'Shift'拖動以禁用自動停靠";

--Warning/error messages
Locale["CreateBonusBarError"] = "只能在動作條設置模式下生效.";



--The following are used for slash commands (only use lower case for the values!)
Locale["SlashButtonForge1"] = "/buttonforge";    --these two identifiers probably shouldn't change for different locales, but if need be they can be
Locale["SlashButtonForge2"] = "/bufo";


--This BoolTable is used to allow more than one value for true or false, in this case the keys should be changed to be suitable for the locale (as many or few as desired)
--The keys are matched against user input to see if the user specified true or false (or nil)... e.g. if the user typed in 'y' then the below table would map to true. (only use lower case)
Locale.BoolTable = {};
Locale.BoolTable["yes"]     = true;
Locale.BoolTable["no"]         = false;

Locale.BoolTable["true"]     = true;
Locale.BoolTable["false"]     = false;

Locale.BoolTable["y"]         = true;
Locale.BoolTable["n"]         = false;

Locale.BoolTable["on"]         = true;
Locale.BoolTable["off"]     = false;

Locale.BoolTable["1"]         = true;
Locale.BoolTable["0"]         = false;

--Instructions for using the slash commands
Locale["SlashHelpFormatted"]    =
    "ButtonForge 命令行指定:\n"..
    "調出命令行: |c"..Const.LightBlue.."/buttonforge|r, |c"..Const.LightBlue.."/bufo|r\n"..
    "擴展指令:\n"..
	"|c"..Const.LightBlue.."-bar <bar name>|r (the bar to apply changes to, or if not set then all bars)\n"..
	"|c"..Const.LightBlue.."-rename <new name>|r\n"..
	"|c"..Const.LightBlue.."-rows <number>|r\n"..
	"|c"..Const.LightBlue.."-cols <number>|r\n"..
	"|c"..Const.LightBlue.."-scale <size>|r (1 is normal scale)\n"..
	"|c"..Const.LightBlue.."-gap <size>|r (6 is normal gap)\n"..
	"|c"..Const.LightBlue.."-coords <left> <top>|r\n"..
	"|c"..Const.LightBlue.."-tooltips <on/off>|r\n"..
	"|c"..Const.LightBlue.."-emptybuttons <on/off>|r\n"..
	"|c"..Const.LightBlue.."-lockbuttons <on/off>|r\n"..
	"|c"..Const.LightBlue.."-macrotext <on/off>|r\n"..
	"|c"..Const.LightBlue.."-keybindtext <on/off>|r\n"..
	"|c"..Const.LightBlue.."-hidespec1 <on/off>|r\n"..
	"|c"..Const.LightBlue.."-hidespec2 <on/off>|r\n"..
	"|c"..Const.LightBlue.."-hidespec3 <on/off>|r\n"..
	"|c"..Const.LightBlue.."-hidespec4 <on/off>|r\n"..
	"|c"..Const.LightBlue.."-hidevehicle <on/off>|r\n"..
	"|c"..Const.LightBlue.."-hideoverridebar <on/off>|r\n"..
	"|c"..Const.LightBlue.."-vismacro <visibility macro>|r\n"..
	"|c"..Const.LightBlue.."-gui <on/off>|r (off = hides bar without disabling keybinds)\n"..
	"|c"..Const.LightBlue.."-alpha <opacity>|r (0 - 1, 1 is completely opaque)\n"..
	"|c"..Const.LightBlue.."-enabled <on/off>|r\n"..
	"|c"..Const.LightBlue.."-info|r\n"..
	"|c"..Const.LightBlue.."-technicalinfo|r\n"..
	"|c"..Const.LightBlue.."-createbar <bar name>|r\n"..
	"|c"..Const.LightBlue.."-destroybar <bar name>|r\n"..
	"|c"..Const.LightBlue.."-saveprofile <profile name>|r\n"..
	"|c"..Const.LightBlue.."-loadprofile <profile name>|r\n"..
	"|c"..Const.LightBlue.."-loadprofiletemplate <profile name>|r\n"..
	"|c"..Const.LightBlue.."-undoprofile|r\n"..
	"|c"..Const.LightBlue.."-deleteprofile <profile name>|r\n"..
	"|c"..Const.LightBlue.."-listprofiles|r\n"..	
	"|c"..Const.LightBlue.."-macrocheckdelay <number>|r (5 seconds is default) \n"..
	"|c"..Const.LightBlue.."-removemissingmacros <on/off>|r\n"..
	"|c"..Const.LightBlue.."-forceoffcastonkeydown <on/off>|r (will apply at next login)\n"..
	"|c"..Const.LightBlue.."-usecollectionsfavoritemountbutton <on/off>|r\n"..
	"|c"..Const.LightBlue.."-globalsettings|r\n"..
    "例子:\n"..
    "|c"..Const.LightBlue.."/bufo -bar Mounts -tooltips off -emptybuttons off -scale 0.75|r\n"..
    "|c"..Const.LightBlue.."/bufo -macrotext off|r\n"..
    "|c"..Const.LightBlue.."/bufo -createbar MyNewBar -coords 800, 200 -rows 10 -cols 1|r\n"..
    "|c"..Const.LightBlue.."/bufo -bar MyNewBar -info|r";
    
    
Locale["SlashBarNameRequired"]        =
[[ButtonForge slash command failed:
You must specify -bar if using any of the following commands: -rows, -cols, -coords, -rename, -info
]];

Locale["SlashCreateBarRule"]        =
[[ButtonForge slash command failed:
-createbar cannot be used with -bar
]];

Locale["SlashCreateBarFailed"]        =
[[ButtonForge slash command failed:
-createbar failed to create a new bar
]];

Locale["SlashDestroyBarRule"]        =
[[ButtonForge slash command failed:
-destroybar cannot be used with other commands
]];

Locale["SlashCommandNotRecognised"]    =
[[ButtonForge slash command failed:
Command not recognised: ]];

Locale["SlashParamsInvalid"] =
[[ButtonForge slash command failed:
Invalid params for command: ]];




--Used when displaying info for the Bar via the slash command /bufo -info
Locale["InfoLabel"] = "標籤";
Locale["InfoRowsCols"] = "行, 列";
Locale["InfoScale"] = "縮放";
Locale["InfoCoords"] = "坐標";
Locale["InfoTooltips"] = "提示";
Locale["InfoEmptyGrid"] = "空按鈕";
Locale["InfoLock"] = "按鈕鎖定";
Locale["InfoHSpec1"] = "可見人才";
Locale["InfoHSpec2"] = "可見人才";
Locale["InfoHSpec3"] = "可見人才";
Locale["InfoHSpec4"] = "可見人才";
Locale["InfoHVehicle"] = "進入載具時看見";
Locale["InfoHBonusBar5"] = "額外動作條5啟用時可見";
Locale["InfoVisibilityMacro"] = "巨集可見";
Locale["InfoMacroText"] = "巨集標籤";
Locale["InfoKeybindText"] = "快捷鍵標籤";
Locale["InfoEnabled"] = "動作條";
Locale["InfoGap"] = "按鈕間隔";
