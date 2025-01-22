local plates = {}
local timestamp = {}
local activeFrames = { bars = {}, cooldowns = {} }
local cooldownCache = {}
local barCache = {}

local function CreateTremorIcon(unit)
    local plate = C_NamePlate.GetNamePlateForUnit(unit)

    local name = UnitName(unit)

    if name and name ~= "Tremor Totem" then
        if plate.indicator then
            plate.indicator:Hide()
        end
        return
    end

    if not plate.indicator then
        plate.indicator = plate:CreateTexture(nil, "OVERLAY")
        plate.indicator:SetTexture("Interface\\Addons\\TextureScript\\TremorPulseTexture");
        plate.indicator:SetSize(42.5, 45)
        plate.indicator:SetPoint("LEFT", 58, -9.5) -- Testing Cheeta WA so moving tremor tick to default position here (previously Y=-1.5) - moving it by "-8" on Y.
        plate.indicator:Hide()
    end

    if plate.totemTick and plate.totemTick:IsShown() then
        plate.indicator:Show()
    end
    plate.indicator:SetAlpha(1)
    plate.indicator.unit = unit
    local unitGUID = UnitGUID(unit)
    plates[unitGUID] = plate
end

local function RemoveIcon(unitGUID)
    if plates[unitGUID] then
        plates[unitGUID].indicator:Hide()
        plates[unitGUID] = nil
    end
end

local function CLEU(...)
    local _, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName = ...

    local pulse = 3
    if eventType == "UNIT_DESTROYED" and timestamp[destGUID] then
        timestamp[destGUID] = nil
    end
    if (eventType == "SWING_DAMAGE" or eventType == "SPELL_DAMAGE") and timestamp[destGUID] and destName == "Tremor Totem" then
        timestamp[destGUID] = nil
    end
    if not pulse then
        return
    end
    if eventType == "SPELL_CAST_SUCCESS" then
        timestamp[sourceGUID] = { timeStamp = GetTime(), pulse = pulse }
    end
    if eventType == "SPELL_SUMMON" then
        if not destName == "Tremor Totem" then
            return
        end

        if timestamp[sourceGUID] then
            timestamp[destGUID] = timestamp[sourceGUID]
            timestamp[sourceGUID] = nil
        else
            timestamp[destGUID] = { timeStamp = GetTime(), pulse = pulse }
        end
    end
end

