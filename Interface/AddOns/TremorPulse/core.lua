local framePool = {}
local activeNameplates = {}
local timestamp = {}

local function CreateIconTextFrame()
    local frame = CreateFrame("Frame")
    frame:SetSize(50, 50)

    if not frame.text then
        frame.text = frame:CreateFontString(nil, "OVERLAY")
        frame.text:SetFont(STANDARD_TEXT_FONT, 30, "OUTLINE")
        frame.text:SetPoint("CENTER", frame, "CENTER", 100, 0)
        frame.text:SetTextColor(1, 1, 1)
    end

    if not frame.icon then
        frame.icon = frame:CreateTexture(nil, "OVERLAY")
        frame.icon:SetSize(42.5, 45)
        frame.icon:SetPoint("CENTER", frame, "CENTER", 105, 0) -- Testing Cheeta WA so moving tremor tick to default position here (previously Y=-2) - moving it by "-8" on Y.
        frame.icon:SetTexture("Interface\\Addons\\TextureScript\\TremorPulseTexture")
        frame.icon:SetAlpha(1)
    end

    frame:Hide()
    return frame
end

local function OnUpdateTimer(self)
    local remainingTime = self.timestamp - GetTime()
    self.text:SetText(string.format("%5.1f", remainingTime % 3))
end

local function UpdateAnchor(nameplate, timestamp)
    if nameplate.attachedFrame then return end

    local frame = #framePool > 0 and table.remove(framePool) or CreateIconTextFrame()

    frame:SetParent(nameplate)
    frame:ClearAllPoints()
    frame:SetPoint("CENTER", nameplate, "LEFT", -25, -10)

    frame.timestamp = timestamp.timeStamp
    frame.text:SetText(string.format("%5.1f", timestamp.timeStamp - GetTime()))
    frame:Show()
    frame:SetScript("OnUpdate", OnUpdateTimer)

    nameplate.attachedFrame = frame
end

local function HidePulse(nameplate)
    local frame = nameplate.attachedFrame
    if frame then
        frame:Hide()
        frame:SetParent(nil)
        frame:SetScript("OnUpdate", nil)
        table.insert(framePool, frame)
        nameplate.attachedFrame = nil
    end
end

local function CLEU(_, eventType, sourceGUID, _, _, destGUID)
    local guid = destGUID and tonumber((destGUID):sub(-10, -7), 16)

    if guid and guid ~= 5913 then return end

    if (eventType == "UNIT_DESTROYED" or eventType == "SWING_DAMAGE" or eventType == "SPELL_DAMAGE") and timestamp[destGUID] then
        timestamp[destGUID] = nil
    elseif eventType == "SPELL_CAST_SUCCESS" then
        timestamp[sourceGUID] = { timeStamp = GetTime() }
    elseif eventType == "SPELL_SUMMON" then
        if timestamp[sourceGUID] then
            timestamp[destGUID] = timestamp[sourceGUID]
            timestamp[sourceGUID] = nil
        else
            timestamp[destGUID] = { timeStamp = GetTime() }
        end
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
f:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
f:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        timestamp = {}
        activeNameplates = {}
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        CLEU(...)
    elseif event == "NAME_PLATE_UNIT_ADDED" then
        local guid = UnitGUID(...)
        local nameplate = C_NamePlate.GetNamePlateForUnit(...)

        if nameplate and guid and tonumber((guid):sub(-10, -7), 16) == 5913 then
            activeNameplates[guid] = nameplate
            if timestamp[guid] then
                UpdateAnchor(nameplate, timestamp[guid])
            end
        end
    elseif event == "NAME_PLATE_UNIT_REMOVED" then
        local guid = UnitGUID(...)
        local nameplate = activeNameplates[guid]

        if nameplate then
            HidePulse(nameplate)
            activeNameplates[guid] = nil
        end
    end
end)
