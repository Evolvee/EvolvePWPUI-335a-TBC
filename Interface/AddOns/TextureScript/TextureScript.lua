--EVOLVE PWP UI

local string_match = string.match
local table_insert = table.insert
local table_remove = table.remove

--dark theme
local function DarkenFrames(addon)
    for _, v in pairs({
        PlayerFrameTexture,
        TargetFrameTextureFrameTexture,
        TargetFrameToTTextureFrameTexture,
        FocusFrameToTTextureFrameTexture,
        FocusFrameTextureFrameTexture,
        PetFrameTexture,
        PartyMemberFrame1Texture,
        PartyMemberFrame2Texture,
        PartyMemberFrame3Texture,
        PartyMemberFrame4Texture,
        SlidingActionBarTexture0,
        SlidingActionBarTexture1,
        MainMenuBarLeftEndCap,
        MainMenuBarRightEndCap,
        PartyMemberFrame1PetFrameTexture,
        PartyMemberFrame2PetFrameTexture,
        PartyMemberFrame3PetFrameTexture,
        PartyMemberFrame4PetFrameTexture,
        BonusActionBarTexture0,
        BonusActionBarTexture1,
        TargetofTargetTexture,
        TargetofFocusTexture,
        BonusActionBarFrameTexture0,
        BonusActionBarFrameTexture1,
        BonusActionBarFrameTexture2,
        BonusActionBarFrameTexture3,
        BonusActionBarFrameTexture4,
        MainMenuBarTexture0,
        MainMenuBarTexture1,
        MainMenuBarTexture2,
        MainMenuBarTexture3,
        MainMenuMaxLevelBar0,
        MainMenuMaxLevelBar1,
        MainMenuMaxLevelBar2,
        MainMenuMaxLevelBar3,
        MinimapBorder,
        CastingBarFrameBorder,
        MiniMapBattlefieldBorder,
        FocusFrameSpellBarBorder,
        CastingBarBorder,
        TargetFrameSpellBarBorder,
        MiniMapTrackingButtonBorder,
        MiniMapLFGFrameBorder,
        MainMenuXPBarTexture0,
        MainMenuXPBarTexture1,
        MainMenuXPBarTexture2,
        MainMenuXPBarTexture3,
        ReputationXPBarTexture0,
        ReputationXPBarTexture1,
        ReputationXPBarTexture2,
        ReputationXPBarTexture3,
        MainMenuXPBarTextureMid,
        MiniMapBattlefieldBorder,
        MiniMapMailBorder,
        MinimapBorderTop }) do
        if v then
            v:SetVertexColor(0, 0, 0)
        end
    end

    if addon == "Blizzard_TimeManager" then
        for _, v in pairs({ select(2, TimeManagerClockButton:GetRegions()) }) do
            if v then
                v:SetVertexColor(1, 1, 1)
            end
        end
    end

    local a, b, c, d, e, f, _, _, _, _, _, l = WorldStateScoreFrame:GetRegions()
    for _, v in pairs({ a, b, c, d, e, f, l }) do
        if v then
            v:SetVertexColor(0.15, 0.15, 0.15)
        end
    end
end

-- CVars
local cvars = {
    ShowClassColorInNameplate = "1",
    threatWarning = "0",
    predictedHealth = "1",
    Sound_EnableDSPEffects = "0",
    showPartyPets = "0"
}

local function CustomCvar()
    for cvar, value in pairs(cvars) do
        local current = tostring(GetCVar(cvar))
        if current ~= value then
            SetCVar(cvar, value)
        end
    end
end

-- adding class colours to guild tab
local function ColorGuildTabs()
    local _, guildIndex, class, color
    local guildOffset = FauxScrollFrame_GetOffset(GuildListScrollFrame)
    for i = 1, 13 do
        guildIndex = guildOffset + i
        _, _, _, _, _, _, _, _, _, _, class = GetGuildRosterInfo(guildIndex)
        if not class then
            break
        end
        color = RAID_CLASS_COLORS[class]
        _G["GuildFrameButton" .. i .. "Class"]:SetTextColor(color.r, color.g, color.b)
    end
end

local tooltipOwnerBlacklist = {
    "ActionButton%d+$", -- bar buttons
    "MultiBarBottomLeftButton",
    "MultiBarBottomRightButton",
    "MultiBarLeftButton",
    "MultiBarRightButton",
    "MinimapZoneTextButton",
    "CharacterMicroButton",
    "SpellbookMicroButton",
    "TalentMicroButton",
    "AchievementMicroButton",
    "QuestLogMicroButton",
    "SocialsMicroButton",
    "PVPMicroButton",
    "LFGMicroButton",
    "LFDMicroButton", -- 3.3.5a cancer only
    "HelpMicroButton",
    "^KeyRingButton$", -- key ring
    "^CharacterBag%dSlot$", -- bags
    "^MainMenuBarBackpackButton$", -- backpack
}

local function PlayerFrameArt()
    PlayerFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame")
    PlayerStatusTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-Player-Status")
    PlayerFrameHealthBar:SetPoint("TOPLEFT", 106, -22)
    PlayerFrameHealthBar:SetWidth(119)
    PlayerFrameHealthBar:SetHeight(29)
    PlayerName:SetPoint("CENTER", 50, 35)
    PlayerFrameHealthBarText:SetPoint("CENTER", 50, 12)
    PlayerFrameHealthBarText:SetFont("Fonts/FRIZQT__.TTF", 16, "OUTLINE")
    PlayerFrameManaBarText:SetFont("Fonts/FRIZQT__.TTF", 10, "OUTLINE")
end
hooksecurefunc("PlayerFrame_ToPlayerArt", PlayerFrameArt)

-- Create PartyMemberFrame StatusText
for i = 1, 4 do
    local pFrame = _G["PartyMemberFrame" .. i]

    local healthText = pFrame.healthbar:CreateFontString(nil, "OVERLAY", "GameFontWhite")
    healthText:SetFont("Fonts/FRIZQT__.TTF", 15, "OUTLINE")
    healthText:SetPoint("CENTER")
    healthText:Show()

    local manaText = pFrame.manabar:CreateFontString(nil, "OVERLAY", "GameFontWhite")
    manaText:SetFont("Fonts/FRIZQT__.TTF", 9, "OUTLINE")
    manaText:SetPoint("CENTER")
    manaText:Show()

    pFrame.healthbar.fontString = healthText
    pFrame.manabar.fontString = manaText
end

hooksecurefunc("PartyMemberFrame_UpdateMemberHealth", function(self)
    local healthbar = self.healthbar
    local manabar = self.manabar
    local hp = healthbar.finalValue or healthbar:GetValue()
    local mana = manabar.finalValue or manabar:GetValue()
    local powertype = UnitPowerType(self.unit)
    local prefix = self:GetName()

    local _, class = UnitClass(self.unit)
    local c = RAID_CLASS_COLORS[class]
    if c then
        _G[prefix .. "HealthBar"]:SetStatusBarColor(c.r, c.g, c.b)
    end

    if hp ~= healthbar.lastTextValue then
        healthbar.lastTextValue = hp
        healthbar.fontString:SetText(healthbar.lastTextValue)
    end

    if powertype ~= 0 then
        manabar.fontString:SetText("")
        manabar.lastTextValue = -1
    elseif mana ~= manabar.lastTextValue then
        manabar.lastTextValue = mana
        manabar.fontString:SetText(manabar.lastTextValue)
    end

    if ((self.unitHPPercent > 0) and (self.unitHPPercent <= 0.2)) then
        self.portrait:SetVertexColor(1, 1, 1, 1)
    end
end)

