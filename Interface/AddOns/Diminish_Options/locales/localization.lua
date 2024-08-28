local _, NS = ...
local L = {}
NS.L = L

-- https://wow.curseforge.com/projects/diminish/localization/

L["ANCHORDRAG"] = [=[%s
Grows: %s]=]
L["ANCHORUIPARENT"] = "Anchor to UIParent"
L["ANCHORUIPARENT_TOOLTIP"] = "Deattaches the icons from the unitframe(s) and anchors them directly to the screen (UIParent) instead. Requires re-positioning after enabling."
L["ARENA"] = "Arena"
L["ATTACH_PERSONAL_NAMEPLATE"] = "Anchor To Personal Nameplate"
L["ATTACH_PERSONAL_NAMEPLATE_TOOLTIP"] = "Attaches DR icons to your own personal resource display nameplate instead of the player frame."
L["CATEGORIES_TOOLTIP"] = "Toggle category for tracking. Right-click to manually set an icon used for the category."
L["COLORBLIND"] = "Display DR Indicator Numbers"
L["COLORBLIND_TOOLTIP"] = [=[Show DR indicator numbers next to icons. 1 = first DR, 2 = second DR, 3 = last DR. May not work with some Masque skins.
(Color Blind Mode)]=]
L["COMBATLOCKDOWN_ERROR"] = "Must leave combat or battleground before doing that."
L["COMPACTFRAMES_ERROR"] = "Unable to test raid frames while not in a group."
L["COPY"] = "Copy"
L["COPY_TOOLTIP"] = "Copies settings from one existing profile into the currently active profile."
L["CURRENT_PROFILE"] = "Current Profile: |cffFFEB00%s|r"
L["DEFAULT"] = "Default"
L["DELETE"] = "Delete"
L["DELETE_TOOLTIP"] = "Delete an existing profile. Deletes and resets to default if the profile chosen is the currently active one."
L["DISPLAYMODE"] = "Start Cooldown on Aura Removed"
L["DISPLAYMODE_TOOLTIP"] = "Start timers on aura removed or refresh instead of applied. Leave unchecked to see timer immediately. (Timers will be 18sec + aura duration.)"
L["ENABLED"] = "Enabled"
L["ENABLED_TOOLTIP"] = "Toggle diminishing returns tracking for this specific unit frame."
L["FOCUS"] = "Focus"
L["GROW_BOTTOM"] = "Down"
L["GROW_LEFT"] = "Left"
L["GROW_RIGHT"] = "Right"
L["GROW_TOP"] = "Up"
L["GROWDIRECTION"] = "Grow Direction"
L["GROWDIRECTION_TOOLTIP"] = "Select which direction the icons will grow from the anchor."
L["HEADER_CATEGORIES"] = "Enabled Categories"
L["HEADER_COOLDOWN"] = "Cooldown"
L["HEADER_ICONS"] = "Icons"
L["HEADER_MISC"] = "Misc"
L["HEADER_PROFILES"] = "Create and set configuration profiles so you can have different settings for every character. Creating new profiles will consume more memory so try to reuse profiles whenever possible. See tooltips for detailed info."
L["HEADER_UNITFRAME"] = "Configuration for %s frame tracking."
L["HEADER_ZONE"] = "Enable in Zone"
L["ICONPADDING"] = "Frame Padding"
L["ICONPADDING_TOOLTIP"] = "Set the padding between all active icons."
L["ICONSIZE"] = "Frame Size"
L["ICONSIZE_TOOLTIP"] = "Set the size of the icons."
L["INVALID_SPELLID"] = "Invalid spell ID."
L["NAMEPLATE"] = "Nameplates"
L["NAMEPLATES"] = "Nameplates"
L["NEWPROFILE"] = "Create New Profile"
L["NEWPROFILE_TOOLTIP"] = "Create a new profile with current active settings as a starting point."
L["PARTY"] = "Party"
L["PLAYER"] = "Player"
L["PROFILEACTIVE"] = "That profile is already active."
L["PROFILEEXISTS"] = "Profile with that name already exists."
L["PROFILES"] = "Profiles"
L["RESET"] = "Reset."
L["RESETPOS"] = "Reset Position"
L["RESETPOS_TOOLTIP"] = "Reset icon positions for this unitframe back to default values."
L["RESETPROFILE"] = "Reset Profile"
L["RESETPROFILE_TOOLTIP"] = "Reset current active profile to default settings."
L["SELECTBORDER"] = "Select Border Style"
L["SELECTBORDER_TOOLTIP"] = "Choose between different border textures for the icons. You may also skin the icons using Masque."
L["SELECTPROFILE"] = "Select Profile"
L["SELECTPROFILE_TOOLTIP"] = "Select a profile to use, copy or delete."
L["SHOWCATEGORYTEXT"] = "Display DR Category Label"
L["SHOWCATEGORYTEXT_TOOLTIP"] = "Show text above a timer that displays what diminishing returns category a timer belongs to."
L["STOP"] = "Stop"
L["TARGET"] = "Target"
L["TARGETTIP"] = "Target/focus yourself to see all frames."
L["TEST"] = "Toggle Test Mode"
L["TEST_TOOLTIP"] = "Test all enabled frames."
L["TEXTURE_BRIGHT"] = "Bright"
L["TEXTURE_GLOW"] = "Default, with glow"
L["TEXTURE_NONE"] = "None"
L["TEXTURECHANGE"] = "Manually set icon texture used for %s. This will affect all unit frames. Enter spell ID for ability, or leave blank to reset:"
L["TEXTURECHANGE_NOTE"] = "|cFF00FF00Right-Click a checkbox to manually select spell texture.|r"
L["TIMERCOLORS"] = "Show Indicator Color on Countdown"
L["TIMERCOLORS_TOOLTIP"] = "Toggles diminishing returns indicator coloring of the countdown text."
L["TIMEROUTLINE"] = "Font Outline"
L["TIMEROUTLINE_TOOLTIP"] = "Set the font outline for the cooldown countdown text."
L["TIMERSWIPE"] = "Show Swipe for Cooldowns"
L["TIMERSWIPE_TOOLTIP"] = "Toggles the cooldown swipe animation for all frames."
L["TIMERTEXT"] = "Show Countdown for Cooldowns"
L["TIMERTEXT_TOOLTIP"] = [=[Toggles the cooldown countdown text for all timers.

(Esc -> Interface -> ActionBars -> Show Numbers for Cooldowns)]=]
L["TIMERTEXTSIZE"] = "Countdown Size"
L["TIMERTEXTSIZE_TOOLTIP"] = "Set the font size of the timer countdown text."
L["TRACKNPCS"] = "Enable Tracking for PvE"
L["TRACKNPCS_TOOLTIP"] = [=[Enable diminishing returns tracking for mobs and player pets. (Target/Focus/Nameplates)

Enabling this may drastically increase memory usage in large battlefields. In classic WoW this will only enable pet tracking.]=]
L["UNLOCK"] = "Toggle Moving Frames"
L["UNLOCK_TOOLTIP"] = "Toggle enabled frames for moving. Drag the red boxes to move icon spawn points."
L["USEPROFILE"] = "Use"
L["USEPROFILE_TOOLTIP"] = [=[Set an existing profile to use for this character.

Any modifications to the profile will affect all characters using the profile.]=]
L["WATCHFRIENDLY"] = "Show Friendly DRs"
L["WATCHFRIENDLY_TOOLTIP"] = [=[Toggle diminishing returns tracking for friendly players. (Cast by enemy onto friendly)

Enabling this may drastically increase memory usage in large Battlegrounds.]=]
L["ZONE_ARENA"] = "Arena"
L["ZONE_BATTLEGROUNDS"] = "Battlegrounds & Brawls"
L["ZONE_DUNGEONS"] = "Dungeons"
L["ZONE_OUTDOORS"] = "World"
L["ZONE_SCENARIO"] = "Scenario"
L["ZONE_RAIDS"] = "Raids"
L["ZONES_TOOLTIP"] = "Enable tracking for this zone."

