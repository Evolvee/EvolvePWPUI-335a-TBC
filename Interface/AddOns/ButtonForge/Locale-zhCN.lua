--[[
    Author: Alternator (Massiner of Nathrezim)
    Translator: s.F
    Copyright 2010
	
	Notes: Primary locale (will be used if a particular locale is not loaded)

--]]


BFLocales["zhCN"] = {};
local Locale = BFLocales["zhCN"];

local Const = BFConst;

Locale["ScaleTooltip"] = "缩放\n|c"..Const.LightBlue.."(双击还原默认大小)|r";
Locale["ColsTooltip"] = "添加/移除列";
Locale["RowsTooltip"] = "添加/移除行";
Locale["GridTooltip"] = "隐藏空按钮\n";
Locale["TooltipsTooltip"] = "显示鼠标提示\n";
Locale["ButtonLockTooltip"] = "锁定按钮\n";
Locale["HideVehicleTooltip"] = "进入载具时隐藏按钮\n";
Locale["HideSpec1Tooltip"] = "使用天赋1时隐藏按钮\n";
Locale["HideSpec2Tooltip"] = "使用天赋2时隐藏按钮\n";
Locale["HideBonusBarTooltip"] = "额外动作条5激活时隐藏本动作条\n";
Locale["SendToBackTooltip"] = "动作条层级靠后";
Locale["SendToFrontTooltip"] = "动作条层级靠前";
Locale["VisibilityTooltip"] = "宏控制动作条显示\n";
Locale["VisibilityEgTooltip"] = "例如 |c"..Const.LightBlue.."[combat] hide; show|r";		--Appended to the Visibility tooltip if no driver is set for that bar
Locale["KeyBindModeTooltip"] = "设定快捷键";
Locale["LabelModeTooltip"] = "编辑动作条标签";
Locale["AdvancedToolsTooltip"] = "高级选项设置";
Locale["DestroyBarTooltip"] = "移除动作条";
Locale["CreateBarTooltip"] = "新建动作条";
Locale["CreateBonusBarTooltip"] = "新建额外动作条\n|c"..Const.LightBlue.."(用于控制载具与特殊宠物)|r";
Locale["RightClickSelfCastTooltip"] = "右键点击为自我施法\n"
Locale["ConfigureModePrimaryTooltip"] = "Button Forge动作条设置模式\n提示: |c"..Const.LightBlue.."可以将此按钮拖到BF动作条上|r";
Locale["ConfigureModeTooltip"] = "Button Forge动作条设置模式";
Locale["BonusActionTooltip"] = "额外动作条";
Locale["Shown"] = "|c"..Const.DarkOrange.."显示|r";
Locale["Hidden"] = "|c"..Const.DarkOrange.."隐藏|r";
Locale["Locked"] = "|c"..Const.DarkOrange.."锁定|r";
Locale["Unlocked"] = "|c"..Const.DarkOrange.."解锁|r";
Locale["Enabled"] = "|c"..Const.DarkOrange.."启用|r";
Locale["Disabled"] = "|c"..Const.DarkOrange.."禁用|r";
Locale["CancelPossessionTooltip"] = "取消控制";
Locale["UpgradedChatMsg"] = "Button Forge Saved Data Upgraded to: ";
Locale["DisableAutoAlignmentTooltip"] = "按住'Shift'拖动以禁用自动停靠";

--Warning/error messages
Locale["CreateBonusBarError"] = "只能在动作条设置模式下生效.";



--The following are used for slash commands (only use lower case for the values!)
Locale["SlashButtonForge1"] = "/buttonforge";	--these two identifiers probably shouldn't change for different locales, but if need be they can be
Locale["SlashButtonForge2"] = "/bufo";


--This BoolTable is used to allow more than one value for true or false, in this case the keys should be changed to be suitable for the locale (as many or few as desired)
--The keys are matched against user input to see if the user specified true or false (or nil)... e.g. if the user typed in 'y' then the below table would map to true. (only use lower case)
Locale.BoolTable = {};
Locale.BoolTable["yes"] 	= true;
Locale.BoolTable["no"] 		= false;

Locale.BoolTable["true"] 	= true;
Locale.BoolTable["false"] 	= false;

Locale.BoolTable["y"] 		= true;
Locale.BoolTable["n"] 		= false;

Locale.BoolTable["on"] 		= true;
Locale.BoolTable["off"] 	= false;

Locale.BoolTable["1"] 		= true;
Locale.BoolTable["0"] 		= false;

--Instructions for using the slash commands
Locale["SlashHelpFormatted"]	=
	"ButtonForge 命令行指定:\n"..
	"调出命令行: |c"..Const.LightBlue.."/buttonforge|r, |c"..Const.LightBlue.."/bufo|r\n"..
	"扩展指令:\n"..
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

	
Locale["SlashBarNameRequired"]		=
[[ButtonForge slash command failed:
You must specify -bar if using any of the following commands: -rows, -cols, -coords, -rename, -info
]];

Locale["SlashCreateBarRule"]		=
[[ButtonForge slash command failed:
-createbar cannot be used with -bar
]];

Locale["SlashCreateBarFailed"]		=
[[ButtonForge slash command failed:
-createbar failed to create a new bar
]];

Locale["SlashDestroyBarRule"]		=
[[ButtonForge slash command failed:
-destroybar cannot be used with other commands
]];

Locale["SlashCommandNotRecognised"]	=
[[ButtonForge slash command failed:
Command not recognised: ]];

Locale["SlashParamsInvalid"] =
[[ButtonForge slash command failed:
Invalid params for command: ]];




--Used when displaying info for the Bar via the slash command /bufo -info
Locale["InfoLabel"] = "标签";
Locale["InfoRowsCols"] = "行, 列";
Locale["InfoScale"] = "缩放";
Locale["InfoCoords"] = "坐标";
Locale["InfoTooltips"] = "鼠标提示";
Locale["InfoEmptyGrid"] = "空按钮";
Locale["InfoLock"] = "按钮锁定";
Locale["InfoHSpec1"] = "天赋1时可见";
Locale["InfoHSpec2"] = "天赋2时可见";
Locale["InfoHSpec3"] = "天赋3时可见";
Locale["InfoHSpec4"] = "天赋4时可见";
Locale["InfoHVehicle"] = "进入载具时看见";
Locale["InfoHBonusBar5"] = "额外动作条5激活时可见";
Locale["InfoVisibilityMacro"] = "宏可见";
Locale["InfoMacroText"] = "宏标签";
Locale["InfoKeybindText"] = "快捷键标签";
Locale["InfoEnabled"] = "动作条";
Locale["InfoGap"] = "按钮间隔";