hooksecurefunc("PartyMemberFrame_UpdateMember", function(self)
    local prefix = self:GetName();
    _G[prefix .. "Name"]:Hide();
end)

-- Hidden Party Frame Colour-Statuses (debuffs)
hooksecurefunc(PartyMemberFrame1Status, "Show", PartyMemberFrame1Status.Hide)
hooksecurefunc(PartyMemberFrame2Status, "Show", PartyMemberFrame2Status.Hide)
hooksecurefunc(PartyMemberFrame3Status, "Show", PartyMemberFrame3Status.Hide)
hooksecurefunc(PartyMemberFrame4Status, "Show", PartyMemberFrame4Status.Hide)

local function OnInit()
    --minimap buttons, horde/alliance icons on target/focus/player,minimap city location, minimap sun/clock, minimap text frame,minimap zoomable with mousewheel etc
    MinimapZoomIn:Hide()
    MinimapZoomOut:Hide()
    Minimap:EnableMouseWheel(true)
    Minimap:SetScript('OnMouseWheel', function(_, delta)
        if delta > 0 then
            Minimap_ZoomIn()
        else
            Minimap_ZoomOut()
        end
    end)
    MiniMapTracking:Hide()
    MinimapBorderTop:Hide()

    GameTimeTexture:Hide()
    GameTimeFrame:Hide()
    MiniMapMailFrame:ClearAllPoints()
    MiniMapMailFrame:SetPoint('BOTTOMRIGHT', 0, -10)
    MinimapZoneTextButton:Hide()
    PlayerPVPTimerText:SetAlpha(0)
    --3.3.5a only:
    MiniMapWorldMapButton:Hide()


    --ChatGPT made this..:shrug:...classic code didnt work
    -- Color Clock
    if not IsAddOnLoaded("Blizzard_TimeManager") then
        LoadAddOn("Blizzard_TimeManager")
    end
    select(1, TimeManagerClockButton:GetRegions()):SetVertexColor(0, 0, 0)


    -- Position
    FocusFrame:StopMovingOrSizing()
    FocusFrame:ClearAllPoints()
    FocusFrame:SetPoint("CENTER", UIParent, "CENTER", -237, 115)
    FocusFrame:SetUserPlaced(true)
    FocusFrame:SetAttribute("*type2", "target") -- right click target focus

    -- ToT texture closing the alpha gap (previously handled by ClassPortraits itself)
    TargetFrameToTTextureFrameTexture:SetVertexColor(0, 0, 0)

    -- Hide PVP Icon
    PlayerPVPIcon:SetAlpha(0)
    TargetFrameTextureFramePVPIcon:SetAlpha(0)
    FocusFrameTextureFramePVPIcon:SetAlpha(0)

    -- Hide Party PvP Icon
    for i = 1, 4 do
        _G["PartyMemberFrame" .. i .. "PVPIcon"]:SetAlpha(0)
    end

    -- Player Frame, Focus Frame, Target Frame
    PlayerFrameArt()

    TargetFrameHealthBar:SetWidth(119)
    TargetFrameHealthBar:SetHeight(29)
    TargetFrameHealthBar:SetPoint("TOPLEFT", 7, -22)
    TargetFrameHealthBar:SetPoint("CENTER", -50, 6)
    TargetFrameNameBackground:Hide()
    TargetFrameTextureFrameName:SetPoint("CENTER", -50, 35)
    TargetFrameHealthBar.TextString:SetPoint("CENTER", -50, 12)
    TargetFrameHealthBar.TextString:SetFont("Fonts/FRIZQT__.TTF", 16, "OUTLINE")
    TargetFrameManaBar.TextString:SetFont("Fonts/FRIZQT__.TTF", 10, "OUTLINE")

    FocusFrameHealthBar:SetWidth(119)
    FocusFrameHealthBar:SetHeight(29)
    FocusFrameHealthBar:SetPoint("TOPLEFT", 7, -22)
    FocusFrameHealthBar:SetPoint("CENTER", -50, 6)
    FocusFrameNameBackground:Hide()
    FocusFrameTextureFrameName:SetPoint("CENTER", -50, 35)
    FocusFrameHealthBar.TextString:SetPoint("CENTER", -50, 12)
    FocusFrameHealthBar.TextString:SetFont("Fonts/FRIZQT__.TTF", 16, "OUTLINE")
    FocusFrameManaBar.TextString:SetFont("Fonts/FRIZQT__.TTF", 10, "OUTLINE")

    --Party Member Frames 1-4
    PartyMemberFrame1:SetScale(1.25)
    PartyMemberFrame1Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
    PartyMemberFrame1HealthBar:SetWidth(70)
    PartyMemberFrame1HealthBar:SetHeight(18)
    PartyMemberFrame1ManaBar:SetWidth(71)
    PartyMemberFrame1ManaBar:SetHeight(10)
    PartyMemberFrame1HealthBar:SetPoint("TOPLEFT", 45, -14)
    PartyMemberFrame1ManaBar:SetPoint("TOPLEFT", 45, -32)

    --hackfix(3.3.5a only... :vomit:)
    PartyMemberFrame1HealthBar.TextString:SetAlpha(0)
    PartyMemberFrame1ManaBar.TextString:SetAlpha(0)
    PartyMemberFrame2HealthBar.TextString:SetAlpha(0)
    PartyMemberFrame2ManaBar.TextString:SetAlpha(0)
    PartyMemberFrame3HealthBar.TextString:SetAlpha(0)
    PartyMemberFrame3ManaBar.TextString:SetAlpha(0)
    PartyMemberFrame4HealthBar.TextString:SetAlpha(0)
    PartyMemberFrame4ManaBar.TextString:SetAlpha(0)
    --end of hackfix (:puke:)

    PartyMemberFrame2:SetScale(1.25)
    PartyMemberFrame2Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
    PartyMemberFrame2HealthBar:SetWidth(70)
    PartyMemberFrame2HealthBar:SetHeight(18)
    PartyMemberFrame2ManaBar:SetWidth(71)
    PartyMemberFrame2ManaBar:SetHeight(10)
    PartyMemberFrame2HealthBar:SetPoint("TOPLEFT", 45, -14)
    PartyMemberFrame2ManaBar:SetPoint("TOPLEFT", 45, -32)

    PartyMemberFrame3:SetScale(1.25)
    PartyMemberFrame3Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
    PartyMemberFrame3HealthBar:SetWidth(70)
    PartyMemberFrame3HealthBar:SetHeight(18)
    PartyMemberFrame3ManaBar:SetWidth(71)
    PartyMemberFrame3ManaBar:SetHeight(10)
    PartyMemberFrame3HealthBar:SetPoint("TOPLEFT", 45, -14)
    PartyMemberFrame3ManaBar:SetPoint("TOPLEFT", 45, -32)

    PartyMemberFrame4:SetScale(1.25)
    PartyMemberFrame4Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
    PartyMemberFrame4HealthBar:SetWidth(70)
    PartyMemberFrame4HealthBar:SetHeight(18)
    PartyMemberFrame4ManaBar:SetWidth(71)
    PartyMemberFrame4ManaBar:SetHeight(10)
    PartyMemberFrame4HealthBar:SetPoint("TOPLEFT", 45, -14)
    PartyMemberFrame4ManaBar:SetPoint("TOPLEFT", 45, -32)

    -- Reposition
    PartyMemberFrame1:ClearAllPoints()
    --on 3.3.5a had to change this anchor to PlayerFrame from CompactRaidFrameManager(Classic)
    PartyMemberFrame1:SetPoint("TOPLEFT", PlayerFrame, "TOPRIGHT", -168.5, -97.3)

    PartyMemberFrame2:ClearAllPoints()
    PartyMemberFrame2:SetPoint("TOPLEFT", PartyMemberFrame1PetFrame, "BOTTOMLEFT", -23.33, -32.4)

    PartyMemberFrame3:ClearAllPoints()
    PartyMemberFrame3:SetPoint("TOPLEFT", PartyMemberFrame2PetFrame, "BOTTOMLEFT", -23.33, -32.27)

    PartyMemberFrame4:ClearAllPoints()
    PartyMemberFrame4:SetPoint("TOPLEFT", PartyMemberFrame3PetFrame, "BOTTOMLEFT", -23.33, -32.7)

    --POSITION OF DEBUFFS ON PARTY MEMBER FRAMES 1-4 (using PartyDebuffs addon for now)
    --[[
    PartyMemberFrame1Debuff1:ClearAllPoints();
    PartyMemberFrame1Debuff1:SetPoint("BOTTOMLEFT", 45.00000048894432, -9.374971298968035);
    PartyMemberFrame2Debuff1:ClearAllPoints();
    PartyMemberFrame2Debuff1:SetPoint("BOTTOMLEFT", 44.99999870080508, -8.437474379317337);
    PartyMemberFrame3Debuff1:ClearAllPoints();
    PartyMemberFrame3Debuff1:SetPoint("BOTTOMLEFT", 44.99999870080508, -10.31263004755721);
    PartyMemberFrame4Debuff1:ClearAllPoints();
    PartyMemberFrame4Debuff1:SetPoint("BOTTOMLEFT", 44.99999870080508, -8.437541575172077);
    ]]--


    PartyMemberFrame1LeaderIcon:SetAlpha(0)
    PartyMemberFrame1MasterIcon:SetAlpha(0)

    PartyMemberFrame2LeaderIcon:SetAlpha(0)
    PartyMemberFrame2MasterIcon:SetAlpha(0)

    PartyMemberFrame3LeaderIcon:SetAlpha(0)
    PartyMemberFrame3MasterIcon:SetAlpha(0)

    PartyMemberFrame4LeaderIcon:SetAlpha(0)
    PartyMemberFrame4MasterIcon:SetAlpha(0)

    -- Hide Gryphons
    MainMenuBarLeftEndCap:Hide()
    MainMenuBarRightEndCap:Hide()

    --Player,Focus,Target,Pet and Party 1-4 Frames cleaned of names, group frame titles, combat indicators, glows, leader icons, master looter icons, levels, rest icons, !Improved Error Frame button hidden, Red Erros in top-center of screen hidden etc

    PlayerName:SetAlpha(0)
    PetName:SetAlpha(0)
    PlayerFrameGroupIndicator:SetAlpha(0)
    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarPageNumber:SetAlpha(0)

    UIErrorsFrame:SetAlpha(0)

    PlayerLevelText:SetAlpha(0)
    PlayerLeaderIcon:SetAlpha(0)
    PlayerStatusTexture:SetAlpha(0)
    PlayerMasterIcon:SetAlpha(0)

    FocusFrameTextureFrameLevelText:SetAlpha(0)
    FocusFrameTextureFrameLeaderIcon:SetAlpha(0)

    TargetFrameTextureFrameLevelText:SetAlpha(0)
    TargetFrameTextureFrameLeaderIcon:SetAlpha(0)

    ChatFrameMenuButton:Hide()
    --3.3.5a only:
    FriendsMicroButton:Hide()

    -- TargetFrame castbar slight up-scaling
    TargetFrameSpellBar:SetScale(1.1)

    -- FocusFrame castbar slight up-scaling
    FocusFrameSpellBar:SetScale(1.1)

    -- Rework Main Cast-Bar texture (castbar is now going to be round)
	-- Currently testing the retail-like castbar through weakaura
	--[[
    CastingBarFrame:SetScale(1)
    CastingBarFrameBorder:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")
    CastingBarFrameFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small")
    CastingBarFrameSpark:SetHeight(50)
    CastingBarFrameText:ClearAllPoints()
    CastingBarFrameText:SetPoint("CENTER", 0, 1)
    CastingBarFrameBorder:SetWidth(CastingBarFrameBorder:GetWidth() + 4)
    CastingBarFrameFlash:SetWidth(CastingBarFrameFlash:GetWidth() + 4)
    CastingBarFrameBorderShield:SetWidth(CastingBarFrameBorderShield:GetWidth() + 4)
    CastingBarFrameBorder:SetPoint("TOP", 0, 26)
    CastingBarFrameFlash:SetPoint("TOP", 0, 26)
    CastingBarFrameBorderShield:SetPoint("TOP", 0, 26)
	--]]

    --xyz??
    -- removing the "interrupted" red delay bar from nameplate castbars
    --^^ handled in JaxPartyCastBars addon!



    --removing character "C" button image
    MicroButtonPortrait:Hide()
    --3.3.5a only:
    PVPMicroButton:SetAlpha(0)

    -- removing the new "latency" bar unfortunately introduced in wotlk
    MainMenuBarPerformanceBar:SetAlpha(0)

    -- move target of target to the right in order to allow clear vision of buffs/debuffs on a target, this will also be prolly mandatory when I try to resize the debuff scale to match 2.4.3
    TargetFrameToT:ClearAllPoints();
    TargetFrameToT:SetPoint("RIGHT", "TargetFrame", "BOTTOMRIGHT", -20, 5);
    FocusFrameToT:ClearAllPoints();
    FocusFrameToT:SetPoint("RIGHT", "FocusFrame", "BOTTOMRIGHT", -20, 5);

    --position of minimap(remove to reset minimap position)
    MinimapCluster:ClearAllPoints();
    MinimapCluster:SetPoint("BOTTOMLEFT", 1186.333618164063, 595.0001831054688);


    --disable mouseover flashing on buttons
    for i = 1, 12 do
        local texture = _G["MultiBarBottomLeftButton" .. i]:GetHighlightTexture()
        if texture then
            texture:SetAlpha(0)
        end

        texture = _G["MultiBarBottomRightButton" .. i]:GetHighlightTexture()
        if texture then
            texture:SetAlpha(0)
        end

        texture = _G["MultiBarLeftButton" .. i]:GetHighlightTexture()
        if texture then
            texture:SetAlpha(0)
        end

        texture = _G["MultiBarRightButton" .. i]:GetHighlightTexture()
        if texture then
            texture:SetAlpha(0)
        end

        texture = _G["ActionButton" .. i]:GetHighlightTexture()
        if texture then
            texture:SetAlpha(0)
        end
    end

    local texture = MainMenuBarBackpackButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = CharacterBag0Slot:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = CharacterBag1Slot:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = CharacterBag2Slot:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = CharacterBag3Slot:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = CharacterMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = SpellbookMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = TalentMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = QuestLogMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = SocialsMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = AchievementMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = PVPMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    --3.3.5a only:
    PVPMicroButtonTexture:Hide()

    texture = MainMenuMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    --3.3.5a only:
    texture = LFDMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)

    texture = HelpMicroButton:GetHighlightTexture()
    texture:SetAlpha(0)


    -- Hide	Macro & Keybind texts from Action Bar buttons

    for i = 1, 12 do
        _G["ActionButton" .. i .. "HotKey"]:SetAlpha(0)
        _G["MultiBarBottomRightButton" .. i .. "HotKey"]:SetAlpha(0)
        _G["MultiBarBottomLeftButton" .. i .. "HotKey"]:SetAlpha(0)
        _G["MultiBarRightButton" .. i .. "HotKey"]:SetAlpha(0)
        _G["MultiBarLeftButton" .. i .. "HotKey"]:SetAlpha(0)
    end
    for i = 1, 12 do
        _G["ActionButton" .. i .. "Name"]:SetAlpha(0)
        _G["MultiBarBottomRightButton" .. i .. "Name"]:SetAlpha(0)
        _G["MultiBarBottomLeftButton" .. i .. "Name"]:SetAlpha(0)
        _G["MultiBarRightButton" .. i .. "Name"]:SetAlpha(0)
        _G["MultiBarLeftButton" .. i .. "Name"]:SetAlpha(0)
    end

