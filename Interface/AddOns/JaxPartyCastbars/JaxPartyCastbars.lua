JaxPartyCastBars = LibStub("AceAddon-3.0"):NewAddon("JaxPartyCastBars", "AceEvent-3.0", "AceHook-3.0", "AceConsole-3.0")
local defaults = {
    profile = {
        offsetY = 0,
        offsetX = 210,
        scale = .7,
        color = 1, 1, 1,
        attachPointBar = "CENTER",
        attachPointFrame = "CENTER",
        icon = false,
    }
}

function JaxPartyCastBars:OnInitialize()
    JaxPartyCastBars.db = LibStub("AceDB-3.0"):New("jpcbDB", defaults, true)
    self:SetupOptions()
end

local JPC = CreateFrame("Frame", "JPC", UIParent)
local GetNumPartyMembers = GetNumGroupMembers
local spellBars = {}

function JPC:UpdateBars()
    local _, type = IsInInstance()

    if type ~= "arena" then
        return
    end

    for k, sp in ipairs(spellBars) do
        sp:SetScale(JaxPartyCastBars.db.profile.scale)
        if (GetNumPartyMembers() > k) then
            sp:ClearAllPoints()
            if GetCVarBool("useCompactPartyFrames") or (IsInRaid() and type ~= "arena") then
                for g = 1, GetNumPartyMembers(), 1 do
                    local raidFrame = nil
                    if CompactRaidFrameManager_GetSetting("KeepGroupsTogether") then
                        if UnitInRaid("player") then
                            raidFrame = _G["CompactRaidGroup1Member" .. g]
                        else
                            raidFrame = _G["CompactPartyFrameMember" .. g]
                        end
                    else
                        raidFrame = _G["CompactRaidFrame" .. g]
                    end
                    if raidFrame and (raidFrame.unitExists and UnitIsUnit(raidFrame.unit, "party" .. k)) then
                        sp:SetParent(raidFrame)
                        sp:SetPoint(JaxPartyCastBars.db.profile.attachPointFrame, raidFrame, JaxPartyCastBars.db.profile.attachPointBar, JaxPartyCastBars.db.profile.offsetX, JaxPartyCastBars.db.profile.offsetY)
                    end
                end
            else
                local partyFrame = _G["PartyMemberFrame" .. k]
                if partyFrame and UnitIsUnit(partyFrame.unit, "party" .. k) then
                    sp:SetParent(partyFrame)
                    sp:SetPoint(JaxPartyCastBars.db.profile.attachPointFrame, partyFrame, JaxPartyCastBars.db.profile.attachPointBar, JaxPartyCastBars.db.profile.offsetX, JaxPartyCastBars.db.profile.offsetY)
                end
            end
        end
    end
end

hooksecurefunc("CompactRaidFrameContainer_SetFlowSortFunction", function()
    JPC:UpdateBars()
end)

function JPC:GROUP_ROSTER_UPDATE()
    JPC:UpdateBars()
end

function JPC:PLAYER_ENTERING_WORLD()
    JPC:UpdateBars()
end

function JPC:CVAR_UPDATE(event)
    if event == "useCompactPartyFrames" then
        self:UpdateBars()
    end
end

function JPC:VARIABLES_LOADED()
    local c = JaxPartyCastBars.db.profile.color
    JPC.locked = true

    for i = 1, 5 do
        local spellbar = CreateFrame("StatusBar", "raid" .. i .. "SpellBar", UIParent, "SmallCastingBarFrameTemplate");
        spellbar:SetScale(JaxPartyCastBars.db.profile.scale)
        CastingBarFrame_SetUnit(spellbar, "party" .. i, true, true);
        spellBars[i] = spellbar
        if JaxPartyCastBars.db.profile.icon then
            spellbar.Icon:SetAlpha(0)
        end
        spellbar.Border:SetVertexColor(c, c, c)
    end

    JPC:UpdateBars()
end

function JPC_Unlock()
    local lock = not JPC.locked
    JPC.locked = not JPC.locked
    for i = 1, 5 do
        if lock then
            spellBars[i]:SetAlpha(0)
        else
            spellBars[i]:Show()
            spellBars[i]:SetAlpha(1)
            if not JaxPartyCastBars.db.profile.icon then
                spellBars[i].Icon:SetTexture(GetSpellTexture(116));
            end
        end
    end
end

function JPC:UpdateBorderColor()
    local c = JaxPartyCastBars.db.profile.color
    for _, bar in ipairs(spellBars) do
        bar.Border:SetVertexColor(c, c, c)
    end
end

JPC:RegisterEvent("VARIABLES_LOADED")
JPC:RegisterEvent("GROUP_ROSTER_UPDATE")
JPC:RegisterEvent("PLAYER_ENTERING_WORLD")
JPC:RegisterEvent("CVAR_UPDATE")
JPC:SetScript("OnEvent", function(self, event, ...)
    if self[event] then
        self[event](self, ...)
    end
end)

hooksecurefunc("CastingBarFrame_OnEvent", function(self, event, ...)
    local arg1 = ...
    local unit = self.unit

    if ( arg1 ~= unit ) then
        return
    end

	if self and (not self.Hide or self:IsForbidden()) then return end
    if ( event == "UNIT_SPELLCAST_START" ) and (unit == "party1" or unit == "party2") then
        local name = UnitCastingInfo(unit);
        if name ~= "Polymorph" then
            if self and self:IsShown() then
				self:Hide()
		end
        end
    elseif ( event == "UNIT_SPELLCAST_CHANNEL_START" ) and (unit == "party1" or unit == "party2") then
        local name = UnitChannelInfo(unit);
        if name ~= "Polymorph" then
            if self and self:IsShown() then
				self:Hide()
		end
        end
    elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
        if self and self:IsShown() then
			self:Hide()
		end
    end
end)