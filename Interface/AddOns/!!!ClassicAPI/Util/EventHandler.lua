local _, Private = ...

local CreateFrame = CreateFrame
local GetMetaTable = getmetatable
local HookSecureFunc = hooksecurefunc

local EventHandler = CreateFrame("Frame")
local ___Register = EventHandler.RegisterEvent
local ___Unregister = EventHandler.UnregisterEvent

local EVENT_ATLAS = {}
local EVENT_OBJECT = {}
local EVENT_ARCHIVE = {}

local function EventHandler_Fire(Self, Listener, ...)
	local Event = EVENT_ATLAS[Listener] or Listener

	local Trigger = EventHandler[Event.."_TRIGGER"]
	if ( Trigger and Trigger(nil, Listener, ...) == false ) then return end

	local Registered = EVENT_OBJECT[Event]
	local Shuffle = 1

	for i=1,#Registered do
		local Obj = Registered[i]

		if ( Obj ) then
			local OnEvent = Obj:GetScript("OnEvent")
			if ( OnEvent ) then
				OnEvent(Obj, Event, ...)
			end

			if ( i ~= Shuffle ) then
				Registered[Shuffle] = Obj
				Registered[i] = nil
			end

			Shuffle = Shuffle + 1
		else
			Registered[i] = nil
		end
	end
end

local function EventHandler_Listener(Event, Func)
	local Archive = EVENT_ARCHIVE[Event]
	if ( Archive[1] ) then
		for i=1,#Archive do
			Func(EventHandler, Archive[i])
		end
	else
		Func(EventHandler, Archive)
	end
end

--[[
	EventHandler: Method Hook(s)
]]

local function Method_RegisterEvent(Self, Event)
	local Archive = EVENT_ARCHIVE[Event]

	if ( Archive ) then
		local Registered = EVENT_OBJECT[Event]
		local RegisteredTotal = 0

		if ( Registered ) then
			RegisteredTotal = #Registered
			for i=1,RegisteredTotal do
				if ( Registered[i] == Self ) then
					return
				end
			end
		else
			local Trigger = EventHandler[Event.."_REGISTER"]
			if ( Trigger and Trigger() == false ) then return end

			Registered = {}
			EVENT_OBJECT[Event] = Registered
			EventHandler_Listener(Event, ___Register)
		end

		Registered[RegisteredTotal+1] = Self
	end
end

local function Method_UnregisterEvent(Self, Event)
	local Registered = EVENT_OBJECT[Event]

	if ( Registered ) then
		local RegisteredTotal, RegisteredIndex = 0

		for i=1,#Registered do
			local Obj = Registered[i]
			if ( Obj ) then
				RegisteredTotal = RegisteredTotal+1

				if ( Obj == Self ) then
					RegisteredIndex = i
					if ( RegisteredTotal > 1 ) then break end
				end
			end
		end

		if ( RegisteredIndex ) then
			if ( RegisteredTotal == 1 ) then
				local Trigger = EventHandler[Event.."_UNREGISTER"]
				if ( Trigger and Trigger() == false ) then return end

				EventHandler_Listener(Event, ___Unregister)
				EVENT_OBJECT[Event] = nil
			else
				Registered[RegisteredIndex] = false
			end
		end
	end
end

local function Method_RegisterUnitEvent(Self, Event, Unit1, Unit2)
	local UnitEventFrame = Self.___UnitEventHandler

	if ( not UnitEventFrame ) then
		UnitEventFrame = CreateFrame("Frame")
		Self.___UnitEventHandler = UnitEventFrame

		UnitEventFrame:SetScript("OnEvent", function(_, Event, ...)
			local Units = UnitEventFrame[Event]
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
			if ( UnitEventFrame[Event] ) then
				UnitEventFrame[Event] = nil
				___Unregister(UnitEventFrame, Event) -- Avoid our hook, call directly.
			end
		end)
	end

	local Units = UnitEventFrame[Event]
	if ( not Units ) then
		Units = {}
		UnitEventFrame[Event] = Units
		UnitEventFrame:RegisterEvent(Event)
	end

	Units[1] = Unit1
	if ( Unit2 ) then
		Units[2] = Unit2
	end
end

--[[
	EventHandler: AddModernEvent
	----------
	arg1 (String): Modern Event
	arg2 (String): Authentic Event
]]

local function EventHandler_AddEvent(Modern, Event)
	EVENT_ARCHIVE[Modern] = (Event) and Event or Modern
	if ( Event ) then
		if ( Event[1] ) then
			for i=1,#Event do
				EVENT_ATLAS[Event[i]] = Modern
			end
		else
			EVENT_ATLAS[Event] = Modern
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
EventHandler:SetScript("OnEvent", EventHandler_Fire)

-- Module
EventHandler.Fire = EventHandler_Fire
EventHandler.AddEvent = EventHandler_AddEvent

-- Private Namespace
Private.EventHandler = EventHandler