end

-- SpeedyActions level: Garage clicker & Pro Gaymer
local GetBindingKey, SetOverrideBindingClick = _G.GetBindingKey, _G.SetOverrideBindingClick
local InCombatLockdown = _G.InCombatLockdown
local tonumber = _G.tonumber

local function WAHK(button, ok)
    if not button then
        return
    end

    local btn = _G[button]
    if not btn then
        return
    end

    local clickButton, id
    local clk = tostring(button)
    id = tonumber(button:match("(%d+)"))
    local actionButtonType = btn.buttonType
    local buttonType = actionButtonType and (actionButtonType .. id) or ("ACTIONBUTTON%d"):format(id)
    clickButton = buttonType or ("CLICK " .. button .. ":LeftButton")

    local key = GetBindingKey(clickButton)

    if btn then
        if ok then
            local wahk = CreateFrame("Button", "WAHK" .. button, nil, "SecureActionButtonTemplate")
            wahk:RegisterForClicks("AnyDown", "AnyUp")
            btn:RegisterForClicks("AnyDown", "AnyUp")
            wahk:SetAttribute("type", "macro")
            wahk:SetAllPoints(btn)
            local onclick = string.format([[ local id = tonumber(self:GetName():match("(%d+)")) if down then self:SetAttribute("macrotext", "/click [vehicleui] OverrideActionBarButton" .. id .. "; ActionButton" .. id) else self:SetAttribute("macrotext", "/click [vehicleui] OverrideActionBarButton" .. id .. "; ActionButton" .. id) end]], id, id, id)
            SecureHandlerWrapScript(wahk, "OnClick", wahk, onclick)
            if key then
                SetOverrideBindingClick(wahk, true, key, wahk:GetName())
            end
            wahk:SetScript("OnMouseDown", function()
                if HasVehicleActionBar() then
                    _G["OverrideActionBarButton" .. id]:SetButtonState("PUSHED")
                else
                    btn:SetButtonState("PUSHED")
                end
            end)
            wahk:SetScript("OnMouseUp", function()
                if HasVehicleActionBar() then
                    _G["OverrideActionBarButton" .. id]:SetButtonState("NORMAL")
                else
                    btn:SetButtonState("NORMAL")
                end
            end)
        else
            btn:RegisterForClicks("AnyDown", "AnyUp")
            local onclick = ([[ if down then
        self:SetAttribute("macrotext", "/click clk") else self:SetAttribute("macrotext", "/click clk") end
    ]]):gsub("clk", clk), nil
            --SecureHandlerWrapScript(btn, "OnClick", btn, onclick)
            if key then
                SetOverrideBindingClick(btn, true, key, btn:GetName())
            end
        end
    end
