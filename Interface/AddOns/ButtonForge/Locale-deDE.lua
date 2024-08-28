--[[
    Author: Alternator (Massiner of Nathrezim)
	Translator: 
    Copyright 2010
	
	Notes: Primary locale (will be used if a particular locale is not loaded)

	UPDATED 17-Mar-2011: Needs tidy up, also some of the terminology is becoming inconsistent
--]]


--[[          Notes for translating
	- It is recommended to use a text editor that can syntax highlight lua code (notepad++ is the editor I use)
	- Almost every piece of text displayed can be found in the enUS locale file
	- When making a translation simply go through and update the text that is stored into the Locale table
		e.g. English version
				Locale["ScaleTooltip"] = "Scale\n|c"..Const.LightBlue.."(Double Click to Default)|r";
			 Russian version
				Locale["ScaleTooltip"] = "Масштаб\n|c"..Const.LightBlue.."(Двойной щелчок для значения по умолчанию)|r";
	- Some of the texts have character formatting (such as newlines and colouring), it is recommended to not change this
	- Not all of the text should be translated, those parts will have a note above them
	- The file name should be 'Locale-????.lua' where the ???? is the code for your locale
	- Update the 'enUS' on the next two lines to your code
	
	- It is optional how many texts are translated; it is recommended to remove from your file any that are not, these will simply
		default to the enUS text in game
	
	Note: Some of the text displayed in game is created by taking a locale text
			such as "Action Buttons Lock" and appending a status such as "Locked"
--]]

BFLocales["deDE"] = {};
local Locale = BFLocales["deDE"];

local Const = BFConst;



Locale["ScaleTooltip"] = "Scale\n|c"..Const.LightBlue.."(Double Click to Default)|r";
Locale["ColsTooltip"] = "Hinzufügen/Entfernen von Button Spalten";
Locale["RowsTooltip"] = "Hinzufügen/Entfernen von Button Zeilen";
Locale["GridTooltip"] = "Sichtbarkeit von nicht belegten Buttons\n";
Locale["TooltipsTooltip"] = "Tooltip Sichtbarkeit\n";
Locale["ButtonLockTooltip"] = "Button gegen Verschieben sperren\n";
Locale["HideVehicleTooltip"] = "Actionbar in Fahrzeugen ausblenden\n";
Locale["HideSpec1Tooltip"] = "Actionbar für Spec 1 verbergen\n";
Locale["HideSpec2Tooltip"] = "Actionbar für Spec 2 verbergen\n";
Locale["HideSpec3Tooltip"] = "Actionbar für Spec 3 verbergen\n";
Locale["HideSpec4Tooltip"] = "Actionbar für Spec 4 verbergen\n";
Locale["HideBonusBarTooltip"] = "Actionbar ausblenden wenn Bonusbar aktiv ist:5 is Active\n";
Locale["SendToBackTooltip"] = "Actionbar in den Hintergrund verschieben";
Locale["SendToFrontTooltip"] = "Actionbar in den Vordergrund verschieben";
Locale["VisibilityTooltip"] = "Macros zeigen\n";
Locale["VisibilityEgTooltip"] = "e.g. |c"..Const.LightBlue.."[combat] hide; show|r";	--Do not translate this line of text
Locale["KeyBindModeTooltip"] = "Tastaturbelegung";
Locale["LabelModeTooltip"] = "Beschriftung der Actionbar hinzufügen/ändern";
Locale["AdvancedToolsTooltip"] = "Erweiterte Actionbar Einstellungen";
Locale["DestroyBarTooltip"] = "Actionbar löschen";
Locale["CreateBarTooltip"] = "Actionbar erstellen";
Locale["CreateBonusBarTooltip"] = "Zusätzliche Actionbar erstellen\n|c"..Const.LightBlue.."(Für Begleiter, Fahrzeuge und Spezialfähigkeiten in einigen Kämpfen)|r";
Locale["RightClickSelfCastTooltip"] = "Rechtsklick zum Selbstzauber\n"
Locale["ConfigureModePrimaryTooltip"] = "Button Forge Actionbar Konfiguration\nTip: |c"..Const.LightBlue.."Kann in eine BF Actionbar gezogen werden|r";
Locale["ConfigureModeTooltip"] = "Button Forge Konfiguration";
Locale["BonusActionTooltip"] = "Bonus Bac Aktion";
Locale["Shown"] = "|c"..Const.DarkOrange.."Versteckt|r";
Locale["Hidden"] = "|c"..Const.DarkOrange.."Nicht versteckt|r";
Locale["Locked"] = "|c"..Const.DarkOrange.."Gesperrt|r";
Locale["Unlocked"] = "|c"..Const.DarkOrange.."Entsperrt|r";
Locale["Enabled"] = "|c"..Const.DarkOrange.."Aktiviert|r";
Locale["Disabled"] = "|c"..Const.DarkOrange.."Deaktiviert|r";
Locale["CancelPossessionTooltip"] = "Cancel Possession";
Locale["UpgradedChatMsg"] = "Button Forge Einstellung gespeichert: ";
Locale["DisableAutoAlignmentTooltip"] = "Halte 'Shift' und ziehe Bar um Autoausrichtung zu deaktiveren";

