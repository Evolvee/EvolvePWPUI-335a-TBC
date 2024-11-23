local _, Private = ...

local UnitIsTapped = UnitIsTapped
local UnitIsConnected = UnitIsConnected
local UnitIsTappedByPlayer = UnitIsTappedByPlayer
local GetPlayerMapPosition = GetPlayerMapPosition
local UnitIsTappedByAllThreatList = UnitIsTappedByAllThreatList

function UnitPhaseReason(Unit)
	-- return 0 -- Phasing -- If in instance?
end

function UnitDistanceSquared(Unit)
	if ( UnitIsConnected(Unit) ) then
		local PX, PY = GetPlayerMapPosition("player")
		local UX, UY = GetPlayerMapPosition(Unit)
		return CalculateDistance(PX, PY, UX, UY) * 100000, true
	end
	return 0, false
end

function UnitIsTapDenied(Unit)
	return UnitIsTapped(Unit) and not UnitIsTappedByPlayer(Unit) and not UnitIsTappedByAllThreatList(Unit)
end

function UnitShouldDisplayName(Unit)
	return Unit
end

function UnitNameplateShowsWidgetsOnly(Unit)
	return false
end

function C_UnitCastingInfo(Unit)
	local Name, Rank, Text, Texture, StartTime, EndTime, IsTradeskill, Cast, Interruptable, SpellID = UnitCastingInfo(Unit)
	return Name, Text, Texture, StartTime, EndTime, IsTradeskill, Cast, Interruptable, SpellID
end

function C_UnitChannelInfo(Unit)
	local Name, Rank, Text, Texture, StartTime, EndTime, IsTradeskill, Interruptable, SpellID = UnitChannelInfo(Unit)
	return Name, Text, Texture, StartTime, EndTime, IsTradeskill, Interruptable, SpellID
end

function UnitFullName(Unit)
	local Name, Realm = UnitName(Unit)

	if ( Unit == "player" ) then
		Realm = GetNormalizedRealmName()
	end

	return Name, Realm
end