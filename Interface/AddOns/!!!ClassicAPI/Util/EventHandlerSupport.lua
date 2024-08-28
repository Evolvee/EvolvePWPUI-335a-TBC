--[[
	MODERN EVENT TO 335 EVENT: EventHandler_AddClassicEvent
	----
	arg1: Modern Event
	arg2: 335 Event (Table or String)

	Misc events that are pending dedicated files go here.

]]

local _, Private = ...

local EventHandler = Private.EventHandler
local EventHandler_Fire = Private.EventHandler_Fire
local _ = Private.EventHandler_AddClassicEvent

local UnitIsConnected = UnitIsConnected
local GetNumRaidMembers = GetNumRaidMembers
--local GetNumPartyMembers = GetNumPartyMembers

-- SPELL_DATA_LOAD_RESULT : C_Spell.lua
-- ITEM_DATA_LOAD_RESULT : ItemUtil.lua
-- UNIT_HEAL_PREDICTION : HealPrediction.lua

--[[

	EventHandler: GROUP_ROSTER_UPDATE

]]

function EventHandler:GROUP_ROSTER_UPDATE_TRIGGER(_, Event)
	-- Halt PARTY_MEMBERS_CHANGED calls while in a raid.
	if ( Event == "PARTY_MEMBERS_CHANGED" and GetNumRaidMembers() > 0 ) then
		return false
	end
end

_("GROUP_ROSTER_UPDATE", {"PARTY_MEMBERS_CHANGED", "RAID_ROSTER_UPDATE"})

--[[

	EventHandler: GROUP_JOINED / GROUP_LEFT
	Notes:
		Pending for EventHandler2.

]]

--[[
local GROUP_SIZE = 0

local function GROUP_STATUS_TRIGGER(_, Event)
	local GROUP_SIZE_PREVIOUS = GROUP_SIZE
	local RaidNum = GetNumRaidMembers()
	GROUP_SIZE = RaidNum > 0 and RaidNum or GetNumPartyMembers()

	if ( GROUP_SIZE_PREVIOUS == 0 and GROUP_SIZE > 0 ) then
		-- What do we really consider a "new" group?
		EventHandler_Fire(nil, "GROUP_JOINED")
	elseif ( GROUP_SIZE == 0 ) then
		EventHandler_Fire(nil, "GROUP_LEFT")
	end
end

_("GROUP_JOINED")
_("GROUP_LEFT")
-- GROUP_FORMED
]]

--[[

	EventHandler: UNIT_CONNECTION

]]

local UNIT_CONNECTION_STATUS

local function UNIT_CONNECTION_TRIGGER(_, Event, UnitID, Connected)
	if ( not Connected ) then -- HACK: Prevent continuation within Handler, only callback after we add "Connected" to payload.
		local Connected = UnitIsConnected(UnitID) and true or false

		if ( Connected ~= UNIT_CONNECTION_STATUS[UnitID] ) then
			EventHandler_Fire(nil, "UNIT_CONNECTION", UnitID, Connected)
			UNIT_CONNECTION_STATUS[UnitID] = Connected or nil
		end

		return false
	end
end

function EventHandler:UNIT_CONNECTION_REGISTER()
	if ( not UNIT_CONNECTION_STATUS ) then
		UNIT_CONNECTION_STATUS = {}
	end
end

function EventHandler:UNIT_CONNECTION_UNREGISTER()
	UNIT_CONNECTION_STATUS = nil
end

_("UNIT_CONNECTION", "UNIT_FACTION")

--[[

	EventHandler: INSPECT_READY
	Notes:
		Work in progress!
		UnitTalentQuery

]]

_("INSPECT_READY", "INSPECT_TALENT_READY")