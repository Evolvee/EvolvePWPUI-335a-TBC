local _, Private = ...

local BitBand = bit.band
local GetTime = GetTime
local UnitGUID = UnitGUID
local UnitName = UnitName
local EventHandler = Private.EventHandler
local EventHandler_Fire = EventHandler.Fire
local GetNumRaidMembers = GetNumRaidMembers
local GetNumPartyMembers = GetNumPartyMembers

local RESCOMM
local HEALCOMM
local HEALCOMM_PLAYER_GUID

local UNIT_INDEX = {"player", "pet", "target", "focus"}

for i=1,4 do
	local Index = #UNIT_INDEX+1
	UNIT_INDEX[Index] = "party"..i
	UNIT_INDEX[Index+1] = "partypet"..i
end

for i=1, 40 do
	local Index = #UNIT_INDEX+1
	UNIT_INDEX[Index] = "raid"..i
	UNIT_INDEX[Index+1] = "raidpet"..i
end

--[[
	FUNCTIONS
]]

function UnitGetIncomingHeals(Unit, Healer, GUID)
	if ( Unit ) then
		if ( HEALCOMM == nil and LibStub ) then
			HEALCOMM = LibStub:GetLibrary("LibHealComm-4.0", true) or false

			if ( HEALCOMM and not HEALCOMM_PLAYER_GUID ) then
				HEALCOMM_PLAYER_GUID = UnitGUID("player")
			end
		end

		if ( HEALCOMM ) then
			if ( not GUID ) then
				Unit = UnitGUID(Unit)
			end

			return HEALCOMM:GetHealAmount(Unit, HEALCOMM.CASTED_HEALS, GetTime() + 5, HEALCOMM_PLAYER_GUID)
		end
	end
end

function UnitGetTotalAbsorbs(Unit)
	return 0
end

function UnitGetTotalHealAbsorbs(Unit)
	return 0
end

function UnitHasIncomingResurrection(Unit)
	if ( Unit ) then
		if ( RESCOMM == nil and LibStub ) then
			RESCOMM = LibStub:GetLibrary("LibResComm-1.0", true) or false
		end
		return (RESCOMM) and RESCOMM:IsUnitBeingRessed(UnitName(Unit))
	end
end

--[[
	EVENT HANDLER:
		UNIT_HEAL_PREDICTION
]]

local function UNIT_HEAL_PREDICTION(Limit, GUID, ...)
	if ( not Limit ) then
		local Raid = GetNumRaidMembers()
		Limit = 4 + (Raid > 0 and 8 + (Raid*2) or (GetNumPartyMembers()*2))
	end

	for i=1, Limit do
		local UnitID = UNIT_INDEX[i]
		if ( GUID == UnitGUID(UnitID) ) then
			EventHandler_Fire(nil, "UNIT_HEAL_PREDICTION", UnitID)
		end
	end

	if ( ... ) then
		UNIT_HEAL_PREDICTION(Limit, ...)
	end
end

local function HealComm_HealStarted(_, Event, SrcGUID, SpellID, Type, EndTime, ...)
	if ( SrcGUID == HEALCOMM_PLAYER_GUID and BitBand(Type, HEALCOMM.CASTED_HEALS) > 0 ) then
		UNIT_HEAL_PREDICTION(nil, ...)
	end
end

local function HealComm_ModifierChanged(_, _, SrcGUID)
	UNIT_HEAL_PREDICTION(nil, SrcGUID)
end

function EventHandler:UNIT_HEAL_PREDICTION_REGISTER()
	if ( HEALCOMM == nil and LibStub ) then
		HEALCOMM = LibStub:GetLibrary("LibHealComm-4.0", true) or false

		if ( HEALCOMM and not HEALCOMM_PLAYER_GUID ) then
			HEALCOMM_PLAYER_GUID = UnitGUID("player")
		end
	end

	if ( HEALCOMM and not EventHandler.HealComm_HealStarted) then
		EventHandler.HealComm_HealStarted = HealComm_HealStarted
		EventHandler.HealComm_ModifierChanged = HealComm_ModifierChanged

		HEALCOMM.RegisterCallback(EventHandler, "HealComm_HealStarted")
		HEALCOMM.RegisterCallback(EventHandler, "HealComm_HealDelayed", "HealComm_HealStarted")
		HEALCOMM.RegisterCallback(EventHandler, "HealComm_HealUpdated", "HealComm_HealStarted")
		HEALCOMM.RegisterCallback(EventHandler, "HealComm_HealStopped", "HealComm_HealStarted")
	end
end

function EventHandler:UNIT_HEAL_PREDICTION_UNREGISTER()
	if ( HEALCOMM and EventHandler.HealComm_HealStarted ) then
		HEALCOMM.UnregisterCallback(EventHandler, "HealComm_HealStarted")
		HEALCOMM.UnregisterCallback(EventHandler, "HealComm_HealDelayed")
		HEALCOMM.UnregisterCallback(EventHandler, "HealComm_HealUpdated")
		HEALCOMM.UnregisterCallback(EventHandler, "HealComm_HealStopped")

		EventHandler.HealComm_HealStarted = nil
		EventHandler.HealComm_ModifierChanged = nil
	end
end

EventHandler.AddEvent("UNIT_HEAL_PREDICTION")