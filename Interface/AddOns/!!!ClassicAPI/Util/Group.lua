local GetNumRaidMembers = GetNumRaidMembers
local GetNumPartyMembers = GetNumPartyMembers
local GetPartyLeaderIndex = GetPartyLeaderIndex
local UnitIsRaidOfficer = UnitIsRaidOfficer
local UnitExists = UnitExists
local UnitIsConnected = UnitIsConnected
local UnitIsPlayer = UnitIsPlayer
local UnitIsEnemy = UnitIsEnemy
local GetRealNumRaidMembers = GetRealNumRaidMembers
local GetRaidRosterInfo = GetRaidRosterInfo
local UnitName = UnitName
local PromoteToAssistant = PromoteToAssistant
local DemoteAssistant = DemoteAssistant
local NewTicker = C_Timer.NewTicker
local LE_PARTY_CATEGORY_INSTANCE = LE_PARTY_CATEGORY_INSTANCE

function GetDisplayedAllyFrames()
end

function IsInGroup(LE_CATEGORY)
	if ( LE_CATEGORY and LE_CATEGORY == LE_PARTY_CATEGORY_INSTANCE ) then
		return false
	end
	return GetNumRaidMembers() > 0 or GetNumPartyMembers() > 0
end

function IsInRaid(LE_CATEGORY)
	if ( LE_CATEGORY and LE_CATEGORY ~= LE_PARTY_CATEGORY_INSTANCE ) then
		return false
	end
	return GetNumRaidMembers() > 0
end

function GetNumSubgroupMembers()
	return GetNumPartyMembers()
end

function GetNumGroupMembers()
	local Total = GetNumRaidMembers()

	if ( Total < 1 ) then
		Total = GetNumPartyMembers()
		Total = (Total > 0) and Total+1 or 0
	end

	return Total
end

function UnitIsGroupLeader(unit)
	local isLeader

	if ( not IsInGroup() ) then
		isLeader = false
	elseif ( unit == "player" ) then
		isLeader = IsInRaid() and IsRaidLeader() or IsPartyLeader()
	else
		local index = unit:match("%d+")
		isLeader = index and GetPartyLeaderIndex() == index
	end
	
	return isLeader
end

function UnitIsGroupAssistant(unit)
	local isAssistant = false
	if ( IsInRaid() ) then
		-- UnitIsRaidOfficer return correctly also for party
		isAssistant = UnitIsRaidOfficer(unit) and not UnitIsGroupLeader(unit)
	end
	return isAssistant
end

local isAllAssistant = false
function IsEveryoneAssistant()
	return isAllAssistant
end

local assistantTicker
function SetEveryoneIsAssistant(enable)
	local numMembers = GetRealNumRaidMembers()

	if ( numMembers > 0 ) then
		if ( assistantTicker ) then
			assistantTicker:Cancel()
			assistantTicker = nil
		end

		local index = 1
		local func = function()
			local unit = "raid"..index
			if ( IsEveryoneAssistant() ) then
				PromoteToAssistant(unit)
			else
				DemoteAssistant(unit)
			end
			index = index + 1
		end

		isAllAssistant = enable
		assistantTicker = NewTicker(0.15, func, numMembers)
	end
end

function CanBeRaidTarget(unit)
	if ( not unit ) then
		return
	end

	if ( UnitExists(unit) and UnitIsConnected(unit) ) then
		return not ( UnitIsPlayer(unit) and UnitIsEnemy("player", unit) )
	end
end

function UnitInOtherParty(unit)
	if not C_Map.IsWorldMap(GetZoneText()) or UnitPhaseReason(unit) then
		return false
	end

	if not ( IsInRaid() and UnitIsConnected(unit) ) then
		return
	end

	for i = 1, GetRealNumRaidMembers() do
		local name, rank, subgroup, level, class, fileName, zone = GetRaidRosterInfo(i)
		if ( name == UnitName(unit) ) then
			return not C_Map.IsWorldMap(zone)
		end
	end
end

function GetGroupMemberCountsForDisplay()
	local data = GetGroupMemberCounts();
	data.DAMAGER = data.DAMAGER + data.NOROLE; --People without a role count as damage
	data.NOROLE = 0;
	return data;
end