local function CreateCooldownFrame(style)
    local totemTick

    if #cooldownCache > 0 then
        totemTick = tremove(cooldownCache, #cooldownCache)
    else
        totemTick = CreateFrame("Frame")
        totemTick:SetWidth(16)
        totemTick:SetHeight(16)
        totemTick.cd = CreateFrame("Cooldown", nil, totemTick, "CooldownFrameTemplate")
        totemTick.cd:SetAllPoints(totemTick)
        totemTick.cd.noCooldownCount = true
        totemTick:SetFrameStrata("MEDIUM")
        totemTick:SetFrameLevel(4)
        totemTick.cd:SetAlpha(1.0)

        totemTick.textFrame = CreateFrame("Frame", nil, totemTick)
        totemTick.textFrame:SetAllPoints(totemTick)
        totemTick.text = totemTick.textFrame:CreateFontString(nil, "OVERLAY")
        totemTick.text:SetPoint("CENTER", totemTick.textFrame, "CENTER")
        totemTick.text:SetFont(STANDARD_TEXT_FONT, 11, "OUTLINE")
        totemTick.text:SetJustifyH("CENTER")
        totemTick.text:SetShadowOffset(1, -1)
        totemTick.text:SetTextColor(1, 1, 1)
    end
    return totemTick
end

local function UpdateCooldown(cooldown)
    cooldown:SetWidth(16)
    cooldown:SetHeight(16)

    cooldown.cd:SetCooldown(0, 0)
    cooldown.cd:SetAlpha(0)

    cooldown.text:SetFont(STANDARD_TEXT_FONT, 30, "OUTLINE")
    cooldown.text:SetTextColor(1, 1, 1)

    if cooldown:GetParent() and cooldown:GetParent() ~= UIParent then
        cooldown:ClearAllPoints()
        cooldown:SetPoint("CENTER", cooldown:GetParent(), "LEFT", 80, -10) -- Testing Cheeta WA so moving tremor tick to default position here (previously Y=-2) - moving it by "-8" on Y.
    end
end

local function TotemPulseOnUpdate(totemTick)
    totemTick.now = GetTime()
    totemTick.value = (totemTick.timestamp - totemTick.now) % totemTick.maxValue
    if totemTick.once and totemTick.now - totemTick.timestamp >= totemTick.maxValue then
        totemTick:SetScript("OnUpdate", nil)
        totemTick:Hide()
    end
    if not totemTick.bar and not (totemTick.once and totemTick.now - totemTick.timestamp >= totemTick.maxValue) then
        totemTick.cd:SetCooldown(totemTick.now - totemTick.value, totemTick.maxValue)
    end
    totemTick.text:SetFormattedText("%.1f", totemTick.value)
end

local function AddTimerFrame(nameplate, timestamp)
    if nameplate:IsShown() and timestamp then
        if not nameplate.totemTick then
            nameplate.totemTick = CreateCooldownFrame()
        end
        nameplate.totemTick:SetParent(nameplate)

        local cd = type(timestamp.pulse) == "table" and timestamp.pulse.cd or timestamp.pulse
        local once = type(timestamp.pulse) == "table"
        local cooldown = (timestamp.timeStamp - GetTime()) % cd

        nameplate.totemTick.timestamp = timestamp.timeStamp
        nameplate.totemTick.maxValue = cd
        nameplate.totemTick.value = cooldown
        nameplate.totemTick.once = once
        nameplate.totemTick.id = timestamp.id

        UpdateCooldown(nameplate.totemTick)
        activeFrames.cooldowns[nameplate.totemTick] = nameplate.totemTick

        if once and GetTime() - timestamp.timeStamp > cd then
            nameplate.totemTick:SetScript("OnUpdate", nil)
            nameplate.totemTick:Hide()
        else
            nameplate.totemTick:SetScript("OnUpdate", TotemPulseOnUpdate)
            nameplate.totemTick:Show()
        end
    else
        if nameplate.totemTick then
            nameplate.totemTick:SetScript("OnUpdate", nil)
            nameplate.totemTick:Hide()
            nameplate.totemTick:SetParent(nil)
            tinsert(nameplate.totemTick.bar and barCache or cooldownCache, nameplate.totemTick)
            activeFrames.bars[nameplate.totemTick] = nil
            activeFrames.cooldowns[nameplate.totemTick] = nil
            nameplate.totemTick = nil
        end
    end
end

local function UnitAdded(unit)
    local isEnemy = UnitIsEnemy("player", unit)
    local guid = UnitGUID(unit)
    local name = UnitName(unit)
    if name ~= "Tremor Totem" then return end

    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)

    if nameplate then -- and isEnemy
        if timestamp[guid] then
            AddTimerFrame(nameplate, timestamp[guid])
        else
            if nameplate.totemTick then
                nameplate.totemTick:SetScript("OnUpdate", nil)
                nameplate.totemTick:Hide()
                nameplate.totemTick:SetParent(nil)
                tinsert(nameplate.totemTick.bar and barCache or cooldownCache, nameplate.totemTick)
                activeFrames.bars[nameplate.totemTick] = nil
                activeFrames.cooldowns[nameplate.totemTick] = nil
                nameplate.totemTick = nil
            end
        end
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        timestamp = {}
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        CLEU(...)
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        local nameplate = C_NamePlate.GetNamePlateForUnit(...)
        if nameplate.totemTick then
            nameplate.totemTick:SetScript("OnUpdate", nil)
            nameplate.totemTick:Hide()
            nameplate.totemTick:SetParent(nil)
            tinsert(nameplate.totemTick.bar and barCache or cooldownCache, nameplate.totemTick)
            activeFrames.bars[nameplate.totemTick] = nil
            activeFrames.cooldowns[nameplate.totemTick] = nil
            nameplate.totemTick = nil
        end
        RemoveIcon(UnitGUID(...))
    elseif event == "NAME_PLATE_UNIT_ADDED" then
        UnitAdded(...)
        CreateTremorIcon(...)
    end
end)