end

local function UpdateBinds(frame)
    if InCombatLockdown() then
        frame:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end

    for i = 1, 12 do
        WAHK("ActionButton" .. i, true)
        WAHK("MultiBarBottomRightButton" .. i)
        WAHK("MultiBarBottomLeftButton" .. i)
        WAHK("MultiBarRightButton" .. i)
        WAHK("MultiBarLeftButton" .. i)
    end
end


-- Hide Player and Pet hit indicators
hooksecurefunc(PlayerHitIndicator, "Show", PlayerHitIndicator.Hide)
hooksecurefunc(PetHitIndicator, "Show", PetHitIndicator.Hide)

-- Color Guild Tabs
hooksecurefunc("GuildStatus_Update", ColorGuildTabs)

-- Pet Frame (IT IS NECCESSARY TO COPY INTERFACE/TARGETINGFRAME FOLDER AS WELL)
hooksecurefunc("PetFrame_Update", function()
    PetFrameHealthBar:SetWidth(70)
    PetFrameHealthBar:SetHeight(18)
    PetFrameManaBar:SetWidth(71)
    PetFrameManaBar:SetHeight(10)
    PetFrameHealthBar:SetPoint("TOPLEFT", 45, -14)
    PetFrameHealthBarText:SetPoint("CENTER", 19, 4)
    PetFrameHealthBarText:SetFont("Fonts/FRIZQT__.TTF", 14, "OUTLINE")
    PetFrameManaBarText:SetPoint("CENTER", 19, -10)
    PetFrameManaBarText:SetFont("Fonts/FRIZQT__.TTF", 9, "OUTLINE")
    PetFrameManaBar:SetPoint("TOPLEFT", 45, -32)
end)


-- Remove color on name background
hooksecurefunc("TargetFrame_CheckFaction", function(self)
    if self and self.nameBackground then
        self.nameBackground:SetVertexColor(0.0, 0.0, 0.0, 0.5);
    end
end)

local playerTextures = { PlayerStatusTexture, PlayerRestGlow, PlayerRestIcon, PlayerAttackIcon, PlayerAttackGlow, PlayerStatusGlow, PlayerAttackBackground }
-- Hidden Player glow combat/rested flashes + Hidden Focus Flash on Focused Target + Trying to completely hide the red glowing status on target/focus frames when they have low HP(this is not completely fixed yet)
hooksecurefunc("PlayerFrame_UpdateStatus", function()
    for _, i in pairs(playerTextures) do
        if i and i:IsShown() then
            i:Hide()
        end
    end
end)
hooksecurefunc(PlayerFrameGroupIndicator, "Show", PlayerFrameGroupIndicator.Hide)

-- Hiding the pet combat/attack glowing status, same as above ^^ (3.3.5a)
local HideCancer = CreateFrame("Frame")
PetAttackModeTexture:SetParent(HideCancer)
HideCancer:Hide()

--Action bar buttons are now bigger, better looking and also fixes spellbook/wep switch bugging of dark theme
hooksecurefunc("ActionButton_ShowGrid", function(button)
    local tex = _G[button:GetName().."NormalTexture"]
    if tex then
        tex:SetVertexColor(1.0, 1.0, 1.0, 1.0)
    end
end)

for _, Bar in pairs({ "Action", "MultiBarBottomLeft", "MultiBarBottomRight", "MultiBarLeft", "MultiBarRight", "Stance", "PetAction" }) do
    for i = 1, 12 do
        local Button = Bar .. "Button" .. i
        if _G[Button] then
            _G[Button .. "Icon"]:SetTexCoord(0.06, 0.94, 0.06, 0.94)
        end
    end
end

PaperDollFrame:HookScript("OnShow", function()
    MicroButtonPortrait:Show()
end)

PaperDollFrame:HookScript("OnHide", function()
    MicroButtonPortrait:Hide()
end)


--current HP/MANA value [ChatGPT rework for 3.3.5a]
local function CustomTextStatusBar_UpdateTextString(statusFrame)
    -- Use the current value from the status bar or the final value if it's set
    local value = statusFrame.finalValue or statusFrame:GetValue()

    -- Check if the TextString exists and the value is greater than 0
    if statusFrame.TextString and value and value > 0 then
        -- Set the text to the current value
        statusFrame.TextString:SetText(value)
        statusFrame.TextString:Show()
    else
        -- Hide the text string if there's no value to display
        if statusFrame.TextString then
            statusFrame.TextString:Hide()
        end
    end
end

