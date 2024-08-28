local _, Private = ...

-- EventHandler v1

local GetMetaTable = getmetatable
local HookSecureFunc = hooksecurefunc

local EventHandler = CreateFrame("Frame")
local ___RegisterEvent = EventHandler.RegisterEvent
local ___UnregisterEvent = EventHandler.UnregisterEvent

local EVENT_STORAGE = {} -- Active Events
local CLASSIC_EVENT = {} -- New -> Old
local HANDLER_EVENT = {} -- Old -> New

--[[

	CALLBACK SYSTEM

]]

local function EventHandler_Unregister(Self, Event, Event2)
	local EventData = EVENT_STORAGE[Event]

	if ( EventData ) then
		local EventDataTotal, Index = 0

		for i=1,#EventData do
			local Obj = EventData[i]

			if ( Obj ) then
				EventDataTotal = EventDataTotal + 1

				if ( Obj == Self ) then
					Index = i
					if ( EventDataTotal > 1 ) then break end
				end
			end
		end

		if ( Index ) then
			if ( EventDataTotal == 1 ) then
				EVENT_STORAGE[Event] = nil
				___UnregisterEvent(EventHandler, Event2)

				local UnregisterFunc = EventHandler[Event.."_UNREGISTER"]
				if ( UnregisterFunc ) then
					UnregisterFunc(nil, Self)
				end
			else
				EventData[Index] = false
			end
		end
	end
end

local function EventHandler_Register(Self, Event, Event2)
	local EventData = EVENT_STORAGE[Event]
	local EventDataTotal = 0

	if ( not EventData ) then
		local _ = {}
		EVENT_STORAGE[Event] = _
		EventData = _
	else
		EventDataTotal = #EventData

		for i=1,EventDataTotal do
			if ( EventData[i] == Self ) then
				return
			end
		end
	end

	EventData[EventDataTotal + 1] = Self
	___RegisterEvent(EventHandler, Event2)
end

local function EventHandler_Fire(Self, Event, ...)
	Event = HANDLER_EVENT[Event] or Event
	local EventData = EVENT_STORAGE[Event]

	if ( EventData ) then
		local TriggerFunc = EventHandler[Event.."_TRIGGER"]
		if ( TriggerFunc and TriggerFunc(nil, Self, Event, ...) == false ) then
			return
		end

		local Shuffle = 1
		for i=1,#EventData do
			local Obj = EventData[i]

			if ( Obj ) then
				local OnEvent = Obj:GetScript("OnEvent")
				if ( OnEvent ) then
					OnEvent(Obj, Event, ...)
				end

				if ( i ~= Shuffle ) then
					EventData[Shuffle] = Obj
					EventData[i] = nil
				end

				Shuffle = Shuffle + 1
			else
				EventData[i] = nil
			end
		end
	end
end
EventHandler:SetScript("OnEvent", EventHandler_Fire)

--[[

	METHOD HOOK(S)

]]

local function Method_RegisterEvent(Self, Event)
	local ClassicEvent = CLASSIC_EVENT[Event]

	if ( ClassicEvent ) then
		local RegisterFunc = EventHandler[Event.."_REGISTER"]
		if ( RegisterFunc and RegisterFunc(nil, Self) == false ) then
			return
		end

		if ( ClassicEvent[1] ) then
			for i=1,#ClassicEvent do
				EventHandler_Register(Self, Event, ClassicEvent[i])
			end
		else
			EventHandler_Register(Self, Event, ClassicEvent)
		end
	end
end

local function Method_UnregisterEvent(Self, Event)
	local ClassicEvent = CLASSIC_EVENT[Event]

	if ( ClassicEvent ) then
		if ( ClassicEvent[1] ) then
			for i=1,#ClassicEvent do
				EventHandler_Unregister(Self, Event, ClassicEvent[i])
			end
		else
			EventHandler_Unregister(Self, Event, ClassicEvent)
		end
	end
end

local function Method_RegisterUnitEvent(Self, Event, Unit1, Unit2)
	local UnitEvent = Self.___UnitEventHandler

	if ( not UnitEvent ) then
		UnitEvent = CreateFrame("Frame")
		Self.___UnitEventHandler = UnitEvent

		UnitEvent:SetScript("OnEvent", function(_, Event, ...)
			local Units = UnitEvent[Event]
			if ( Units ) then
				local Unit = ...
				if ( Units[1] == Unit or Units[2] == Unit ) then
					local OnEvent = Self:GetScript("OnEvent")
					if ( OnEvent ) then
						OnEvent(Self, Event, ...)
					end
				end
			end
		end)

		HookSecureFunc(Self, "UnregisterEvent", function(_, Event)
			if ( UnitEvent[Event] ) then
				UnitEvent[Event] = nil
				___UnregisterEvent(UnitEvent, Event) -- Stop extra method call.
			end
		end)
	end

	local Units = UnitEvent[Event]
	if ( not Units ) then
		Units = {}
		UnitEvent[Event] = Units
		UnitEvent:RegisterEvent(Event)
	end

	Units[1] = Unit1
	if ( Unit2 ) then
		Units[2] = Unit2
	end
end

--[[
	MODERN EVENT TO 335 EVENT: EventHandler_AddClassicEvent
	----
	arg1: Modern Event
	arg2: 335 Event (Table or String)

]]

local function EventHandler_AddClassicEvent(ClassicEvent, Event)
	CLASSIC_EVENT[ClassicEvent] = (Event) and Event or ClassicEvent

	if ( Event ) then
		if ( Event[1] ) then
			for i=1,#Event do
				HANDLER_EVENT[Event[i]] = ClassicEvent
			end
		else
			HANDLER_EVENT[Event] = ClassicEvent
		end
	end
end

local FrameMeta = GetMetaTable(EventHandler).__index
local ButtonMeta = GetMetaTable(CreateFrame("Button")).__index
FrameMeta.RegisterUnitEvent = Method_RegisterUnitEvent
ButtonMeta.RegisterUnitEvent = Method_RegisterUnitEvent
HookSecureFunc(FrameMeta, "RegisterEvent", Method_RegisterEvent)
HookSecureFunc(FrameMeta, "UnregisterEvent", Method_UnregisterEvent)
HookSecureFunc(ButtonMeta, "RegisterEvent", Method_RegisterEvent)
HookSecureFunc(ButtonMeta, "UnregisterEvent", Method_UnregisterEvent)

-- Private Namespace
Private.EventHandler = EventHandler
Private.EventHandler_Fire = EventHandler_Fire
Private.EventHandler_Register = EventHandler_Register
Private.EventHandler_Unregister = EventHandler_Unregister
Private.EventHandler_AddClassicEvent = EventHandler_AddClassicEvent