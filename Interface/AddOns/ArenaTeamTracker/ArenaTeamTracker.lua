--[[
Name: Arena Team Tracker Classic
Author(s): by Izy inspired by the old Party Ability Bars (PAB)
Contact/support at twitch.tv/imedia
Description: Track all selected cooldowns of your party members
--]]

local addon, SPELLDB = ...
local addon, ATTdefault = ...
local lower = string.lower
local match = string.match
local remove = table.remove
local GetSpellInfo = GetSpellInfo
local UnitClass = UnitClass
local UnitGUID = UnitGUID
local UnitName = UnitName
local IsInInstance = IsInInstance
local IsInGroup = IsInGroup
local IsInRaid = IsInRaid
local UnitRace = UnitRace
local UnitLevel = UnitLevel
local GetNumSubgroupMembers = GetNumSubgroupMembers
local CooldownFrame_Set = CooldownFrame_Set
local LGlow = LibStub("LibButtonGlow-1.0")
local ChatPrefix = "ATT-CheckC"
local ATTversion = 7.45
local ATTnewversion

local db

local ATT = CreateFrame("Frame", "ATT", UIParent)
local ATTIcons = CreateFrame("Frame", nil, UIParent)
local ATTAnchor = CreateFrame("Frame", nil, UIParent)
local ATTTooltip = CreateFrame("GameTooltip", "ATTGameTooltip", nil, "GameTooltipTemplate")
local ATTDampframe = CreateFrame("Frame", nil, UIParent)
ATTDampframe:SetPoint("TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, 0)
ATTDampframe:SetSize(150, 15)

local iconlist = {}
local anchors = {}
local activeGUIDS = {}

local function print(...)
    for i = 1, select('#', ...) do
        ChatFrame1:AddMessage("|cff33ff99ATT|r: " .. select(i, ...))
    end
end

local validUnits = {
    ["player"] = true,
    ["party1"] = true,
    ["party2"] = true,
    ["party3"] = true,
    ["party4"] = true,
    ["pet"] = true,
    ["partypet1"] = true,
    ["partypet2"] = true,
    ["partypet3"] = true,
    ["partypet4"] = true,
}

--Trinkets
local PvPTrinketName = GetSpellInfo(42292)
local Stoneform = GetSpellInfo(20594)
local Berserking = GetSpellInfo(20554)
local WillOfTheForsaken = GetSpellInfo(7744)

local function convertspellids(t)
    local temp = {}
    for class, table in pairs(t) do
        temp[class] = {}
        for spec, spells in pairs(table) do
            spec = tostring(spec)
            temp[class][spec] = {}
            for k, spell in pairs(spells) do
                local spellInfo = GetSpellInfo(spell[1])
                if spellInfo then
                    temp[class][spec][#temp[class][spec] + 1] = { ability = spellInfo, cooldown = spell[2], id = spell[1], maxcharges = spell[3], talent = spell.talent }
                end
            end
        end
    end
    return temp
end

local function convertSpecialIds(t)
    local temp = {}
    for i, v in pairs(t) do
        if v.ability then
            v.id = v.ability
            v.ability = GetSpellInfo(v.ability)
            table.insert(temp, v)
        end
    end
    return temp
end

local ATTdefaultAbilities = convertspellids(ATTdefault.defaultAbilities)

local dbRacial = convertSpecialIds(dbRacial)
local dbTrinket = convertSpecialIds(dbTrinket)

local groupedCooldowns = {
    ["SHAMAN"] = {
        [49231] = 1, -- Earth Shock
        [49233] = 1, -- Flame Shock
        [49236] = 1, -- Frost Shock
        [57994] = 1, -- Wind Shock
    },
    ["HUNTER"] = {
        [49067] = 1, -- Explosive Trap
        [14311] = 1, -- Freezing Trap
        [13809] = 1, -- Frost Trap
        [49056] = 1, -- Immolation Trap
        [34600] = 1, -- Snake Trap
    },
    ["MAGE"] = {
        [43010] = 1, -- Fire Ward
        [43012] = 1, -- Frost Ward
    },
}
local function Gconvertspellids(t)
    local temp = {}
    for class, spells in pairs(t) do
        temp[class] = {}
        for k, spell in pairs(spells) do
            temp[class][GetSpellInfo(spell)] = spell
        end
    end
    return temp
end
groupedCooldowns = Gconvertspellids(groupedCooldowns)

local cooldownResetters = {
    [11958] = { -- Cold Snap
        [42931] = 1, -- Cone of Cold
        [42917] = 1, -- Frost Nova
        [43012] = 1, -- Frost Ward
        [43039] = 1, -- Ice Barrier
        [45438] = 1, -- Ice Block
        [31687] = 1, -- Summon Water Elemental
        [44572] = 1, -- Deep Freeze
        [44545] = 1, -- Fingers of Frost
        [12472] = 1, -- Icy Veins
    },
    [14185] = { -- Preparation
        [14177] = 1, -- Cold Blood
        [26669] = 1, -- Evasion
        [11305] = 1, -- Sprint
        [26889] = 1, -- Vanish
        [36554] = 1, -- Shadowstep
    },
    [23989] = "ALL", -- Readiness
}

local temp = {}
for k, v in pairs(cooldownResetters) do
    local spellInfo = GetSpellInfo(k)
    if spellInfo then
        temp[spellInfo] = {}
        if type(v) == "table" then
            for id in pairs(v) do
                local spellInfo2 = GetSpellInfo(id)
                if spellInfo2 then
                    temp[spellInfo][spellInfo2] = 1
                end
            end
        else
            temp[GetSpellInfo(k)] = v
        end
    end
end

cooldownResetters = temp
temp = nil
convertspellids = nil

-- Player Inspect
local inspected = {}
local inspect_queue = {}
local nextInspectTick = 0

local supportedUnits = { "player", "party1", "party2", "party3", "party4" }
function ATT:FindUnitByGUID(guid)
    if guid then
        for i, unit in pairs(supportedUnits) do
            if UnitGUID(unit) == guid then
                return unit
            end
        end
    end
end

function ATT:GetSpecByGUID(guid)
    return inspected[guid]
end

function ATT:GetSpecByUnit(unit)
    local guid = UnitGUID(unit)
    if guid then
        return inspected[guid]
    end
end

function ATT:SavePositions()
    for k, anchor in ipairs(anchors) do
        local scale = anchor:GetEffectiveScale()
        local worldscale = UIParent:GetEffectiveScale()
        local x = anchor:GetLeft() * scale
        local y = (anchor:GetTop() * scale) - (UIParent:GetTop() * worldscale)
        if not db.positions[k] then
            db.positions[k] = {}
        end
        db.positions[k].x = x
        db.positions[k].y = y
    end
end

function ATT:RaidInfo()
    for i = 1, 41 do
        local n, _, raidinfo = GetRaidRosterInfo(i)
        if n == UnitName("player") then
            return raidinfo
        end
    end
end

function ATT:FindCompactRaidFrameByUnit(unit)
    if not unit or not UnitGUID(unit) then
        return
    end
    for i = 1, 41 do
        local frame = nil
        if CompactRaidFrameManager_GetSetting("KeepGroupsTogether") then
            if IsInRaid() then
                raidinfo = self:RaidInfo()
                frame = _G["CompactRaidGroup" .. raidinfo .. "Member" .. i]
            else
                frame = _G["CompactPartyFrameMember" .. i]
            end
        else
            if _G["ElvUF_PartyGroup1UnitButton" .. i] then
                frame = _G["ElvUF_PartyGroup1UnitButton" .. i]
            elseif _G["TukuiPartyUnitButton" .. i] then
                frame = _G["TukuiPartyUnitButton" .. i]
            elseif _G["SUFHeaderpartyUnitButton" .. i] then
                frame = _G["SUFHeaderpartyUnitButton" .. i]
            elseif _G["Grid2LayoutHeader1UnitButton" .. i] then
                frame = _G["Grid2LayoutHeader1UnitButton" .. i]
                --	 elseif _G["XPerl_Raid_Grp"..i.."UnitButton"..j] then frame = _G["XPerl_Raid_Grp"..i.."UnitButton"..j]
            else
                frame = _G["CompactRaidFrame" .. i] or _G["ElvUF_PartyGroup1UnitButton" .. i]
            end
        end
        if frame and frame.unit and UnitGUID(frame.unit) == UnitGUID(unit) then
            return frame
        end
    end
end

function ATT:LoadPositions()
    db.positions = db.positions or {}
    for k, anchor in ipairs(anchors) do
        anchors[k]:ClearAllPoints()
        local raidFrame
        if db.attach then
            raidFrame = self:FindCompactRaidFrameByUnit(k == 5 and "player" or "party" .. k)
        end
        if raidFrame then
            if db.horizontal then
                anchors[k]:SetPoint(db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", raidFrame, db.growLeft and "BOTTOMRIGHT" or "BOTTOMLEFT", db.offsetX, db.offsetY)
            else
                anchors[k]:SetPoint(db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", raidFrame, db.growLeft and "TOPLEFT" or "TOPRIGHT", db.offsetX, db.offsetY)
            end
        else
            if db.positions[k] then
                local x = db.positions[k].x
                local y = db.positions[k].y
                local scale = anchors[k]:GetEffectiveScale()
                anchors[k]:SetPoint("TOPLEFT", UIParent, "TOPLEFT", x / scale, y / scale)
            else
                anchors[k]:SetPoint("CENTER", UIParent, "CENTER")
            end
        end
    end
end

function ATT:CreateAnchors()
    local backdrop = { bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "", tile = false, }
    for i = 1, 41 do
        --here
        local anchor = CreateFrame("Frame", "ATTAnchor" .. i, ATTAnchor, "BackdropTemplate")
        anchor:SetBackdrop(backdrop)
        anchor:SetHeight(15)
        anchor:SetWidth(15)
        anchor:SetBackdropColor(1, 0, 0, 1)
        anchor:EnableMouse(true)
        anchor:SetMovable(true)
        anchor:Show()
        anchor.icons = {}
        anchor.HideIcons = function()
            for k, icon in ipairs(anchor.icons) do
                icon:Hide();
                icon.inUse = nil
            end
        end
        anchor:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" and not db.attach then
                self:StartMoving()
            end
        end)
        anchor:SetScript("OnMouseUp", function(self, button)
            if button == "LeftButton" and not db.attach then
                self:StopMovingOrSizing();
                ATT:SavePositions()
            end
        end)
        anchor:Hide()
        anchors[i] = anchor
        local index = anchor:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        index:SetPoint("CENTER")
        index:SetText(i)
    end
end

-- creates a new raw frame icon that can be used/reused to show cooldowns
local function CreateIcon(anchor)
    local icon = CreateFrame("Frame", anchor:GetName() .. "Icon" .. (#anchor.icons + 1), ATTIcons, "ATTButtonTemplate")
    icon:SetSize(40, 40)
    local cd = CreateFrame("Cooldown", icon:GetName() .. "Cooldown", icon, "CooldownFrameTemplate")
    cd:SetHideCountdownNumbers(false)
    icon.cd = cd
    icon.Start = function(sentCD, nextcharge)
        icon.cooldown = tonumber(sentCD)
        if icon.maxcharges then
            local charges = tonumber(icon.chargesText:GetText():match("^[0-9]+$"))
            if charges == 2 or nextcharge == icon.maxcharges then
                CooldownFrame_Set(cd, GetTime(), icon.cooldown, 1, 1, 1)
                icon.cd:SetDrawEdge(true)
                icon.cd:SetDrawSwipe(false)
                icon.cd:SetHideCountdownNumbers(true)
                icon.starttime = GetTime()
                charges = charges - 1
                icon.chargesText:SetText(charges)
            elseif charges == 1 and nextcharge == 5 then
                CooldownFrame_Set(cd, GetTime(), icon.cooldown, 1)
                icon.cd:SetDrawEdge(true)
                icon.cd:SetDrawSwipe(false)
                icon.cd:SetHideCountdownNumbers(true)
                icon.starttime = GetTime()
                icon.chargesText:SetText(charges)
            elseif charges == 1 and nextcharge == 1 and icon.starttime < GetTime() then
                CooldownFrame_Set(cd, icon.starttime, icon.cooldown, 1)
                icon.cd:SetDrawEdge(false)
                icon.cd:SetDrawSwipe(true)
                icon.cd:SetHideCountdownNumbers(false)
                --icon.starttime = GetTime()
                charges = charges - 1
                icon.chargesText:SetText(charges)
            end
        else
            CooldownFrame_Set(cd, GetTime(), icon.cooldown, 1)
            icon.starttime = GetTime()
        end

        icon:Show()
        icon.active = true;
        activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
        activeGUIDS[icon.GUID][icon.ability] = activeGUIDS[icon.GUID][icon.ability] or {}
        activeGUIDS[icon.GUID][icon.ability].starttime = icon.starttime
        activeGUIDS[icon.GUID][icon.ability].cooldown = icon.cooldown
    end
    icon.Stop = function()
        CooldownFrame_Set(cd, 0, 0, 0);
        icon.starttime = 0
    end

    icon.SetTimer = function(starttime, cooldown)
        CooldownFrame_Set(cd, starttime, cooldown, 1)
        icon.active = true
        icon.starttime = starttime
        icon.cooldown = cooldown
    end
    local texture = icon:CreateTexture(nil, "ARTWORK")
    texture:SetAllPoints(true)
    icon.texture = texture

    ATT:ApplyIconTextureBorder(icon)

    icon.chargesText = icon:CreateFontString(nil, nil, "DialogButtonHighlightText")
    icon.chargesText:SetTextColor(1, 1, 1)
    icon.chargesText:SetText("")
    icon.chargesText:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT")
    -- tooltip:
    icon:EnableMouse()
    icon:SetScript('OnEnter', function()
        if db.showTooltip and icon.abilityID then
            ATTTooltip:ClearLines()
            ATTTooltip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
            ATTTooltip:SetSpellByID(icon.abilityID)
        end
    end)
    icon:SetScript('OnLeave', function()
        if db.showTooltip and icon.abilityID then
            ATTTooltip:ClearLines()
            ATTTooltip:Hide()
        end
    end)
    return icon
end


-- adds a new icon to icon list of anchor
function ATT:AddIcon(icons, anchor)
    local newicon = CreateIcon(anchor)
    iconlist[#iconlist + 1] = newicon
    icons[#icons + 1] = newicon
    return newicon
end

-- applies texture border to an icon
function ATT:ApplyIconTextureBorder(icon)
    if db.showIconBorders then
        icon.texture:SetTexCoord(0, 1, 0, 1)
    else
        icon.texture:SetTexCoord(0.07, 0.9, 0.07, 0.90)
    end
end

-- hides anchors currently not in use due to too few party members	
function ATT:ToggleAnchorDisplay()
    -- Player (Test):
    if db.showSelf and anchors[5] then
        anchors[5]:Show()
    end
    -- Party members:
    for i = 1, GetNumSubgroupMembers() do
        anchors[i]:Show()
    end
    for k = GetNumSubgroupMembers() + 1, 4 do
        local anchor = anchors[k]
        local icons = anchor.icons
        for j = 1, #icons do
            icons[j].ability = nil
            icons[j].seen = nil
            icons[j].active = nil
            icons[j].inUse = nil
            icons[j].showing = nil
        end
        anchors[k]:Hide()
        anchors[k].HideIcons()
    end
    if not db.showSelf and anchors[5] then
        anchors[5]:Hide()
        anchors[5]:HideIcons()
    end
end

function ATT:UpdateAnchor(unit, i, PvPTrinket, TraceID, tcooldown)
    if not self:IsShown() then
        return
    end
    local _, class = UnitClass(unit)
    local guid = UnitGUID(unit)
    if not class or not guid then
        return
    end
    local anchor = anchors[i]
    anchor.GUID = guid
    anchor.class = class
    local icons = anchor.icons
    local numIcons = 1
    local _, instanceType = IsInInstance()
    -- PvP Trinket:
    if db.showTrinket then
        local ability, id, cooldown = PvPTrinket.ability, PvPTrinket.id, PvPTrinket.cooldown
        local icon = icons[numIcons] or self:AddIcon(icons, anchor)
        icon.texture:SetTexture(TraceID)
        icon.GUID = anchor.GUID
        icon.ability = ability
        icon.abilityID = id
        icon.cooldown = cooldown
        --icon.showing = true
        icon.inUse = true
        icon.spec = nil
        ATT:ApplyIconTextureBorder(icon)

        activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
        if activeGUIDS[icon.GUID][icon.ability] then
            icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime, activeGUIDS[icon.GUID][ability].cooldown)
        else
            icon.Stop()
        end
        numIcons = numIcons + 1
    elseif icons[1] and icons[1].ability == PvPTrinketName then
        icons[1]:Hide()
        icons[1].showing = nil
        icons[1].inUse = nil
        icons[1].spec = nil
        table.remove(icons, 1)
    end

    -- Racials
    if db.showRacial then
        for abilityIndex, abilityTable in pairs(dbRacial) do
            local abilityCheck, id, cooldown, maxcharges, talent, race = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.talent, abilityTable.race
            local icon = icons[numIcons] or self:AddIcon(icons, anchor)
            ability = nil
            _, _, raceID = UnitRace(unit);
            if raceID == race then
                ability = GetSpellInfo(id)
            end

            icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
            icon.GUID = anchor.GUID
            icon.ability = ability
            icon.abilityID = id
            icon.cooldown = cooldown
            icon.maxcharges = maxcharges
            icon.chargesText:SetText(maxcharges or "")
            icon.inUse = true
            icon.spec = talent
            icon.spellStatus = spellStatus
            ATT:ApplyIconTextureBorder(icon)

            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
            if activeGUIDS[icon.GUID][icon.ability] then
                icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime, activeGUIDS[icon.GUID][ability].cooldown)
            else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    end
    -- Abilities [All Specs]:
    for abilityIndex, abilityTable in pairs(db.abilities[class]["ALL"]) do
        local ability, id, cooldown, maxcharges, talent, spellStatus = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.talent, abilityTable.spellStatus
        local icon = icons[numIcons] or self:AddIcon(icons, anchor)
        icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
        icon.GUID = anchor.GUID
        icon.ability = ability
        icon.abilityID = id
        icon.cooldown = cooldown
        icon.maxcharges = maxcharges
        icon.chargesText:SetText(maxcharges or "")
        icon.inUse = true
        icon.spec = talent
        icon.spellStatus = spellStatus

        ATT:ApplyIconTextureBorder(icon)

        if spellStatus ~= "DISABLED" then
            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
            if activeGUIDS[icon.GUID][icon.ability] then
                icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime, activeGUIDS[icon.GUID][ability].cooldown)
            else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    end

    -- clean leftover icons
    for j = numIcons, #icons do
        icons[j].spec = nil
        icons[j].seen = nil
        icons[j].active = nil
        icons[j].inUse = nil
        icons[j].showing = nil
    end
    self:ToggleIconDisplay(i)
end

-- responsible for actual anchoring of icons
function ATT:ToggleIconDisplay(i)
    local anchor = anchors[i]
    local icons = anchor.icons
    local count = 1
    local lastActiveIndex = 0;

    -- hiding all icons before anchoring and deciding whether to show them
    for k, icon in pairs(icons) do
        if icon and icon.ability and icon.inUse then
            if icon.spec then
                icon.showing = (not db.hidden and icon.seen) or (db.hidden and activeGUIDS[icon.GUID][icon.ability] and icon.active)
            else
                icon.showing = (activeGUIDS[icon.GUID] and activeGUIDS[icon.GUID][icon.ability] and icon.active) or (not db.hidden)
            end
        end
        icon:ClearAllPoints()
        icon:Hide()
    end
    for k, icon in pairs(icons) do
        if icon and icon.ability and icon.showing then
            if db.tworows then
                if count == 1 then
                    icon:SetPoint(db.growLeft and "TOPRIGHT" or "TOPLEFT", anchor, db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
                elseif (count % 2 == 0) then
                    icon:SetPoint(db.growLeft and "TOP" or "TOP", icons[lastActiveIndex], db.growLeft and "BOTTOM" or "BOTTOM", db.growLeft and 0 or 0, -1 * db.iconOffsetY)
                else
                    icon:SetPoint(db.growLeft and "BOTTOMRIGHT" or "BOTTOMLEFT", icons[lastActiveIndex], db.growLeft and "TOPLEFT" or "TOPRIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, db.iconOffsetY)
                end
            else
                if count == 1 then
                    icon:SetPoint(db.growLeft and "TOPRIGHT" or "TOPLEFT", anchor, db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
                else
                    icon:SetPoint(db.growLeft and "RIGHT" or "LEFT", icons[lastActiveIndex], db.growLeft and "LEFT" or "RIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
                end
            end
            lastActiveIndex = k
            count = count + 1
            icon:Show()
        end
    end
    self:ToggleAnchorDisplay()
end

-- Checking PVP trinket

function ATT:TrinketCheck(unit, i)
    local raceID = UnitFactionGroup(unit)
    local TraceID
    if raceID == "Alliance" then
        TraceID = GetItemIcon(18854)
    else
        TraceID = GetItemIcon(18849)
    end

    local PvPTrinketName = GetSpellInfo(42292)
    local PvPTrinket = { ability = PvPTrinketName, id = 42292, cooldown = 120 }
    self:UpdateAnchor(unit, i, PvPTrinket, TraceID)
end

function ATT:UpdateAnchors()
    -- Player (Test):
    if db.showSelf and anchors[5] then
        self:TrinketCheck("player", 5)
    end
    -- Party members:
    for i = 1, GetNumSubgroupMembers() do
        local _, class = UnitClass("party" .. i)
        if not class then
            break
        end
        if not anchors[i] then
            break
        end
        local unit = "party" .. i
        self:TrinketCheck(unit, i)
    end
    self:LoadPositions()
    self:ToggleAnchorDisplay()
    self:ApplyAnchorSettings()
end

function ATT:UpdateIcons()
    -- Player (Test):
    if db.showSelf and anchors[5] then
        self:ToggleIconDisplay(5)
    end
    -- Party members:
    for i = 1, GetNumSubgroupMembers() do
        self:ToggleIconDisplay(i)
    end
end

function ATT:ApplyAnchorSettings()
    local _, instanceType = IsInInstance()
    ATTIcons:SetScale(db.scale or 1)

    if (db.arena and instanceType == "arena") or
            (db.dungeons and instanceType == "party") or
            (db.scenarios and instanceType == "scenario") or
            (db.inraid and (instanceType == "raid" or instanceType == "pvp")) or
            (db.outside and instanceType == "none")
    then
        ATTIcons:Show()
        self:Show()
    else
        ATTIcons:Hide()
        self:Hide()
    end
    if db.lock then
        ATTAnchor:Hide()
    else
        ATTAnchor:Show()
    end
    self:UpdateIcons()
end

function ATT:GROUP_ROSTER_UPDATE()
    self:LoadPositions()
    self:RequestSync()
    self:UpdateAnchors()
end

function ATT:PLAYER_ENTERING_WORLD()
    local inInstance, instanceType = IsInInstance()
    if instanceType == "arena" then
        self:StopAllIcons()
    end
    self:LoadPositions()
    self:RequestSync()
    self:UpdateAnchors()
end

function ATT:FindAbilityByName(abilities, name)
    if abilities then
        for i, v in pairs(abilities) do
            if v and v.ability and v.ability == name then
                return v, i
            end
        end
    end
end

function ATT:GetUnitByGUID(guid)
    for k, v in pairs(validUnits) do
        if UnitGUID(k) == guid then
            return k
        end
    end
end

function ATT:ValidUnit(unit)
    for k, v in pairs(validUnits) do
        if k == unit then
            return k
        end
    end
end

function ATT:StartCooldown(spellName, unit, cooldown, SentID)
    if not unit then
        return
    end

    local index = match(unit, "party[pet]*([1-4])")
    if unit == "player" or unit == "pet" then
        if (not db.showSelf) then
            return
        end
        unit = "player"
        index = 5
    elseif index then
        unit = "party" .. index
    end

    local anchor = anchors[tonumber(index)]
    if not anchor or not index then
        return
    end

    local _, class = UnitClass(unit)
    local cAbility = self:FindAbilityByName(db.abilities[class]["ALL"], spellName) or self:FindAbilityByName(dbRacial, spellName) or self:FindAbilityByName(dbTrinket, spellName)
    self:TrackCooldown(anchor, spellName, cAbility and cAbility.cooldown or nil)
end

function ATT:TrackCooldown(anchor, ability, cooldown)
    for k, icon in ipairs(anchor.icons) do
        if cooldown then
            -- Direct cooldown
            if icon.ability == ability then
                icon.seen = true
                icon.Start(cooldown, 1)
                icon.flashAnim:Play()
                icon.newitemglowAnim:Play()
            end
        end
        -- Grouped Cooldowns
        if groupedCooldowns[anchor.class] and groupedCooldowns[anchor.class][ability] then
            for k in pairs(groupedCooldowns[anchor.class]) do
                if k == icon.ability and icon.shouldShow then
                    icon.Start(cooldown);
                    break
                end
            end
        end
        -- Cooldown resetters
        if cooldownResetters[ability] then
            if type(cooldownResetters[ability]) == "table" then
                if cooldownResetters[ability][icon.ability] then
                    icon.Stop()
                end
            else
                icon.Stop()
            end
        end
    end
end

function ATT:IconGlow(unit, destUnit, spellName, event)
    if not unit then
        return
    end
    local auraunit = unit
    if unit ~= destUnit then
        auraunit = destUnit
    end
    local index = match(unit, "party[pet]*([1-4])")
    if unit == "player" or unit == "pet" then
        if (not db.showSelf) then
            return
        end
        unit = "player"
        index = 5
    elseif index then
        unit = "party" .. index
    end
    local anchor = anchors[tonumber(index)]
    if not anchor or not index then
        return
    end
    if spellName == PvPTrinketName then
        return
    end -- blizz bugged spell
    local duration = select(5, AuraUtil.FindAuraByName(spellName, auraunit))
    for k, icon in ipairs(anchor.icons) do
        if spellName == icon.ability then
            local chargetxt = tonumber(icon.chargesText:GetText())
            if icon.cooldown and duration and duration > 1 and (event == "SPELL_AURA_APPLIED") then
                icon.cd:SetHideCountdownNumbers(true)
                C_Timer.After(0.05, function()
                    icon.cd:SetHideCountdownNumbers(true);
                    LGlow.ShowOverlayGlow(icon.cd)
                end)
                C_Timer.After(duration, function()
                    LGlow.HideOverlayGlow(icon.cd);
                    if (not icon.maxcharges) or chargetxt == 0 then
                        icon.cd:SetHideCountdownNumbers(false)
                    end
                end)
            elseif (event == "SPELL_AURA_REMOVED") and icon.cooldown and not duration then
                LGlow.HideOverlayGlow(icon.cd)
                if (not icon.maxcharges) or chargetxt == 0 then
                    icon.cd:SetHideCountdownNumbers(false)
                end
            end
        end
    end
end

function ATT:ARENA_COOLDOWNS_UPDATE(unit)
    local guid = UnitGUID(unit);
    local spellID, itemID, startTime, duration = C_PvP.GetArenaCrowdControlInfo(unit);
    if( spellID ) then
        local attUnit = self:GetUnitByGUID(guid);
        if attUnit then
            local spellName = GetSpellInfo(spellID);
            self:StartCooldown(spellName, attUnit);
        end
    end
end

function ATT:UNIT_SPELLCAST_SUCCEEDED(unit, castGUID, spellID)
    local sourceGUID = UnitGUID(unit);
    local attUnit = self:GetUnitByGUID(sourceGUID);
    local spellName = GetSpellInfo(spellID);

    self:StartCooldown(spellName, attUnit);
end

function ATT:COMBAT_LOG_EVENT_UNFILTERED()
    if not self:IsShown() then
        return
    end

    local timestamp, event, hideCaster, sourceGUID, sourceName,
    sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, spellSchool = CombatLogGetCurrentEventInfo()
    local attUnit = self:GetUnitByGUID(sourceGUID);

    if attUnit and ((event == "SPELL_CAST_SUCCESS") or ((event == "SPELL_AURA_APPLIED") and (spellName == WillOfTheForsaken or spellName == Stoneform))) then
        self:StartCooldown(spellName, attUnit);
    end

    if db.glow and self:GetUnitByGUID(destGUID) and self:GetUnitByGUID(sourceGUID) and ((event == "SPELL_AURA_REMOVED") or (event == "SPELL_AURA_APPLIED")) and (auraType == "BUFF") then
        self:IconGlow(self:GetUnitByGUID(sourceGUID), self:GetUnitByGUID(destGUID), spellName, event);
    end
end

local timers, timerfuncs, timerargs = {}, {}, {}
function ATT:Schedule(duration, func, ...)
    timers[#timers + 1] = duration
    timerfuncs[#timerfuncs + 1] = func
    timerargs[#timerargs + 1] = { ... }
end

local time = 0

local function ATT_OnUpdate(self, elapsed)
    if not self:IsShown() then
        return
    end
    time = time + elapsed
    if time > 0.05 then
        -- Inspection stuff:
        --	ATT:ProcessInspectQueue()
        --  Update icon activity
        for k, icon in ipairs(iconlist) do
            if icon.active and icon.cooldown then
                icon.timeleft = icon.starttime + icon.cooldown - GetTime()
                if icon.timeleft <= 0 then
                    if not icon.showing then
                        icon:Hide()
                    end
                    icon.active = nil
                    if icon.maxcharges then
                        local charges = tonumber(icon.chargesText:GetText():match("^[0-9]+$"))
                        charges = math.min(icon.maxcharges, charges + 1)
                        icon.chargesText:SetText(charges)
                        if charges < icon.maxcharges then
                            icon.Start(icon.cooldown, 5)
                        end
                    end
                end
            end
        end
        if db.hidden then
            ATT:UpdateIcons()
        end
        -- Update Timers
        if #timers > 0 then
            for i = #timers, 1, -1 do
                timers[i] = timers[i] - 0.05
                if timers[i] <= 0 then
                    remove(timers, i)
                    remove(timerfuncs, i)(ATT, unpack(remove(timerargs, i)))
                end
            end
        end
        time = 0
    end
end

-- resets all icons on zone change
function ATT:StopAllIcons()
    for k, v in ipairs(iconlist) do
        v.Stop()
        v.seen = nil
    end
    wipe(activeGUIDS)
end

function ATT:RequestSync()
    if self.useCrossAddonCommunication and IsInGroup() then
        C_ChatInfo.SendAddonMessage(ChatPrefix, "Version|" .. ATTversion, IsInGroup(2) and "INSTANCE_CHAT" or IsInGroup(1) and "RAID")
    end
end

function ATT:CHAT_MSG_ADDON(prefix, message, dist, sender)
    local chl = strlower(dist)
    if (chl == "raid" and GetNumSubgroupMembers(1) == 0) or (chl == "party" and GetNumSubgroupMembers(1) == 0) or (chl == "guild" and not IsInGuild()) then
        return
    end
    if prefix == ChatPrefix then
        local vfound, vversion = match(message, "(.+)|(%A+)")
        if vversion then
            vversion = tonumber(string.sub(vversion, 1, 4))
            --[[ debug update note
                selfname = GetUnitName("player").."-Sylvanas"
                if vversion > 5 and selfname ~= sender then print("Version: |cffFF4500v"..vversion.."|r Sender: |cffFF4500"..sender.."|r") end
            --]]
            if vversion > ATTversion and ATTnewversion == nil then
                print("There is a new version of |cff33ff99Arena Team Tracker Classic|r: |cffFF4500v" .. vversion .. "|r You are currently using: |cffFF4500v" .. ATTversion .. "|r")
                ATTnewversion = message
            end
        end
    end
end

local function ATT_OnLoad(self)

    if C_ChatInfo.RegisterAddonMessagePrefix(ChatPrefix) then
        self.useCrossAddonCommunication = true
    end
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("GROUP_ROSTER_UPDATE")
    self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    self:RegisterEvent("ARENA_COOLDOWNS_UPDATE")
    self:RegisterEvent("INSPECT_READY")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    if self.useCrossAddonCommunication then
        self:RegisterEvent("CHAT_MSG_ADDON")
    end
    self:SetScript("OnEvent", function(self, event, ...)
        if self[event] then
            self[event](self, ...)
        end
    end);
    ATTDB = ATTDB or { abilities = ATTdefaultAbilities, scale = 1, iconOffsetY = 2, iconOffsetX = 5, glow = true }
    db = ATTDB
    db.classSelected = "WARRIOR"

    self:CreateAnchors()
    self:LoadPositions()
    self:UpdateAnchors()
    self:CreateOptions()
    self:UpdateScrollBar()

    self:SetScript("OnUpdate", ATT_OnUpdate)

    if(CompactRaidFrameContainer_TryUpdate) then
        hooksecurefunc("CompactRaidFrameContainer_TryUpdate", function(frame)
            if frame:IsForbidden() then
                return
            end
            local name = frame:GetName()
            if not name or not name:match("^Compact") or not db.attach then
                return
            end
            if not self:IsShown() then
                return
            end
            ATT:LoadPositions(frame)
            --ATT:UpdateAnchors(frame)
        end)
    end

    print("|cff33ff99A|rrena |cff33ff99T|ream |cff33ff99T|rracker |cff33ff99Classic|r by |cff33ff99Izy|r. Type |cffFF4500/att|r to open options.")
end

function ATT:FindAbilityIcon(ability, id)
    local icon;
    if id then
        icon = GetSpellTexture(id)
    else
        icon = GetSpellTexture(self:FindAbilityID(ability))
    end
    return icon
end

function ATT:FindAbilityID(ability)
    for _, S in pairs(SPELLDB) do
        for _, v in pairs(S) do
            for _, sp in pairs(v) do
                for _, SPELLID in pairs(sp) do
                    local spellName, spellRank, spellIcon = GetSpellInfo(SPELLID)
                    if (spellName == ability) then
                        return SPELLID
                    end
                end
            end
        end
    end
end

function ATT:FormatAbility(s)
    --[[locale = GetLocale();
        if (GetLocale() == "enGB") or (GetLocale() == "enUS") then
        s = s:gsub("(%a)(%a*)('*)(%a*)", function (a,b,c,d) return a:upper()..b:lower()..c..d:lower() end)
        return s
        else
    --]]return s
    --	end
end

-------------------------------------------------------------
-- Panel
-------------------------------------------------------------

local SO = LibStub("LibSimpleOptions-1.01")

local function CreateListButton(parent, index)
    local button = CreateFrame("Button", parent:GetName() .. index, parent)
    button:SetWidth(190)
    button:SetHeight(25)
    local font = CreateFont("ATTListFont")
    font:SetFont(GameFontNormal:GetFont(), 12)
    font:SetJustifyH("LEFT")
    button:SetNormalFontObject(font)
    button:SetHighlightTexture("Interface\\ContainerFrame\\UI-Icon-QuestBorder")
    button:GetHighlightTexture():SetTexCoord(0.11, 0.88, 0.02, 0.97)
    button:SetScript("OnClick", function(self)
        parent.currentButton = self:GetText();
        ATT:UpdateScrollBar()
    end)
    return button
end

local function CreateEditBox(name, parent, width, height)
    local editbox = CreateFrame("EditBox", parent:GetName() .. name, parent, "InputBoxTemplate")
    editbox:SetHeight(height)
    editbox:SetWidth(width)
    editbox:SetAutoFocus(false)
    local label = editbox:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
    label:SetText(name)
    label:SetPoint("BOTTOMLEFT", editbox, "TOPLEFT", -3, 0)
    return editbox
end

function ATT:CreateOptions()
    local panel = SO.AddOptionsPanel("Arena Team Tracker", function()
    end)
    self.panel = panel
    SO.AddSlashCommand("Arena Team Tracker", "/att")
    local title, subText = panel:MakeTitleTextAndSubText("Arena Team Tracker", "General settings")
    local scale = panel:MakeSlider(
            'name', 'Scale',
            'description', 'Adjust the scale of icons',
            'minText', '0.1',
            'maxText', '5',
            'minValue', 0.1,
            'maxValue', 5,
            'step', 0.05,
            'default', 1,
            'current', db.scale,
            'setFunc', function(value)
                db.scale = value;
                ATT:ApplyAnchorSettings()
            end,
            'currentTextFunc', function(value)
                return string.format("%.2f", value)
            end)
    scale:SetPoint("TOPLEFT", panel, "TOPLEFT", 30, -75)

    local growLeft = panel:MakeToggle(
            'name', 'Grow Left',
            'description', 'Grow icons to the left',
            'default', false,
            'getFunc', function()
                return db.growLeft
            end,
            'setFunc', function(value)
                db.growLeft = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings()
            end)
    growLeft:SetPoint("TOP", panel, "TOP", -110, -45)
    local tworows = panel:MakeToggle(
            'name', 'Two rows',
            'description', 'Show icons on two rows',
            'default', false,
            'getFunc', function()
                return db.tworows
            end,
            'setFunc', function(value)
                db.tworows = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings()
            end)
    tworows:SetPoint("TOP", growLeft, "BOTTOM", 0, -5)

    local horizontal = panel:MakeToggle(
            'name', 'Horizontal',
            'description', 'Show icons under raid frames\n(works when using horizontal group and attached raid frames)',
            'default', false,
            'getFunc', function()
                return db.horizontal
            end,
            'setFunc', function(value)
                db.horizontal = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings()
            end)
    horizontal:SetPoint("TOP", tworows, "BOTTOM", 0, -5)
    local attach = panel:MakeToggle(
            'name', 'Attach raid frames',
            'description', 'Attach to Blizzard raid frames',
            'default', false,
            'getFunc', function()
                return db.attach
            end,
            'setFunc', function(value)
                db.attach = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings()
            end)
    attach:SetPoint("TOPLEFT", scale, "TOPLEFT", 0, -32)
    local offsetX = CreateEditBox("Offset X", panel, 50, 25)
    offsetX:SetText(db.offsetX or "0")
    offsetX:SetCursorPosition(0)
    offsetX:SetPoint("TOPLEFT", attach, "TOPLEFT", 0, -50)
    offsetX:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local num = self:GetText():match("%-?%d+$")
        if num then
            print("Offset X changed and saved: " .. tostring(num))
            db.offsetX = num
            ATT:LoadPositions();
            ATT:ApplyAnchorSettings();
        else
            print("Wrong value for Offset X/Y")
            self:SetText(db.offsetX)
        end
    end)
    panel.offsetX = offsetX
    local offsetY = CreateEditBox("Offset Y", panel, 50, 25)
    offsetY:SetText(db.offsetY or "0")
    offsetY:SetCursorPosition(0)
    offsetY:SetPoint("LEFT", offsetX, "RIGHT", 10, 0)
    offsetY:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local num = self:GetText():match("%-?%d+$")
        if num then
            print("Offset Y changed and saved: " .. tostring(num))
            db.offsetY = num
            ATT:LoadPositions();
            ATT:ApplyAnchorSettings();
        else
            print("Wrong value for Offset X/Y")
            self:SetText(db.offsetY)
        end
    end)
    panel.offsetY = offsetY
    local iconOffsetX = CreateEditBox("Icon X", panel, 50, 25)
    iconOffsetX:SetText(db.iconOffsetX or 5)
    iconOffsetX:SetCursorPosition(0)
    iconOffsetX:SetPoint("LEFT", offsetY, "RIGHT", 10, 0)
    iconOffsetX:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local num = self:GetText():match("%-?%d+$")
        if num then
            print("Icon Offset X changed and saved: " .. tostring(num))
            db.iconOffsetX = num
            ATT:LoadPositions();
            ATT:ApplyAnchorSettings();
        else
            print("Wrong value for Icon Offset X")
            self:SetText(db.iconOffsetX)
        end
    end)
    panel.iconOffsetX = iconOffsetX
    local iconOffsetY = CreateEditBox("Icon Y", panel, 50, 25)
    iconOffsetY:SetText(db.iconOffsetY or 2)
    iconOffsetY:SetCursorPosition(0)
    iconOffsetY:SetPoint("LEFT", iconOffsetX, "RIGHT", 10, 0)
    if not db.iconOffsetY then
        local iconOffsetY = 2
    end
    iconOffsetY:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local num = self:GetText():match("%-?%d+$")
        if db.iconOffsetY == nil then
            db.iconOffsetY = "2"
        end
        if num then
            print("Icon Offset Y changed and saved: " .. tostring(num))
            db.iconOffsetY = num
            ATT:LoadPositions();
            ATT:ApplyAnchorSettings();
        else
            print("Wrong value for Icon Offset Y")
            self:SetText(db.iconOffsetY)
        end
    end)
    panel.iconOffsetY = iconOffsetY
    local offsetdesc = panel:CreateFontString(nil, nil, "GameFontNormalSmall")
    offsetdesc:SetText("-change value then press ENTER for each offset.");
    offsetdesc:SetJustifyH("LEFT")
    offsetdesc:SetPoint("TOPLEFT", scale, "BOTTOMLEFT", 0, -90)

    local lock = panel:MakeToggle(
            'name', 'Lock',
            'description', 'Hide/Show anchors',
            'default', false,
            'getFunc', function()
                return db.lock
            end,
            'setFunc', function(value)
                db.lock = value;
                ATT:ApplyAnchorSettings()
            end)
    lock:SetPoint("TOP", panel, "TOP", 10, -45)

    local hidden = panel:MakeToggle(
            'name', 'Hidden',
            'description', 'Show icons only when\nthey are on cooldown',
            'default', false,
            'getFunc', function()
                return db.hidden
            end,
            'setFunc', function(value)
                db.hidden = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings()
                ATT:UpdateAnchors()
            end)
    hidden:SetPoint("TOP", lock, "BOTTOM", 0, -5)
    local glow = panel:MakeToggle(
            'name', 'Glow Icons',
            'description', 'Glow icons blizzard style\nwhen ability is active',
            'default', true,
            'getFunc', function()
                return db.glow
            end,
            'setFunc', function(value)
                db.glow = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings()
                ATT:UpdateAnchors()
            end)
    glow:SetPoint("TOP", hidden, "BOTTOM", 0, -5)

    local showIconBorders = panel:MakeToggle(
            'name', 'Draw borders',
            'description', 'Draw borders around icons',
            'default', true,
            'getFunc', function()
                return db.showIconBorders
            end,
            'setFunc', function(value)
                db.showIconBorders = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:GROUP_ROSTER_UPDATE()
            end)
    showIconBorders:SetPoint("TOP", glow, "BOTTOM", 0, -5)

    local arena = panel:MakeToggle(
            'name', 'Arena',
            'description', 'Enable icons in Arena',
            'default', false,
            'getFunc', function()
                return db.arena
            end,
            'setFunc', function(value)
                db.arena = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:UpdateAnchors()
            end)
    arena:SetPoint("TOPLEFT", panel, "TOPLEFT", 85, -202)

    local dungeons = panel:MakeToggle(
            'name', 'Dungeons',
            'description', 'Enable icons in Dungeons',
            'default', false,
            'getFunc', function()
                return db.dungeons
            end,
            'setFunc', function(value)
                db.dungeons = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:UpdateAnchors()
            end)
    dungeons:SetPoint("LEFT", arena, "RIGHT", 60, 0)

    local scenarios = panel:MakeToggle(
            'name', 'Scenarios',
            'description', 'Enable icons in Scenarios',
            'default', false,
            'getFunc', function()
                return db.scenarios
            end,
            'setFunc', function(value)
                db.scenarios = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:UpdateAnchors()
            end)
    scenarios:SetPoint("LEFT", dungeons, "RIGHT", 85, 0)

    local inraid = panel:MakeToggle(
            'name', 'Raid/Bg',
            'description', 'Enable icons in Raid / BGs\n(only works for your group)',
            'default', false,
            'getFunc', function()
                return db.inraid
            end,
            'setFunc', function(value)
                db.inraid = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:UpdateAnchors()
            end)
    inraid:SetPoint("LEFT", scenarios, "RIGHT", 80, 0)

    local outside = panel:MakeToggle(
            'name', 'Outside World',
            'description', 'Enable icons in Outside World',
            'default', false,
            'getFunc', function()
                return db.outside
            end,
            'setFunc', function(value)
                db.outside = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:UpdateAnchors()
            end)
    outside:SetPoint("LEFT", inraid, "RIGHT", 70, 0)

    local showTrinket = panel:MakeToggle(
            'name', 'Show PvP Trinket',
            'description', 'Show PvP Trinket',
            'default', false,
            'getFunc', function()
                return db.showTrinket
            end,
            'setFunc', function(value)
                db.showTrinket = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:GROUP_ROSTER_UPDATE()
            end)
    showTrinket:SetPoint("LEFT", lock, "RIGHT", 90, 0)

    local showRacial = panel:MakeToggle(
            'name', 'Show Racial',
            'description', 'Show Racial icons',
            'default', false,
            'getFunc', function()
                return db.showRacial
            end,
            'setFunc', function(value)
                db.showRacial = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:GROUP_ROSTER_UPDATE()
            end)
    showRacial:SetPoint("TOP", showTrinket, "BOTTOM", 0, -5)

    local showSelf = panel:MakeToggle(
            'name', 'Show Self',
            'description', 'Show your own icons',
            'default', false,
            'getFunc', function()
                return db.showSelf
            end,
            'setFunc', function(value)
                db.showSelf = value;
                ATT:LoadPositions();
                ATT:ApplyAnchorSettings();
                ATT:UpdateAnchors()
            end)
    showSelf:SetPoint("TOP", showRacial, "BOTTOM", 0, -5)

    local showTooltip = panel:MakeToggle(
            'name', 'Show Tooltip',
            'description', 'Show tooltips over icons',
            'default', false,
            'getFunc', function()
                return db.showTooltip
            end,
            'setFunc', function(value)
                db.showTooltip = value;
            end)
    showTooltip:SetPoint("TOP", showSelf, "BOTTOM", 0, -5)

    self:CreateAbilityEditor()

    local title2, subText2 = panel:MakeTitleTextAndSubText("", "Enable in:")
    title2:ClearAllPoints()
    title2:SetPoint("TOPLEFT", panel, "TOPLEFT", 20, -200)

    local title2, subText2 = panel:MakeTitleTextAndSubText("", "Show:")
    subText2:ClearAllPoints()
    subText2:SetPoint("TOPLEFT", panel, "TOPLEFT", 20, -475)

    local cpanel = CreateFrame("Frame", "ATTFrame", panel, "BackdropTemplate")
    cpanel:SetBackdrop({ edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15 });
    cpanel:SetSize(610, 220)
    cpanel:SetPoint("TOP", panel, "TOP", 0, -235)

    local cpanel2 = CreateFrame("Frame", "ATTFrame", panel, "BackdropTemplate")
    cpanel2:SetBackdrop({ edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15 });
    cpanel2:SetSize(610, 35)
    cpanel2:SetPoint("TOP", panel, "TOP", 0, -465)

    local legend = CreateFrame("Frame", "ATTFrame", panel, "BackdropTemplate")
    legend:SetBackdrop({ edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15 });
    legend:SetSize(610, 30)
    legend:SetPoint("TOP", panel, "TOP", 0, -200)

    local authordesc = panel:CreateFontString(nil, "ARTWORK", "GameFontDisable")
    authordesc:SetText("You can leave feedback / support @ < |cff33ff99twitch.tv/imedia|r > or < |cff33ff99curseforge.com|r > addon page. Enjoy! \r\n  \r\n  |cffffff00Version:|r |cff33ff99v" .. ATTversion .. "|r Classic |cffFF4500|r by |cffffff00izy|r  ( ize @ Sylvanas EU )")
    authordesc:SetJustifyH("LEFT")
    authordesc:SetPoint("TOPLEFT", panel, "TOPLEFT", 15, -520)
end

local function count(t)
    local i = 0
    for k, v in pairs(t) do
        i = i + 1
    end
    return i
end

function ATT:UpdateScrollBar()
    local btns = self.btns
    local scrollframe = self.scrollframe
    local classSelectedSpecs = db.abilities[db.classSelected]
    local line = 1

    for specID, abilities in pairs(classSelectedSpecs) do
        for abilityIndex, abilityTable in pairs(abilities) do
            local ability, id, cooldown, maxcharges, talent, spellStatus = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.talent, abilityTable.spellStatus
            local order = abilityTable.order or 1
            spectexture = "Interface\\Buttons\\UI-MicroButton-" .. db.classSelected
            abilitytexture = self:FindAbilityIcon(ability, id)
            if spellStatus ~= "DISABLED" then
                btns[line]:SetText("   |T" .. abilitytexture .. ":18|t " .. ability)
            else
                btns[line]:SetText("   |cff808080|T" .. abilitytexture .. ":18|t " .. ability .. "|r")
            end
            if btns[line]:GetText() ~= scrollframe.currentButton then
                btns[line]:SetNormalTexture("")
            else
                btns[line]:SetNormalTexture("Interface\\ContainerFrame\\UI-Icon-QuestBorder")
                btns[line]:GetNormalTexture():SetTexCoord(0.11, 0.88, 0.02, 0.97)
                btns[line]:GetNormalTexture():SetBlendMode("ADD")
                scrollframe.addeditbox:SetText(ability)
                scrollframe.ideditbox:SetText(id or "")
                scrollframe.cdeditbox:SetText(cooldown or "")
                scrollframe.order:SetValue(tostring(order or 1))
                scrollframe.maxchargeseditbox.initialize()
                scrollframe.maxchargeseditbox:SetValue(tostring(maxcharges or "NONE"))
                scrollframe.spellStatusbox.initialize()
                scrollframe.spellStatusbox:SetValue(tostring(spellStatus or "ENABLED"))
                --scrollframe.dropdown2.initialize()
                --scrollframe.dropdown2:SetValue(tostring(specID))
            end

            btns[line]:Show()
            line = line + 1
        end
    end
    for i = line, 25 do
        btns[i]:Hide()
    end
end

function ATT:CreateAbilityEditor()
    local panel = self.panel
    local btns = {}
    self.btns = btns
    local scrollframe = CreateFrame("ScrollFrame", "ATTScrollFrame", panel, "UIPanelScrollFrameTemplate")
    local backdrop = {
        bgFile = [=[Interface\Buttons\WHITE8X8]=],
        insets = { left = 0, right = 0, top = -5, bottom = -5 } }
    --scrollframe:SetBackdrop(backdrop)
    --scrollframe:SetBackdropColor(0, 0, 0, 0.50)
    local child = CreateFrame("ScrollFrame", "ATTScrollFrameChild", scrollframe)
    child:SetSize(1, 1)
    scrollframe:SetScrollChild(child)
    local button1 = CreateListButton(child, "25")
    button1:SetPoint("TOPLEFT", child, "TOPLEFT", 2, 0)
    btns[#btns + 1] = button1
    for i = 2, 25 do
        local button = CreateListButton(child, tostring(i))
        button:SetPoint("TOPLEFT", btns[#btns], "BOTTOMLEFT")
        btns[#btns + 1] = button
    end
    scrollframe:SetScript("OnShow", function(self)
        if not db.classSelected then
            db.classSelected = "WARRIOR"
        end ;
        ATT:UpdateScrollBar();
    end)
    self.scrollframe = child

    scrollframe:SetSize(195, 176)
    scrollframe:SetPoint('LEFT', 16, -60)
    child.dropdown2 = nil

    local dropdown = panel:MakeDropDown(
            'name', ' Class',
            'description', 'Pick a class to edit abilities',
            'values', {
                "WARRIOR", "Warrior",
                "PALADIN", "Paladin",
                "PRIEST", "Priest",
                "SHAMAN", "Shaman",
                "DRUID", "Druid",
                "ROGUE", "Rogue",
                "MAGE", "Mage",
                "WARLOCK", "Warlock",
                "HUNTER", "Hunter",
            },
            'default', 'WARRIOR',
            'getFunc', function()
                return db.classSelected
            end,
            'setFunc', function(value)
                db.classSelected = value;
                ATT:UpdateScrollBar();
                child.dropdown2.values = { "ALL", "All Specs" }
                child.dropdown2.initialize()
                child.dropdown2:SetValue("ALL")
            end)
    dropdown:SetPoint("TOPLEFT", scrollframe, "TOPRIGHT", 20, -8)
    child.dropdown = dropdown

    local dropdown2 = panel:MakeDropDown(
            'name', ' Specialization',
            'description', 'Pick a spec',
            'values', {
                "ALL", "All Specs",
            },
            'default', 'ALL',
            'current', 'ALL',
            'setFunc', function(value)
            end)
    dropdown2:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 0, -15)
    child.dropdown2 = dropdown2

    local spellStatusbox = panel:MakeDropDown(
            'name', ' Status',
            'description', 'Enable or disable ability',
            'values', {
                "ENABLED", "Enabled",
                "DISABLED", "Disabled",
            },
            'default', 'ENABLED',
            'current', 'ENABLED',
            'setFunc', function(value)
            end)
    spellStatusbox:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 140, 30)
    child.spellStatusbox = spellStatusbox

    local showIconBorders = panel:MakeToggle(
            'name', 'Draw borders for icons',
            'description', 'Draw borders around icons',
            'default', true,
            'getFunc', function()
                return db.showIconBorders
            end,
            'setFunc', function(value)
                db.showIconBorders = value;
                ATT:UpdateAnchors()
            end)
    showIconBorders:SetPoint("TOP", showTooltip, "BOTTOM", 0, -5)

    local addeditbox = CreateEditBox("Ability Name", scrollframe, 130, 25)
    child.addeditbox = addeditbox
    addeditbox:SetPoint("TOPLEFT", dropdown2, "BOTTOMLEFT", 20, -15)

    local ideditbox = CreateEditBox("Ability ID", scrollframe, 70, 25)
    ideditbox:SetPoint("LEFT", addeditbox, "RIGHT", 15, 0)
    child.ideditbox = ideditbox

    local cdeditbox = CreateEditBox("CD (s)", scrollframe, 40, 25)
    cdeditbox:SetPoint("LEFT", ideditbox, "RIGHT", 15, 0)
    child.cdeditbox = cdeditbox

    local maxchargeseditbox = panel:MakeDropDown(
            'name', ' Charges',
            'description', 'Select if ability has charges',
            'values', {
                "NONE", "None",
                "2", "2 Charges",
            },
            'default', 'NONE',
            'current', 'NONE',
            'setFunc', function(value)
            end)
    maxchargeseditbox:SetPoint("LEFT", dropdown2, "RIGHT", 100, 0)
    child.maxchargeseditbox = maxchargeseditbox

    local order = panel:MakeSlider(
            'name', 'Icon Order',
            'description', 'Adjust icon order priority\nAll Specs icons are always first',
            'minText', '1',
            'maxText', '6',
            'minValue', 1,
            'maxValue', 6,
            'step', 1,
            'vertical', 1,
            'default', 1,
            'current', 1,
            'setFunc', function()
            end,
            'currentTextFunc', function(value)
                return string.format("%.0f", value)
            end)
    order:SetPoint("TOPLEFT", dropdown2, "BOTTOMLEFT", 330, 80)
    child.order = order

    local addbutton = panel:MakeButton(
            'name', 'Add/Update',
            'description', "Add / Update ability",
            'func', function()
                local id = ideditbox:GetText():match("^[0-9]+$")
                local spec = dropdown2.value
                local ability = ATT:FormatAbility(addeditbox:GetText())
                local iconfound = ATT:FindAbilityIcon(ability, id)
                local cdtext = cdeditbox:GetText():match("^[0-9]+$")
                local maxcharges = maxchargeseditbox.value
                local spellStatus = spellStatusbox.value
                local order = string.format("%.0f", order.value)
                if iconfound and cdtext and id and (not spec or db.abilities[db.classSelected] and db.abilities[db.classSelected][spec]) then
                    print("Added/Updated: |cffFF4500" .. ability .. "|r")
                    local abilities = db.abilities[db.classSelected][spec or "ALL"]
                    local _ability, _index = self:FindAbilityByName(abilities, ability)
                    if _ability and _index then
                        -- editing:
                        abilities[_index] = { ability = ability, cooldown = tonumber(cdtext), id = tonumber(id), maxcharges = maxcharges and maxcharges ~= "" and tonumber(maxcharges) or nil, spellStatus = spellStatus and tostring(spellStatus), order = tonumber(string.format("%.0f", order)) }
                    else
                        -- adding new:
                        table.insert(abilities, { ability = ability, cooldown = tonumber(cdtext), id = tonumber(id), maxcharges = maxcharges and maxcharges ~= "" and tonumber(maxcharges) or nil, spellStatus = spellStatus and tostring(spellStatus), order = tonumber(string.format("%.0f", order)) })
                    end
                    table.sort(abilities, function(a, b)
                        if (a.order or 1) == (b.order or 1) then
                            return (a.id) < (b.id)
                        end
                        return (a.order or 1) < (b.order or 1)
                    end)
                    child.currentButton = ability
                    ATT:UpdateScrollBar()
                    ATT:UpdateAnchors()
                else
                    print("Invalid/blank:|cffFF4500 Ability Name, ID or Cooldown|r")
                end
            end)
    addbutton:SetPoint("TOPLEFT", addeditbox, "BOTTOMLEFT", -5, -20)

    local removebutton = panel:MakeButton(
            'name', 'Remove',
            'description', 'Remove ability',
            'func', function()
                print("Removed ability |cffFF4500" .. addeditbox:GetText() .. "|r")
                local spec = dropdown2.value
                local maxcharges = maxchargeseditbox.value
                local spellStatus = spellStatusbox.value
                local _ability, _index = self:FindAbilityByName(db.abilities[db.classSelected][spec or "ALL"], addeditbox:GetText())
                if _ability and _index then
                    table.remove(db.abilities[db.classSelected][spec], _index)
                end
                addeditbox:SetText("");
                ideditbox:SetText("");
                cdeditbox:SetText("");
                order:SetValue(1)
                child.currentButton = nil;
                ATT:UpdateScrollBar();
                ATT:UpdateAnchors()
            end)
    removebutton:SetPoint("TOPLEFT", addeditbox, "BOTTOMLEFT", 120, -20)
end

ATT:RegisterEvent("VARIABLES_LOADED")
ATT:SetScript("OnEvent", ATT_OnLoad)