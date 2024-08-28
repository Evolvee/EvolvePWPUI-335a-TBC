local _, Private = ...

local BitBand = bit.band
local LibStub = LibStub
local GetTime = GetTime
local UnitGUID = UnitGUID
local UnitName = UnitName
local FindUnitID = Private.FindUnitID
local EventHandler = Private.EventHandler
local EventHandler_Fire = Private.EventHandler_Fire

local RESCOMM
local HEALCOMM
local HEALCOMM_PLAYER_GUID

--[[

	FUNCTIONS

]]

function UnitGetIncomingHeals(Unit, Healer, GUID)
	if ( Unit ) then
		if ( HEALCOMM == nil ) then
			HEALCOMM = LibStub:GetLibrary("LibHealComm-4.0", true) or false
		end

		if ( HEALCOMM ) then
			if ( not GUID ) then
				Unit = UnitGUID(Unit)
			end

			return HEALCOMM:GetHealAmount(Unit, HEALCOMM.CASTED_HEALS, GetTime() + 5, UnitGUID("player"))
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
		if ( RESCOMM == nil ) then
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
	local UnitID, Limit = FindUnitID(GUID, Limit)
	if ( UnitID ) then
		EventHandler_Fire(nil, "UNIT_HEAL_PREDICTION", UnitID)
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
	if ( not HEALCOMM_PLAYER_GUID ) then
		if ( HEALCOMM == nil ) then
			HEALCOMM = LibStub:GetLibrary("LibHealComm-4.0", true) or false
		end

		if ( HEALCOMM ) then
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

Private.EventHandler_AddClassicEvent("UNIT_HEAL_PREDICTION")