-- luacheck: push ignore 542
local locale = GetLocale()
if locale == "deDE" then
    L["ANCHORDRAG"] = [=[%s
Wächst: %s]=]
L["ANCHORUIPARENT"] = "An UIParent anheften"
L["ANCHORUIPARENT_TOOLTIP"] = "Löst die Symbole von den Einheitenfenster(n) und heftet sie stattdessen an den Bildschirm (UIParent) "
L["ARENA"] = "Arena"
L["CATEGORIES_TOOLTIP"] = "Kategorie für die Verfolgung umschalten.  Klicken Sie mit der rechten Maustaste, um ein Symbol für die Kategorie manuell festzulegen."
L["COLORBLIND"] = "Indikatornummern anzeigen"
L["COLORBLIND_TOOLTIP"] = "DR-Indikatornummern neben Symbolen anzeigen.  1 = erster DR, 2 = zweiter DR, 3 = letzter DR.  Funktioniert möglicherweise nicht mit einigen Masque-Skins.  (Farbenblindmodus)"
L["COMBATLOCKDOWN_ERROR"] = "Du musst den Kampf oder das Schlachtfeld verlassen, um dies zu tun."
L["COMPACTFRAMES_ERROR"] = "Schlachtzugsfenster können nicht getestet werden während du in keiner Gruppe bist."
L["COPY"] = "Kopieren"
L["COPY_TOOLTIP"] = "Kopiert Einstellungen eines existierenden Profils in das momentan aktive Profil."
L["CURRENT_PROFILE"] = "Aktuelles Profil: |cffFFEB00%s|r"
L["DEFAULT"] = "Standard"
L["DELETE"] = "Löschen"
L["DELETE_TOOLTIP"] = "Löscht ein existierendes Profil. Löscht und setzt auf Standardwerte zurück, falls das ausgewählte Profil momentan aktiv ist."
L["DISPLAYMODE"] = "Abklingzeit starten, sobald die Aura entfernt wurde"
L["DISPLAYMODE_TOOLTIP"] = "Startet Timer sobald Auren entfernt anstatt aufgebracht werden. Deaktiviere diese Option, um Timer sofort zu sehen (beim Aufbringen der Aura). (Timer wird 18 Sek. + Auradauer sein.)"
L["ENABLED"] = "Aktiviert"
L["ENABLED_TOOLTIP"] = "Aktivieren / Deaktivieren der Verfolgung von Diminishing Returns für diesen bestimmten Einheit-rahmen."
L["FOCUS"] = "Fokus"
L["GROW_BOTTOM"] = "Nach unten"
L["GROW_LEFT"] = "Links"
L["GROW_RIGHT"] = "Rechts"
L["GROW_TOP"] = "Nach oben"
L["GROWDIRECTION"] = "Ausbreitungsrichtung"
L["GROWDIRECTION_TOOLTIP"] = "Wähle, in welche Richtung die Symbole vom Anker aus wachsen sollen."
L["HEADER_CATEGORIES"] = "Kategorien aktivieren"
L["HEADER_COOLDOWN"] = "Abklingzeit"
L["HEADER_ICONS"] = "Symbole"
L["HEADER_MISC"] = "Sonstiges"
L["HEADER_PROFILES"] = "Erstelle und lege Konfigurationsprofile fest, sodass du verschiedene Einstellungen für jeden Charakter verwenden kannst. Da jedes Profil Speicher verbraucht, versuche Profile mehrfach zu verwenden. Mehr Informationen sind in den Tooltips verfügbar."
L["HEADER_UNITFRAME"] = "Konfiguration für %s Frame Tracking"
L["HEADER_ZONE"] = "In Zone aktivieren"
L["ICONPADDING"] = "Symbolabstand"
L["ICONPADDING_TOOLTIP"] = "Legt den Abstand zwischen allen aktiven DR-Symbolen fest."
L["ICONSIZE"] = "Symbolgröße"
L["ICONSIZE_TOOLTIP"] = "Legt die Größe der DR-Symbole fest."
L["INVALID_SPELLID"] = "Ungültige Zauber-ID"
L["NAMEPLATE"] = "Namensplaketten"
L["NAMEPLATES"] = "Namensplaketten"
L["NEWPROFILE"] = "Neues Profil erstellen"
L["NEWPROFILE_TOOLTIP"] = "Erstellt ein neues Profil mit den momentan aktiven Einstellungen als Startpunkt."
L["PARTY"] = "Gruppe"
L["PLAYER"] = "Spieler"
L["PROFILEACTIVE"] = "Diese Profil ist bereits aktiv."
L["PROFILEEXISTS"] = "Ein Profil mit diesem Namen existiert bereits."
L["PROFILES"] = "Profile"
L["RESET"] = "Zurücksetzen."
L["RESETPOS"] = "Position zurücksetzen"
L["RESETPOS_TOOLTIP"] = "Setzt die Symbolpositionen für dieses Einheitenfenster auf die Standardwerte zurück."
L["RESETPROFILE"] = "Profil zurücksetzen"
L["RESETPROFILE_TOOLTIP"] = "Setzt das momentan aktive Profil auf die Standardeinstellungen zurück."
L["SELECTBORDER"] = "Rahmenstil auswählen"
L["SELECTBORDER_TOOLTIP"] = "Wählen Sie zwischen verschiedenen Rahmenstrukturen für die Symbole.  Sie können die Symbole auch mit Masque gestalten."
L["SELECTPROFILE"] = "Profil auswählen"
L["SELECTPROFILE_TOOLTIP"] = "Wählen Sie ein Profil zum Verwenden, Kopieren oder Löschen aus"
L["SHOWCATEGORYTEXT"] = "DR Kategorie Label anzeigen"
L["SHOWCATEGORYTEXT_TOOLTIP"] = "Zeigen Sie Text über einem Timer an, der anzeigt, zu welcher Diminishing Returns Kategorie ein Timer gehört."
L["SPELLBOOKTEXTURES"] = "Nur bekannte Texturen anzeigen"
L["SPELLBOOKTEXTURES_TOOLTIP"] = "Symbole für feindliche Einheiten verwenden nur Zaubertexturen aus Ihrem eigenen Zauberbuch, die der ausgelösten Kategorie entsprechen, sofern verfügbar.   (Diese Option ist veraltet und wird in zukünftigen Versionen nicht mehr unterstützt. Sie können jetzt die Symboltexturen ändern, indem Sie mit der rechten Maustaste auf ein Kontrollkästchen unter \"Aktivierte Kategorien\" klicken.)"
L["STOP"] = "Stopp"
L["TARGET"] = "Ziel"
L["TARGETTIP"] = "Um alle Rahmen zu sehen, nimm dich selbst als Ziel oder Fokus."
L["TEST"] = "Fenster testen"
L["TEST_TOOLTIP"] = "Testet alle aktivierten Fenster"
L["TEXTURE_BRIGHT"] = "Hell"
L["TEXTURE_GLOW"] = "Standard, mit Leuchten"
L["TEXTURE_NONE"] = "Keine"
L["TEXTURECHANGE"] = "Manuelles Festlegen der Symbolbeschaffenheit für %s.  Dies wirkt sich auf alle Einzelbilder aus.  Geben Sie die Zauber-ID für die Fähigkeit ein oder lassen Sie das Feld leer, um sie zurückzusetzen:"
L["TEXTURECHANGE_NOTE"] = "Klicken Sie mit der rechten Maustaste auf das Kontrollkästchen, um die Textur manuell auszuwählen"
L["TIMERCOLORS"] = "Countdown-Indikator anzeigen"
L["TIMERCOLORS_TOOLTIP"] = "Schaltet die Farbe des Countdown-Texts für die Anzeige Dimishing Returns ein und aus."
L["TIMEROUTLINE"] = "Schriftart Kontur"
L["TIMEROUTLINE_TOOLTIP"] = "Legen Sie den Schriftumriss für den Countdown-Text für die Abklingzeit fest."
L["TIMERSWIPE"] = "Zeige Swipe für Cooldowns"
L["TIMERSWIPE_TOOLTIP"] = "Schaltet die Abklingzeit-Wischanimation für alle Bilder um."
L["TIMERTEXT"] = "Countdown für Abklingzeiten zeigen"
L["TIMERTEXT_TOOLTIP"] = [=[Schaltet Blizzards Abklingzeit-Countdowntext für alle DR-Timer ein.

(Esc -> Interface -> Aktionsleisten-> Zahlen für Abklingzeiten anzeigen)
]=]
L["TIMERTEXTSIZE"] = "Countdowngröße"
L["TIMERTEXTSIZE_TOOLTIP"] = "Legt die Schriftgröße für den Countdown-Text fest."
L["TRACKNPCS"] = "Aktiviere die DR Verfolgung für PvE"
L["TRACKNPCS_TOOLTIP"] = "Aktivieren Sie die Nachverfolgung Diminishing Returns für Mobs und Begleiter von Spielern.  (Ziel / Fokus / Namensschilder)  Wenn Sie dies aktivieren, kann sich die Speichernutzung auf großen Schlachtfeldern drastisch erhöhen."
L["UNLOCK"] = "Fenster entsperren"
L["UNLOCK_TOOLTIP"] = "Aktivierte Frames zum Verschieben umschalten.  Ziehen Sie die roten Kästchen, um die Spawnpunkte der Symbole zu verschieben."
L["USEPROFILE"] = "Benutze"
L["USEPROFILE_TOOLTIP"] = [=[Weist ein existierendes Profil diesem Charakter zu.

Jegliche Änderungen an diesem Profil wirken sich auf alle Charaktere, die diese Profil nutzen, aus.]=]
L["WATCHFRIENDLY"] = "Zeige DRs von Verbündeten"
L["WATCHFRIENDLY_TOOLTIP"] = "Schaltet die Verfolgung der Diminishing Returns für befreundete Spieler ein und aus.  (Vom Feind auf freundlich gecasted)  Wenn Sie dies aktivieren, kann sich die Speichernutzung in großen Schlachtfeldern drastisch erhöhen."
L["ZONE_ARENA"] = "Arena"
L["ZONE_BATTLEGROUNDS"] = "Schlachtfelder & Raufereien"
L["ZONE_DUNGEONS"] = "Dungeons & Schlachtzüge"
L["ZONE_OUTDOORS"] = "Welt"
L["ZONE_SCENARIO"] = "Szenario"
L["ZONES_TOOLTIP"] = "Aktiviere tracking für diese Zone"

