--[[
    Author: Alternator (Massiner of Nathrezim)
	Translator: Another
    Copyright 2010
	
	Notes: russian locale

--]]


BFLocales["ruRU"] = {};
local Locale = BFLocales["ruRU"];

local Const = BFConst;

Locale["ScaleTooltip"] = "Масштаб\n|c"..Const.LightBlue.."(Двойной щелчок для значения по умолчанию)|r";
Locale["ColsTooltip"] = "Добавить/удалить столбик кнопок";
Locale["RowsTooltip"] = "Добавить/удалить линейку кнопок";
Locale["GridTooltip"] = "Показ пустых кнопок\n";
Locale["TooltipsTooltip"] = "Показ подсказок\n";
Locale["ButtonLockTooltip"] = "Запрет изменения кнопок\n";
Locale["HideVehicleTooltip"] = "Прятать панель на средстве передвижения\n";
Locale["HideSpec1Tooltip"] = "Прятать панель для талантов 1\n";
Locale["HideSpec2Tooltip"] = "Прятать панель для талантов 2\n";
Locale["HideSpec3Tooltip"] = "Прятать панель для талантов 3\n";
Locale["HideSpec4Tooltip"] = "Прятать панель для талантов 4\n";
Locale["HideBonusBarTooltip"] = "Прятать панель когда бонус панель:5 активна\n";
Locale["SendToBackTooltip"] = "Панель на задний план";
Locale["SendToFrontTooltip"] = "Панель на передний план";
Locale["VisibilityTooltip"] = "Макро видимости\n";
Locale["VisibilityEgTooltip"] = "например |c"..Const.LightBlue.."[combat] hide; show|r";		--Appended to the Visibility tooltip if no driver is set for that bar
Locale["KeyBindModeTooltip"] = "Привязки кнопок";
Locale["LabelModeTooltip"] = "Ввести/редактировать название панели";
Locale["AdvancedToolsTooltip"] = "Дополнительные опции конфигурации панели";
Locale["DestroyBarTooltip"] = "Удалить панель";
Locale["CreateBarTooltip"] = "Создать панель";
Locale["CreateBonusBarTooltip"] = "Создать бонус панель\n|c"..Const.LightBlue.."(Для владения, средств передвижения и специальных возможностей во время боя)|r";
Locale["RightClickSelfCastTooltip"] = "Правый щелчок мыши для заклинания на себя\n"
Locale["ConfigureModePrimaryTooltip"] = "Button Forge конфигурация панели\nTip: |c"..Const.LightBlue.."Можно перетащить на BF панель|r";
Locale["ConfigureModeTooltip"] = "Button Forge конфигурация панели";
Locale["BonusActionTooltip"] = "Действие бонус панели";
Locale["Shown"] = "|c"..Const.DarkOrange.."Не прятать|r";
Locale["Hidden"] = "|c"..Const.DarkOrange.."Прятать|r";
Locale["Locked"] = "|c"..Const.DarkOrange.."Запрет изменений|r";
Locale["Unlocked"] = "|c"..Const.DarkOrange.."Нет запрета изменений|r";
Locale["Enabled"] = "|c"..Const.DarkOrange.."Включено|r";
Locale["Disabled"] = "|c"..Const.DarkOrange.."Выключено|r";
Locale["CancelPossessionTooltip"] = "Прервать владение";
Locale["UpgradedChatMsg"] = "Button Forge сохраненные данные обновлены до: ";
Locale["DisableAutoAlignmentTooltip"] = "Удерживайте 'Shift' при перетаскивании для выключения автовыравнивания";

--Warning/error messages
Locale["CreateBonusBarError"] = "Можно делать только в режиме конфигурации.";