-- Hook into the original TextStatusBar_UpdateTextString function
hooksecurefunc("TextStatusBar_UpdateTextString", CustomTextStatusBar_UpdateTextString)



--[ChatGPT rework for 3.3.5a]
local function Classification(self, forceNormalTexture)
    local classification = UnitClassification(self.unit);

    if classification == "elite" or classification == "worldboss" then
        self.borderTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Elite")
    elseif classification == "rareelite" then
        self.borderTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Rare-Elite")
    elseif classification == "rare" then
        self.borderTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Rare")
    else
        self.borderTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame")
    end
end

hooksecurefunc("TargetFrame_CheckClassification", Classification)



--smooth status bars(animated)
local floor = math.floor
local barstosmooth = {
    PlayerFrameHealthBar = "player",
    PlayerFrameManaBar = "player",
    TargetFrameHealthBar = "target",
    PetFrameHealthBar = "pet",
    PetFrameManaBar = "pet",
    TargetFrameManaBar = "target",
    FocusFrameHealthBar = "focus",
    FocusFrameManaBar = "focus",
    MainMenuExpBar = "",
    ReputationWatchStatusBar = "",
    PartyMemberFrame1HealthBar = "party1",
    PartyMemberFrame1ManaBar = "party1",
    PartyMemberFrame2HealthBar = "party2",
    PartyMemberFrame2ManaBar = "party2",
    PartyMemberFrame3HealthBar = "party3",
    PartyMemberFrame3ManaBar = "party3",
    PartyMemberFrame4HealthBar = "party4",
    PartyMemberFrame4ManaBar = "party4",
}

local smoothframe = CreateFrame("Frame")
local smoothing = {}

local function AnimationTick()
    local limit = 30 / GetFramerate()

    for bar, value in pairs(smoothing) do
        local cur = bar:GetValue()
        local new = cur + math.min((value - cur) / 3, math.max(value - cur, limit))
        if new ~= new then
            new = value
        end
        if cur == value or math.abs(new - value) < 2 then
            bar:SetValue_(value)
            smoothing[bar] = nil
        else
            bar:SetValue_(floor(new))
        end
    end
end

local function SmoothSetValue(self, value)
    self.finalValue = value
    if self.unit then
        local guid = UnitGUID(self.unit)
        if value == self:GetValue() or not guid or guid ~= self.lastGuid then
            smoothing[self] = nil
            self:SetValue_(value)
        else
            smoothing[self] = value
        end
        self.lastGuid = guid
    else
        local _, max = self:GetMinMaxValues()
        if value == self:GetValue() or self._max and self._max ~= max then
            smoothing[self] = nil
            self:SetValue_(value)
        else
            smoothing[self] = value
        end
        self._max = max
    end
end

local function SmoothBar(bar)
    if not bar.SetValue_ then
        bar.SetValue_ = bar.SetValue
        bar.SetValue = SmoothSetValue
    end
end

smoothframe:SetScript("OnUpdate", function()
    for _, plate in pairs(C_NamePlate.GetNamePlates(true)) do
        if plate:IsVisible() then
            local healthBar = plate:GetChildren()
            SmoothBar(healthBar)
        end
    end
    AnimationTick()
end)

for k, v in pairs(barstosmooth) do
    if _G[k] then
        SmoothBar(_G[k])
        _G[k]:SetScript("OnHide", function(frame)
            frame.lastGuid = nil;
            frame.max_ = nil
        end)
        if v ~= "" then
            _G[k].unit = v
        end
    end
end


-- statusbar.lockColor causes taints
local function colour(statusbar, unit)
    if (not statusbar or statusbar.lockValues) then
        return
    end

    if unit then
        if UnitIsPlayer(unit) and unit == statusbar.unit then
            if (UnitIsConnected(unit) and UnitClass(unit) and unit ~= "player" and not statusbar.lockColor) then
                -- ArenaFrames lock/unlock color
                local _, class = UnitClass(unit)
                local c = RAID_CLASS_COLORS[class]
                if c then
                    if class == "DEATHKNIGHT" then
                        -- experimental DK recoulouring feature (part1)
                        statusbar:SetStatusBarColor(0, 1, 0.6)
                    else
                        statusbar:SetStatusBarColor(c.r, c.g, c.b)
                    end
                end
            elseif unit == "player" then
                local value = UnitHealth("player")
                local _, max = PlayerFrameHealthBar:GetMinMaxValues()
                local r, g

                if ((value < 0) or (value > max)) then
                    return
                end

                if max > 0 then
                    value = value / max
                else
                    value = 0
                end

                if value > 0.5 then
                    r = (1.0 - value) * 2;
                    g = 1.0;
                elseif value > 0.25 and value < 0.5 then
                    r = 1.0;
                    g = value * 1.75;
                else
                    r = 1.0;
                    g = 0.0;
                end
                PlayerFrameHealthBar:SetStatusBarColor(r, g, 0.0)
            else
                statusbar:SetStatusBarColor(0.5, 0.5, 0.5)
            end
        end
    end
end
hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
    colour(self, self.unit)
end)

-- Remove flashing portraits
local function RemovePortraitFlash(self, r, g, b)
    if r ~= 1.0 or g ~= 1.0 or b ~= 1.0 then
        self:SetVertexColor(1.0, 1.0, 1.0)
    end
end

for _, i in pairs({ TargetFramePortrait, FocusFramePortrait, FocusFrameToTPortrait, TargetFrameToTPortrait }) do
    if i then
        hooksecurefunc(i, "SetVertexColor", RemovePortraitFlash)
    end
end

local function ChangeAlpha(self, a)
    if a ~= 1.0 then
        self:SetAlpha(1.0)
    end
end
hooksecurefunc(TargetFramePortrait, "SetAlpha", ChangeAlpha)
hooksecurefunc(FocusFramePortrait, "SetAlpha", ChangeAlpha)

-- Blacklist of frames where tooltip mouseover is hidden
GameTooltip:HookScript("OnShow", function(self, ...)
    local owner = self:GetOwner() and self:GetOwner():GetName()
    if owner then
        -- hide world object tooltips like torches and signs
        if owner == "UIParent" and not self:GetUnit() then
            self:Hide()
            return
        end
        -- hide tooltips owned by frames in the blacklist
        for i = 1, #tooltipOwnerBlacklist do
            if owner:find(tooltipOwnerBlacklist[i]) then
                self:Hide()
                return
            end
        end
    end
end)

--increasing bufframe debuff size
hooksecurefunc("DebuffButton_UpdateAnchors", function(buttonName, index)
    _G[buttonName .. index]:SetScale(1.23)
end)