elseif locale == "frFR" then
    
elseif locale == "itIT" then
    
elseif locale == "koKR" then
    
elseif locale == "ptBR" then
    
elseif locale == "ruRU" then
    L["ANCHORDRAG"] = [=[%s

Растет: %s]=]
L["ANCHORUIPARENT"] = "Привязать к UIParent"
L["ANCHORUIPARENT_TOOLTIP"] = "Открепляет иконки от фреймов и привязывает из напрямую к экрану. После включения потребуется заново настроить расположение иконок."
L["ARENA"] = "Арена"
L["CATEGORIES_TOOLTIP"] = "Включить категорию для отслеживания. Правый клик для ручной установки отображаемых иконок."
L["COLORBLIND"] = "Показывать Цифры Индикаторов"
L["COLORBLIND_TOOLTIP"] = "Показывает DR индикатор цифрами на иконках. 1 = Первый DR, 2 = Второй DR, 3 = Последний DR. Может не работать с некоторыми обликами аддона Masque.(Режим для дальтоников)"
L["COMBATLOCKDOWN_ERROR"] = "Нужно сначала покинуть Бой или Поле Боя чтобы сделать это."
L["COMPACTFRAMES_ERROR"] = "Невозможно протестировать фреймы рейда вне группы."
L["COPY"] = "Копировать"
L["COPY_TOOLTIP"] = "Копировать настройки из одного из существующих профилей в текущий активный профиль."
L["CURRENT_PROFILE"] = "Текущий профиль:"
L["DEFAULT"] = "По умолчанию"
L["DELETE"] = "Удалить"
L["DELETE_TOOLTIP"] = "Удалить профиль. Удаляет и сбрасывает профиль на профиль по умолчанию, если удаляемый профиль является текущим профилем."
L["DISPLAYMODE"] = "Начинать отсчет после окончания эффекта."
L["DISPLAYMODE_TOOLTIP"] = "Начинает отсчет после того как эффект спадает, вместо сразу после применения. Снять галочку чтобы видеть таймер сразу после применения способности. (Таймеры будут длиться 18 сек + длительность эффекта) "
L["ENABLED"] = "Включено"
L["ENABLED_TOOLTIP"] = "Включить показ для данного фрейма."
L["FOCUS"] = "Фокус"
L["GROW_BOTTOM"] = "Вниз"
L["GROW_LEFT"] = "Влево"
L["GROW_RIGHT"] = "Вправо"
L["GROW_TOP"] = "Вверх"
L["GROWDIRECTION"] = "Направление Роста"
L["GROWDIRECTION_TOOLTIP"] = "Выбрать направление роста иконок."
L["HEADER_CATEGORIES"] = "Активные Категории"
L["HEADER_COOLDOWN"] = "Перезарядка"
L["HEADER_ICONS"] = "Иконки"
L["HEADER_MISC"] = "Разное"
L["HEADER_PROFILES"] = "Создать и настроить профиль таким образом что вы сможете иметь разные настройки для каждого персонажа. Создание новых профилей требует потребляет больше памяти, так что постарайтесь не создавать слишком профилей. Смотрите подсказки для более детальной информации."
L["PARTY"] = [=[Группа
]=]
L["PLAYER"] = "Игрок"
L["TRACKNPCS"] = "Включить отслеживание в PvE"
L["UNLOCK"] = "Разблокировать"

elseif locale == "esES" or locale == "esMX" then
    
elseif locale == "zhCN" or locale == "zhTW" then
    
end
-- luacheck: pop
