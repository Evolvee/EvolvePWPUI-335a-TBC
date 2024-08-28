local _, Private = ...

local UnitGUID = UnitGUID
local UnitIsTapped = UnitIsTapped
local UnitIsConnected = UnitIsConnected
local GetNumRaidMembers = GetNumRaidMembers
local GetNumPartyMembers = GetNumPartyMembers
local UnitIsTappedByPlayer = UnitIsTappedByPlayer
local GetPlayerMapPosition = GetPlayerMapPosition
local UnitIsTappedByAllThreatList = UnitIsTappedByAllThreatList

local UNIT_ID_ALL = {"player", "pet", "target", "focus", "party1", "party2", "party3", "party4"}
for i=1, 40 do
	UNIT_ID_ALL[#UNIT_ID_ALL+1] = "raid"..i
end

function Private.GetUnitID(Index)
	return UNIT_ID_ALL[Index]
end

function Private.FindUnitID(GUID, Limit)
	local UnitID

	-- We're not overriding limit, set dynamically.
	if ( not Limit ) then
		local Raid = GetNumRaidMembers()
		Limit = 4 + (Raid > 0 and 4 + Raid or GetNumPartyMembers())
	end

	for i=1, Limit do
		local ID = UNIT_ID_ALL[i]
		if ( GUID == UnitGUID(ID) ) then
			UnitID = ID
		end
	end

	return UnitID, Limit
end

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