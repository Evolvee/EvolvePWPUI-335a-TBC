if ( C_NewItems ) then return end

local GetContainerNumSlots = GetContainerNumSlots
local GetContainerItemInfo = GetContainerItemInfo
local GetContainerItemID = GetContainerItemID
local CursorHasItem = CursorHasItem
local GetTime = GetTime
local Type = type

local C_NewItems = CreateFrame("Frame")

local INVENTORY, STACK_UI
local MIN, MAX = 0, 4

local function GetSlotInfo(ContainerIndex, SlotIndex)
	local Container = INVENTORY[ContainerIndex]
	return (Container and SlotIndex) and Container[SlotIndex]
end

local function Bag(Event, ContainerIndex)
	if ( ContainerIndex >= MIN and ContainerIndex <= MAX ) then
		if ( Event == "BAG_CLOSED" ) then
			INVENTORY[ContainerIndex] = false
		else
			local Size = GetContainerNumSlots(ContainerIndex)
			local Container = INVENTORY[ContainerIndex]
			local Start, End

			if ( not Container ) then
				Container = {}
				INVENTORY[ContainerIndex] = Container
				Start = 1
			elseif ( Size ~= Container.Size or not Container[Size] ) then
				if ( Size > Container.Size ) then
					Start = Container.Size
				else
					Start = Size
					End = Container.Size
				end
			end

			if ( Start ) then
				local Time = GetTime()
				for i=Start,(End or Size) do
					Container[i] = (Start == 1 or End) and {[3] = Time} or nil
				end
			end

			Container.Size = Size

			return Container
		end
	end
end

local function Query(Event, ContainerIndex)
	local Container = INVENTORY[ContainerIndex]

	if ( Event ) then
		Container = Bag(Event, ContainerIndex)
	end

	if ( Container ) then
		local Time = Event and GetTime()

		for SlotIndex=1, Container.Size do
			local Slot = Container[SlotIndex]

			if ( Slot ) then
				if ( Event ) then
					local _, StackCurrent = GetContainerItemInfo(ContainerIndex, SlotIndex)
					local Stack = Slot[1]

					if ( StackCurrent ~= Stack ) then
						local Buffer = Slot[3]

						if ( Buffer and (Time - Buffer) > .5 ) then -- Latency?
							Buffer = nil
							Slot[3] = nil
						end

						if ( Event == "CONSTRUCT" or Buffer or (StackCurrent or -1) < (Stack or 0) ) then
							if ( not (Buffer and Stack == 9998 and not StackCurrent) ) then
								Slot[1] = StackCurrent
								Slot[2] = nil

								if ( not StackCurrent and Slot == STACK_UI.split ) then
									STACK_UI.split = nil -- Move unknown, clear.
								end
							end
						else
							local CurrentID = GetContainerItemID(ContainerIndex, SlotIndex)
							local Changed = Slot[2] ~= CurrentID

							Slot[1] = StackCurrent
							Slot[2] = (Changed) and nil or CurrentID
						end
					end
				else
					Slot[2] = nil -- .ClearAll()
				end
			end
		end
	end
end

hooksecurefunc("PickupContainerItem", function(ContainerIndex, SlotIndex)
	if ( INVENTORY ) then
		local Slot = GetSlotInfo(ContainerIndex, SlotIndex)

		if ( Slot ) then
			if ( CursorHasItem() ) then
				STACK_UI.split = Slot
			else
				local Origin = STACK_UI.split

				if ( Origin ~= Slot ) then
					local Time, Stack = GetTime()

					if ( Origin ) then
						if ( Type(Origin) == "number" ) then
							Stack = 9998
						else
							Origin[1] = 9999
							Origin[3] = Time
						end
					end

					Slot[1] = Stack or 9999
					Slot[3] = Time
				end

				STACK_UI.split = nil
			end
		else
			STACK_UI.split = nil
		end
	end
end)

local function Processor(Self, Event, ...)
	if ( Self == "CONSTRUCT" ) then
		STACK_UI = StackSplitFrame -- Avoid hook to SplitContainerItem()?
		INVENTORY = {}

		for i=MIN,MAX do
			Query(Self, i)
		end

		local BAG_UPDATE = {GetFramesRegisteredForEvent("BAG_UPDATE")}

		C_NewItems:RegisterEvent("BAG_UPDATE")
		C_NewItems:RegisterEvent("BAG_CLOSED")
		C_NewItems:SetScript("OnEvent", Processor)

		for i=1,#BAG_UPDATE do
			local Frame = BAG_UPDATE[i]
			Frame:UnregisterEvent("BAG_UPDATE")
			Frame:RegisterEvent("BAG_UPDATE")
		end
	elseif ( Event == "BAG_CLOSED" ) then
		Bag(Event, ...)
	else
		local ContainerIndex, NewItems = ...
		if ( not NewItems ) then
			Query(Event, ContainerIndex)
		end
	end
end

--[[

	C_NewItems

]]

function C_NewItems.ClearAll()
	if ( not INVENTORY ) then return Processor("CONSTRUCT") end

	for i=MIN,MAX do
		Query(nil, i)
	end
end

function C_NewItems.IsNewItem(ContainerIndex, SlotIndex)
	if ( not INVENTORY ) then return Processor("CONSTRUCT") end

	local Slot = GetSlotInfo(ContainerIndex, SlotIndex)
	return (Slot and Slot[2]) and true
end

function C_NewItems.RemoveNewItem(ContainerIndex, SlotIndex)
	if ( not INVENTORY ) then return Processor("CONSTRUCT") end

	local Slot = GetSlotInfo(ContainerIndex, SlotIndex)
	if ( Slot ) then
		Slot[2] = nil
	end
end

-- Global
_G.C_NewItems = C_NewItems