-- Hide HealthBar under unit tooltips + Hide Titles, PVP flag and Guild Names from Player tooltips
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
    GameTooltipStatusBar:Hide()

    local _, unit = self:GetUnit()
    if not unit then
        return
    end

    if UnitIsPlayer(unit) then
        local name = UnitName(unit)
        GameTooltipTextLeft1:SetFormattedText("%s", name)

        local guild = GetGuildInfo(unit)
        if guild and strfind(GameTooltipTextLeft2:GetText(), guild) then
            GameTooltipTextLeft2:SetFormattedText("")
        end

        for i = 2, self:NumLines() do
            local lines = _G["GameTooltipTextLeft" .. i]
            if i > 2 then
                if lines:GetText() == PVP_ENABLED then
                    lines:SetText("")
                end
            end
        end

        -- Add class-coloured names on mouseover tooltips
        local _, class = UnitClass(unit)
        local color = class and RAID_CLASS_COLORS[class]
        if color then
            local text = GameTooltipTextLeft1:GetText()
            if text then
                if class == "DEATHKNIGHT" then
                    GameTooltipTextLeft1:SetFormattedText("|cff00ff99%s|r", text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
                else
                    GameTooltipTextLeft1:SetFormattedText("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text:match("|cff\x\x\x\x\x\x(.+)|r") or text)
                end
            end
        end
    end
    self:Show()
end)


-- stop Gladdy from showing nameplates (necessary for the next script) !! IMPORTANT - You MUST use the "Lock Frame" function in General tab of Gladdy alongside with this!!

-- IT IS ALSO ABSOLUTELY NECESSARY FOR YOU TO DISABLE THE "Totem Plates" PLUGIN IN GLADDY UI

-- XYZ - not necessary on 3.3.5a?? gladdy has this built in??
if IsAddOnLoaded("Gladdy") then
    local Gladdy = LibStub and LibStub("Gladdy")
    if Gladdy then
        local TotemPlates = Gladdy.modules["Totem Plates"]
        if TotemPlates then
            local TotemPlates_ToggleAddon = TotemPlates.ToggleAddon
            function TotemPlates:ToggleAddon(nameplate, show)
                if not show then
                    TotemPlates_ToggleAddon(self, nameplate, show)
                end
            end
        end
    end
end


-- Highlight Tremor Totem (disable nameplates of everything else) + disable Snake Trap Cancer + prevent displaying already dead Tremor Totem (retarded Classic-like behavior)
local ShrinkPlates = {
    ["Viper"] = true,
    ["Venomous Snake"] = true,
}

local HideNameplateUnits = {
    ["Underbelly Croc"] = true,
    ["Vern"] = true,
    ["Army of the Dead Ghoul"] = true,
    ["Spirit Wolf"] = true,
    ["Treant"] = true,
    ["Risen Ghoul"] = true,
    ["31216"] = true, -- Mirror Image
}

local ShowNameplatePetIds = {
    ["417"] = true, -- Felhunter
    ["1863"] = true, -- Succubus
}

local tremorTotems = {} -- {[totem GUID] = {[shaman]=GUID, nameplate=<nameplate frame>}, ...}
local nameplatesToRecheck = {}

local plateEventFrame = CreateFrame("Frame")

local function visibilityPlate(plate, bool)
    local HealthBar, CastBar = plate:GetChildren()
    local threat, hpborder, cbshield, cbborder, cbicon, overlay, oldname, level, bossicon, raidicon, elite = plate:GetRegions()

    if bool then
        oldname:Hide()
        threat:SetAlpha(0)
        hpborder:SetAlpha(0)
        overlay:SetAlpha(0)
        level:SetAlpha(0)
        bossicon:SetAlpha(0)
        raidicon:SetAlpha(0)
        elite:SetAlpha(0)
        HealthBar:Hide()
        CastBar:Hide()
        HealthBar:SetAlpha(0)
        CastBar:SetAlpha(0)

        cbshield:ClearAllPoints()
        cbshield:SetPoint("CENTER", UIParent, "CENTER", 10000, 10000)

        cbborder:ClearAllPoints()
        cbborder:SetPoint("CENTER", UIParent, "CENTER", 10000, 10000)

        cbicon:ClearAllPoints()
        cbicon:SetPoint("CENTER", UIParent, "CENTER", 10000, 10000)
    else
        oldname:Show()
        threat:SetAlpha(1)
        hpborder:SetAlpha(1)
        cbshield:SetAlpha(1)
        cbborder:SetAlpha(1)
        cbicon:SetAlpha(1)
        overlay:SetAlpha(1)
        level:SetAlpha(1)
        bossicon:SetAlpha(1)
        raidicon:SetAlpha(1)
        elite:SetAlpha(1)
        HealthBar:Show()
        CastBar:Show()
        HealthBar:SetAlpha(1)
        CastBar:SetAlpha(1)

        cbshield:ClearAllPoints()
        cbshield:SetPoint("CENTER", plate, "CENTER", 0, -17.58)
        cbborder:ClearAllPoints()
        cbborder:SetPoint("CENTER", plate, "CENTER", 0, -17.58)
        cbicon:ClearAllPoints()
        cbicon:SetPoint("CENTER", cbborder, "BOTTOMLEFT", 14.41, 9.12)
    end
end

local function HideNameplate(nameplate)
    if nameplate then
        nameplate.wasHidden = true
        visibilityPlate(nameplate, true)
    end
end

local function HandleNewNameplate(nameplate, unit)
    local name = UnitName(unit)
    if name == "Unknown" then
        nameplate.recheckGuid = UnitGUID(unit)
        nameplatesToRecheck[UnitGUID(unit)] = nameplate
        plateEventFrame:Show()
        return
    end

    local HealthBar = nameplate:GetChildren()
    local _, hpborder, _, _, _, _, oldname = nameplate:GetRegions()

    local creatureType, _, _, _, _, npcId = string.split("-", UnitGUID(unit))
    -- the rest of nameplate stuff
    if name:match("Totem") and not name:match("Tremor Totem") then
        HideNameplate(nameplate)
    elseif (HideNameplateUnits[name] or HideNameplateUnits[npcId])
            or (creatureType == "Pet" and not ShowNameplatePetIds[npcId]) then
        HideNameplate(nameplate)
    elseif ShrinkPlates[name] then
        HideNameplate(nameplate)
        oldname:Show()
        oldname:SetTextColor(1, 0, 0)
    elseif name == "Tremor Totem" then
        local guid = UnitGUID(unit)
        if guid then
            local totem = tremorTotems[guid]
            if totem then
                totem.nameplate = nameplate
            else
                tremorTotems[guid] = { ["shaman"] = "Unknown", ["nameplate"] = nameplate }
            end
            nameplate.tremorTotemGuid = guid
            hpborder:SetTexture("Interface\\Addons\\TextureScript\\Nameplate-Border-TREMOR")
        end
    elseif UnitCreatureFamily(unit) == "Succubus" then
        oldname:SetText("Succubus")
    elseif UnitCreatureFamily(unit) == "Felhunter" then
        oldname:SetText("Felhunter")
    elseif UnitPlayerControlled(unit) and not UnitIsPlayer(unit) then
        HideNameplate(nameplate)
    end
end

-- PlaySound whenever an enemy casts Tremor Totem in arena (previously handled in a standalone addon "EvolveAlert" - https://github.com/Evolvee/EvolvePWPUI-ClassicTBC/tree/main/Interface/AddOns/EvolveAlert)
--xyz: remove the healing part etc? its not needed anymore - im not playing priest for now
local COMBATLOG_FILTER_HOSTILE_PLAYERS = COMBATLOG_FILTER_HOSTILE_PLAYERS;
local CombatLog_Object_IsA = CombatLog_Object_IsA
local eventRegistered = {
    ["SPELL_CAST_SUCCESS"] = true,
    ["SPELL_SUMMON"] = true,
    ["SWING_DAMAGE"] = true,
    ["RANGE_DAMAGE"] = true,
    ["SPELL_DAMAGE"] = true,
    ["SPELL_HEAL"] = true,
    ["SPELL_PERIODIC_HEAL"] = true,

}

local function PlateScript(...)
    local _, action, sourceGuid, _, sourceFlags, destGuid, destName, _, ex1, _, _, ex4 = ...

    local isSourceEnemy = CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS)
    local _, instanceType = IsInInstance()

    if not (eventRegistered[action]) then
        return
    end

    if isSourceEnemy and instanceType == "arena" and ex1 == 8143 and action == "SPELL_CAST_SUCCESS" then
        PlaySound(12889)
    end

    if destName == "Tremor Totem" then
        if action == "SPELL_SUMMON" then
            if destName == "Tremor Totem" then
                for totem, info in pairs(tremorTotems) do
                    if info.shaman == sourceGuid then
                        local nameplate = info.nameplate
                        if nameplate and nameplate.tremorTotemGuid == totem and nameplate then
                            nameplate.wasHidden = true
                            visibilityPlate(nameplate, true)
                        end
                    end
                end
                tremorTotems[destGuid] = { ["shaman"] = sourceGuid }
            end
        else
            local damage
            if action == "SWING_DAMAGE" or action == "RANGE_DAMAGE" then
                damage = ex1
            elseif action == "SPELL_DAMAGE" then
                damage = ex4
            else
                damage = 0
            end

            if damage >= 5 then
                local totem = tremorTotems[destGuid]
                if totem then
                    local nameplate = totem.nameplate
                    if nameplate and nameplate.tremorTotemGuid == destGuid and nameplate then
                        nameplate.wasHidden = true
                        visibilityPlate(nameplate, true)
                    end
                end
            end
        end
    end
end
plateEventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
plateEventFrame:SetScript("OnEvent", function(self, event, ...)
    PlateScript(...)
end)


-- Adding class icons on party members inside arena for more clarity where my teammates are (behind los etc.)
local classmarkers = {
    ["ROGUE"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Rogue",
    ["PRIEST"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Priest",
    ["WARRIOR"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Warrior",
    ["PALADIN"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Paladin",
    ["HUNTER"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Hunter",
    ["DRUID"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Druid",
    ["MAGE"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Mage",
    ["SHAMAN"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Shaman",
    ["WARLOCK"] = "Interface\\AddOns\\TextureScript\\PartyIcons\\Warlock",
}

local function AddPlates(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
    if not nameplate then
        return
    end

    local HealthBar, CastBar = nameplate:GetChildren()
    local threat, hpborder, cbshield, cbborder, cbicon, overlay, oldname, level, bossicon, raidicon, elite = nameplate:GetRegions()

    -- Change border plate
    hpborder:SetTexture("Interface\\Addons\\TextureScript\\Nameplate-Border")

    -- hide level and expand healthbar
    level:Hide()
    bossicon:Hide()
    raidicon:Hide()
    elite:Hide()

    HealthBar:ClearAllPoints()
    HealthBar:SetPoint("BOTTOMLEFT", nameplate, "BOTTOMLEFT", 4, 4)
    HealthBar:SetPoint("BOTTOMRIGHT", nameplate, "BOTTOMRIGHT", -4, 4)

    -- ChatGPT "fix" for displaying fucked up status bar HP values due to the bar resizing
    local newWidth = nameplate:GetWidth() - 8  -- Adjust this if necessary
    HealthBar:SetWidth(newWidth)


    -- Move the selection highlight
    overlay:ClearAllPoints()
    overlay:SetPoint("CENTER", UIParent, "CENTER", 10000, 10000)

    oldname:SetJustifyH("CENTER")
    oldname:SetFont("Fonts\\FRIZQT__.TTF", 14)
    oldname:SetWidth(160)

    -- Class icon on friendly plates in arena, WRATH??
    local _, unitClass = UnitClass(unit)
    local _, type = IsInInstance()

    if UnitIsPlayer(unit) and UnitIsFriend("player", unit) and type == "arena" then
        if not nameplate.classTexture then
            nameplate.classTexture = nameplate:CreateTexture(nil, "OVERLAY")
            nameplate.classTexture:SetSize(50, 50)
            nameplate.classTexture:SetPoint("CENTER", nameplate, "CENTER", 0, 20)
            nameplate.classTexture:Hide()
        end
        if unitClass then
            nameplate.classTexture:SetTexture(classmarkers[unitClass])
            if not nameplate.classTexture:IsShown() then
                nameplate.classTexture:Show()
            end
        end

        visibilityPlate(nameplate, true)
    else
        if nameplate.classTexture then
            nameplate.classTexture:Hide()
        end

        visibilityPlate(nameplate, false)
    end

    -- This is needed to restore scale due to the ShrinkPlates
    if HealthBar:GetScale() < 1.0 then
        HealthBar:SetScale(1.0)
        oldname:SetAlpha(1.0)
    end
    HandleNewNameplate(nameplate, unit)
end

local function RemovePlate(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
    if not nameplate then
        return
    end
    nameplate.tremorTotemGuid = nil
    tremorTotems[UnitGUID(unit) or ""] = nil
    if nameplate then
        if nameplate.wasHidden then
            nameplate.wasHidden = nil
            visibilityPlate(nameplate, false)
        end
    end
end


-- Since we disabled macro & keybind text above, there is no way to tell when target is too far to cast on, so adding this mechanic instead... (colouring action bar buttons that are out of range & out of mana to be casted...)
local IsActionInRange = IsActionInRange
local IsUsableAction = IsUsableAction

local function Usable(button)
    local isUsable, notEnoughMana = IsUsableAction(button.action)
    local icon = _G[button:GetName() .. "Icon"]

    if isUsable then
        icon:SetVertexColor(1.0, 1.0, 1.0, 1.0)
        icon:SetDesaturated(0)
    elseif notEnoughMana then
        icon:SetVertexColor(0.3, 0.3, 0.3, 1.0)
        icon:SetDesaturated(1)
    else
        icon:SetVertexColor(0.4, 0.4, 0.4, 1.0)
        icon:SetDesaturated(1)
    end
end

hooksecurefunc("ActionButton_OnUpdate", function(self)
    local _, oom = IsUsableAction(self.action)
    local valid = IsActionInRange(self.action);
    local checksRange = (valid ~= nil)
    local inRange = checksRange and valid;
    local icon = _G[self:GetName() .. "Icon"]

    if checksRange and inRange ~= 1 then
        if oom then
            icon:SetVertexColor(0.3, 0.3, 0.3, 1.0)
            icon:SetDesaturated(1)
        else
            icon:SetVertexColor(1.0, 0.35, 0.35, 0.75)
            icon:SetDesaturated(0)
        end
    else
        Usable(self)
    end

    -- Preventing the black action bar borders to be hidden due to pressing an action button
    local nt = _G[self:GetName() .. "NormalTexture"]
    if nt and not nt:IsShown() then
        nt:Show()
    end
end)


-- hide the cooldown bling on action bars (Detective Pyralis is back on the case!)
local cooldownWatcherFrame = CreateFrame("frame")
local cooldownButtons = {} -- cooldown frames to quickly look them up: {[button]=end_time, ...}
local cooldownQueue = {} -- priority queue with the lowest ending time last: {[1]={button, end_time}, ...}
local cooldownCount = 0 -- amount of cooldowns in the lists
local cooldownNextTime = 0 -- cache of cooldownQueue[cooldownCount][2] to probably overoptimize the OnUpdate script

local function CooldownRemoveButton(button)
    if cooldownButtons[button] then
        cooldownButtons[button] = nil
        for i=cooldownCount, 1, -1 do
            if button == cooldownQueue[i][1] then
                table_remove(cooldownQueue, i)
                break
            end
        end

        cooldownCount = cooldownCount - 1
        if cooldownCount == 0 then
            cooldownWatcherFrame:Hide()
        else
            cooldownNextTime = cooldownQueue[cooldownCount][2]
        end
    end
end
local function CooldownAddButton(button, endTime)
    -- endTime = endTime - .033 -- if the bling shows up for a frame, maybe set the end time slightly before the real one

    -- cooldown updates seem to happen twice so skip duplicate additions
    local foundTime = cooldownButtons[button]
    if foundTime then
        if foundTime == endTime then
            return
        end
        -- a new time, so remove the old one first
        CooldownRemoveButton(button)
    end

    cooldownButtons[button] = endTime
    local added
    for i=cooldownCount, 1, -1 do
        if endTime <= cooldownQueue[i][2] then
            table_insert(cooldownQueue, i+1, {button, endTime})
            added = true
            break
        end
    end
    if not added then
        table_insert(cooldownQueue, 1, {button, endTime})
    end
    cooldownCount = cooldownCount + 1
    cooldownNextTime = cooldownQueue[cooldownCount][2]
    if cooldownCount == 1 then
        cooldownWatcherFrame:Show()
    end
    button:SetAlpha(1)
end
hooksecurefunc("CooldownFrame_SetTimer", function(self, start, duration, enable)
    local name = self:GetName()
    if name and (string_match(name, "^MultiBar%w+Button") or string_match(name, "^P?e?t?ActionButton")) then
        if duration > 0 and enable > 0 and start > 0 then
            CooldownAddButton(self, start + duration)
        elseif enable == 0 then
            CooldownRemoveButton(self)
        end
    end
end)

cooldownWatcherFrame:Hide()
cooldownWatcherFrame:SetScript("OnUpdate", function()
    if cooldownCount > 0 then
        local now = GetTime()
        while cooldownCount > 0 and now >= cooldownNextTime do
            local button = cooldownQueue[cooldownCount][1]
            button:SetAlpha(0)
            CooldownRemoveButton(button)
        end
    end
end)


-- Remove debuffs from Target of Target frame
for _, totFrame in ipairs({ TargetFrameToT, FocusFrameToT }) do
    totFrame:HookScript("OnShow", function()
        for i = 1, 4 do
            local dbf = _G[totFrame:GetName() .. "Debuff" .. i]
            if dbf and dbf:GetAlpha() > 0 then
                dbf:SetAlpha(0)
            end
        end
    end)
end



--XYZ - second half of the code is used for nameplate position which we will need to do as WELL
-- Hide the friendly nameplate cast bars
--hooksecurefunc("Nameplate_CastBar_AdjustPosition", function(self)
--    if not self or self:IsForbidden() then
--        return
--    end

--    if UnitIsFriend("player", self.unit) then
--        self:Hide()
--    end

--    local parentFrame = self:GetParent()
--    if self.BorderShield:IsShown() then
--        self:ClearAllPoints()
--        self:SetPoint("TOP", parentFrame.healthBar, "BOTTOM", 9, -12)
--    else
--        self:ClearAllPoints()
--        self:SetPoint("TOP", parentFrame.healthBar, "BOTTOM", 9, -4)
--    end
--end)




-- Changing DK default colour in order to bring more clarity
--hooksecurefunc("CompactUnitFrame_UpdateHealthColor", function(frame)
--    if not frame.unit or frame:IsForbidden() or not string.find(frame.unit, "nameplate") then
--        return
--    end

--    if UnitIsConnected(frame.unit) and UnitIsPlayer(frame.unit) then
--        local _, class = UnitClass(frame.unit)
--        if class == "DEATHKNIGHT" then
--            -- experimental DK recoulouring feature (part2)
--            frame.healthBar:SetStatusBarColor(0, 1, 0.6)
--        end
--    end
--end)

-- leave arena on PVP icon doubleclick (useful when playing against RM/RR retards)
MiniMapBattlefieldFrame:HookScript("OnDoubleClick", function()
    if select(2, IsInInstance()) == "arena" then
        LeaveBattlefield()
    end
end)


-- "Fix" SCT
--not needed on 3.3.5a? We will see...
--[[
if not CombatText then
    EventUtil.ContinueOnAddOnLoaded("Blizzard_CombatText", function()
        CombatText_ClearAnimationList = function()
            return
        end
    end)
else
    CombatText_ClearAnimationList = function()
        return
    end
end
]]--



--
local evolvedFrame = CreateFrame("Frame")
evolvedFrame:RegisterEvent("ADDON_LOADED")
evolvedFrame:RegisterEvent("PLAYER_LOGIN")
evolvedFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
evolvedFrame:RegisterEvent("GOSSIP_SHOW")
evolvedFrame:RegisterEvent("UPDATE_BINDINGS")
--evolvedFrame:RegisterUnitEvent("UNIT_PET", "player")
evolvedFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
evolvedFrame:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
evolvedFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        CustomCvar() -- Set our CVAR values
        OnInit() -- Init tons of shit
        UpdateBinds(self)
        self:UnregisterEvent("PLAYER_LOGIN")
    elseif event == "UNIT_PET" then
        local _, type = IsInInstance()
        if type ~= "arena" then
            return
        end
        if GetRaidTargetIndex("pet") ~= 3 then
            SetRaidTarget("pet", 3)
        end
    elseif event == "UPDATE_BINDINGS" then
        UpdateBinds(self)
    elseif event == "ADDON_LOADED" then
        local addon = ...
        DarkenFrames(addon)
        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_ENTERING_WORLD" then
        local _, type = IsInInstance()
        if type == "arena" then
            if GetCVar("nameplateShowFriends") == "0" then
                SetCVar("nameplateShowFriends", 1)
            end
            inArena = true
        else
            if GetCVar("nameplateShowFriends") == "1" then
                SetCVar("nameplateShowFriends", 0)
            end
            inArena = false
        end
        -- NAMEPLATE STUFF
    elseif event == "NAME_PLATE_UNIT_ADDED" then
        local unit = ...
        AddPlates(unit)
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        local unit = ...
        RemovePlate(unit)
    end
end)



--@@ 3.3.5.a SHIT ONLY:


-- Auto repair / Auto sell grey shit
local g = CreateFrame("Frame")
g:RegisterEvent("MERCHANT_SHOW")

g:SetScript("OnEvent", function()
    local bag, slot
    for bag = 0, 4 do
        for slot = 0, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link and (select(3, GetItemInfo(link)) == 0) then
                UseContainerItem(bag, slot)
            end
        end
    end

    if (CanMerchantRepair()) then
        local cost = GetRepairAllCost()
        if cost > 0 then
            local money = GetMoney()
            if IsInGuild() then
                local guildMoney = GetGuildBankWithdrawMoney()
                if guildMoney > GetGuildBankMoney() then
                    guildMoney = GetGuildBankMoney()
                end
                if guildMoney > cost and CanGuildBankRepair() then
                    RepairAllItems(1)
                    ChatFrame1:AddMessage(format("|cfff07100Repair cost covered by G-Bank: %.1fg|r", cost * 0.0001))
                    return
                end
            end
            if money > cost then
                RepairAllItems()
                ChatFrame1:AddMessage(format("|cffead000Repair cost: %.1fg|r", cost * 0.0001))
            else
                ChatFrame1:AddMessage("Not enough gold to cover the repair cost.")
            end
        end
    end
end)


COMBAT_TEXT_RESIST = "NEVER LUCKY"
COMBAT_TEXT_MISS = "NEVER LUCKY"

-- trying to remove the cancer weather that is not part of the video settings as it used to be in 2.4.3: /console set weatherdensity 0 // /console WeatherDensity 0

-- Disable the ability to scroll chat with mouse wheel (fucks binds with the mouse-wheel-up/down): /console chatMouseScroll 0


--Login message informing all scripts of this file were properly executed
ChatFrame1:AddMessage("EvolvePWPUI-TBC on 3.3.5a Client (v0.1 BETA) Loaded successfully!", 0, 205, 255)
ChatFrame1:AddMessage("Check for updates at:", 0, 205, 255)
ChatFrame1:AddMessage("https://github.com/Evolvee/EvolvePWPUI-335a-TBC", 0, 205, 255)