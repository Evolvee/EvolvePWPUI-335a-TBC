--[[
	EventHandler: Support
	-------
	Note:
		Some events are nested within individual files.
]]

local _, Private = ...

local EventHandler = Private.EventHandler
local EventHandler_Fire = EventHandler.Fire
local _ = EventHandler.AddEvent

--local UnitIsConnected = UnitIsConnected

-- SPELL_DATA_LOAD_RESULT : C_Spell.lua
-- ITEM_DATA_LOAD_RESULT : ItemUtil.lua
-- UNIT_HEAL_PREDICTION : HealPrediction.lua

--[[
	EventHandler: GROUP_ROSTER_UPDATE / GROUP_JOINED / GROUP_LEFT
]]

_("GROUP_ROSTER_UPDATE", "PARTY_MEMBERS_CHANGED")
--_("GROUP_JOINED")
--_("GROUP_LEFT")
--_("GROUP_FORMED")

--[[
	EventHandler: UNIT_CONNECTION
]]

--[[local UNIT_CONNECTION_STATUS

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

_("UNIT_CONNECTION", "UNIT_FACTION")]]

--[[

	EventHandler: INSPECT_READY
	Notes:
		Work in progress!
		UnitTalentQuery

]]

_("INSPECT_READY", "INSPECT_TALENT_READY")