--Warning/error messages
Locale["CreateBonusBarError"] = "Kann nur im Button Forge Konfigurationsmodus geändert werden.";


--Translation note, the following locale texts are contained between the [[ ]] brackets

Locale["SlashBarNameRequired"]		=
[[ButtonForge Textbefehl Fehler:
Du musst eine Actionbar angeben -bar um folgende Befehle zu nutzen: -rows, -cols, -coords, -rename, -info
]];

Locale["SlashCreateBarRule"]		=
[[ButtonForge Textbefehl Fehler:
-createbar kann nicht genutzt werden mit -bar
]];

Locale["SlashCreateBarFailed"]		=
[[ButtonForge Textbefehl Fehler:
-createbar neue Actionbar kann nicht erstellt werden
]];

Locale["SlashDestroyBarRule"]		=
[[ButtonForge Textbefehl Fehler:
-destroybar kann nicht mit anderem Befehl genutzt werden
]];

Locale["SlashGlobalSettingsRule"]		=
[[ButtonForge Textbefehl Fehler:
-globalsettings kann nicht mit anderem Befehl genutzt werden
]];

Locale["SlashCommandNotRecognised"]	=
[[ButtonForge Textbefehl Fehler:
Befehl nicht bekannt: ]];

Locale["SlashParamsInvalid"] =
[[ButtonForge Textbefehl Fehler:
Parameter ungültig: ]];




--Used when displaying info for the Bar via the slash command /bufo -info
Locale["InfoLabel"] = "Beschriftung";
Locale["InfoRowsCols"] = "Zeilen, Spalte";
Locale["InfoScale"] = "Skalierung";
Locale["InfoCoords"] = "Koordinaten";
Locale["InfoTooltips"] = "Tooltips";
Locale["InfoEmptyGrid"] = "Leere Buttons";
Locale["InfoLock"] = "Button gesperrt";
Locale["InfoHSpec1"] = "Sichtbarkeit für Spec 1";
Locale["InfoHSpec2"] = "Sichtbarkeit für Spec 2";
Locale["InfoHSpec3"] = "Sichtbarkeit für Spec 3";
Locale["InfoHSpec4"] = "Sichtbarkeit für Spec 4";
Locale["InfoHVehicle"] = "Sichtbarkeit in Fahrzeugen";
Locale["InfoHBonusBar5"] = "Sichtbarkeit wenn Bonusbar 5 aktiv ist";
Locale["InfoVisibilityMacro"] = "Sichtbarkeit von Makros";
Locale["InfoMacroText"] = "Makro Beschriftung";
Locale["InfoKeybindText"] = "Tastaturbelegung beschriften";
Locale["InfoEnabled"] = "Bar";
Locale["InfoGap"] = "Button Abstand";
Locale["InfoMacroCheckDelay"] = "Makro Verzögerung";
Locale["InfoRemoveMissingMacros"] = "Fehlende Makros entfernen";
Locale["InfoButtonFrameName"] = "Buttonrahmen beschriftet";

