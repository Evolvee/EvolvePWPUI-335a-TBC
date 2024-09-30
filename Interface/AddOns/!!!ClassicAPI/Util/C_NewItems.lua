if ( C_NewItems ) then return end
C_NewItems = CreateFrame("Frame")

local SplitUI
local CursorHasItem = CursorHasItem
local GetContainerItemID = GetContainerItemID
local GetContainerNumSlots = GetContainerNumSlots
local GetContainerItemInfo = GetContainerItemInfo

--[[

	C_NewItems Helper
	-----
	Information:
		An item is considered "new" if it goes to an empty slot, or
		a stack is increased.

	Known Issue(s):
		Rapidly stacking/sorting items may cause it to consider an
		item new. I have rewritten this about 100 times. Used
		differnt methods. Events related to items are wonky, sadly.
		The best solution is to call RemoveNewItem while sorting, or
		ClearAll after.

]]

local INVENTORY, MOVE_ITEM_COUNT, MOVE_ITEM_CONTAINER, MOVE_ITEM_SLOT, MOVE_ITEM_TYPE
local MIN, MAX = 0, 4

local function GetSlotInfo(ContainerIndex, SlotIndex)
	if ( INVENTORY ) then
		local Container = INVENTORY[ContainerIndex]
		return (Container and SlotIndex) and Container[SlotIndex]
	end
end

local function ContainerUpdate(ContainerIndex, Remove)
	if ( ContainerIndex >= MIN and ContainerIndex <= MAX ) then
		if ( Remove ) then
			INVENTORY[ContainerIndex] = false
		else
			local Size = GetContainerNumSlots(ContainerIndex)
			local Container = INVENTORY[ContainerIndex]
			local Start, End

			if ( not Container ) then
				Container = {}
				INVENTORY[ContainerIndex] = Container
				Start = 1
			elseif ( Size ~= Container.Size ) then
				if ( Size > Container.Size ) then
					Start = Container.Size
				else
					Start = Size
					End = Container.Size
				end
			end

			if ( Start ) then
				for i=Start,(End or Size) do
					Container[i] = (Start == 1 or End) and {} or nil -- 40 bytes down the drain!
				end
			end

			Container.Size = Size

			return Container
		end
	end
end

local function SlotUpdate(ContainerIndex, Supress)
	local Container = INVENTORY[ContainerIndex]

	if ( not Supress ) then
		Supress = not Container
		Container = ContainerUpdate(ContainerIndex)
	end

	if ( Container ) then
		for SlotIndex=1, Container.Size do
			local Slot, ID, Stack, Locked, New, _ = Container[SlotIndex], GetContainerItemID(ContainerIndex, SlotIndex)

			if ( Slot.Stack and Slot.Stack == -1 ) then
				Stack = 0
			elseif ( ID ) then
				_, Stack, Locked = GetContainerItemInfo(ContainerIndex, SlotIndex)
				New = ( not Supress and not Locked and (not Slot.Stack or (Slot.Stack > 0 and (Slot.New == ID or Stack > Slot.Stack))) ) and ID or nil
			elseif ( Slot.Stack and Slot.Stack == -2 ) then
				Stack = Slot.Stack -- Await ID
			end

			Slot.New = New
			Slot.Stack = Locked and 0 or Stack
		end
	end
end

local function MoveClear(ContainerIndex, SlotIndex)
	if ( ContainerIndex == true or (ContainerIndex == MOVE_ITEM_CONTAINER and SlotIndex == MOVE_ITEM_SLOT) ) then
		MOVE_ITEM_COUNT = nil
		MOVE_ITEM_CONTAINER = nil
		MOVE_ITEM_SLOT = nil
		MOVE_ITEM_TYPE = nil
		SplitUI.split = nil
	end
end

local function MoveSet(ContainerIndex, SlotIndex, Stack)
	if ( Stack or (SplitUI.split and not MOVE_ITEM_SLOT) ) then
		MOVE_ITEM_COUNT = Stack or SplitUI.split
		MOVE_ITEM_CONTAINER = ContainerIndex
		MOVE_ITEM_SLOT = SlotIndex
		MOVE_ITEM_TYPE = (SplitUI.split) and true
	end
end

local function MoveInfo()
	return MOVE_ITEM_COUNT, MOVE_ITEM_CONTAINER, MOVE_ITEM_SLOT, MOVE_ITEM_TYPE
end

local function PickupContainerItem(ContainerIndex, SlotIndex)
	local Slot = GetSlotInfo(ContainerIndex, SlotIndex)
	if ( Slot ) then
		local PlacementStack = Slot.Stack
		if ( CursorHasItem() ) then
			MoveSet(ContainerIndex, SlotIndex, PlacementStack) -- Click (Not Split)
		else
			local OriginStack, OriginContainerIndex, OriginSlotIndex, Split, Iteration = MoveInfo()

			if ( OriginStack ) then
				if ( PlacementStack and PlacementStack > 1 ) then
					Iteration = -1 -- Merging
				else
					Iteration = (Split) and -2 or -1 -- Empty/Swap
				end

				local Origin = GetSlotInfo(OriginContainerIndex, OriginSlotIndex)
				if ( Origin ) then
					Origin.New = nil
					Origin.Stack = 0
				end
			else
				Iteration = 0 -- Source Unknown
			end

			Slot.New = nil
			Slot.Stack = Iteration
			MoveClear(true)
		end
	end
end

local function EventHandler(Self, Event, ...)
	if ( Event == "BAG_UPDATE" ) then
		SlotUpdate(...)
	elseif ( Event == "BAG_CLOSED" ) then
		ContainerUpdate(..., true)
	elseif ( Event == "ITEM_LOCKED" ) then
		MoveSet(...)
	else
		MoveClear(... or MoveInfo() and true)
	end
end

function Construct()
	local Self = C_NewItems

	INVENTORY = {}
	SplitUI = StackSplitFrame

	for i=MIN,MAX do
		SlotUpdate(i, true)
	end

	Self:RegisterEvent("BAG_CLOSED")
	Self:RegisterEvent("ITEM_LOCKED")
	Self:RegisterEvent("ITEM_UNLOCKED")
	Self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")

	Self:SetScript("OnEvent", EventHandler)
	hooksecurefunc("PickupContainerItem", PickupContainerItem)
end

--[[
	I hate this, but we have to be first.
	Or we pre-call a C_NewItems func.
]]
C_NewItems:RegisterEvent("BAG_UPDATE")

--[[

	C_NewItems

]]

function C_NewItems.ClearAll()
	if ( not INVENTORY ) then return Construct() end

	for i=MIN,MAX do
		SlotUpdate(i, true)
	end
end

function C_NewItems.IsNewItem(ContainerIndex, SlotIndex)
	if ( not INVENTORY ) then return Construct() end

	local Slot = GetSlotInfo(ContainerIndex, SlotIndex)
	return Slot and Slot.New
end

function C_NewItems.RemoveNewItem(ContainerIndex, SlotIndex)
	if ( not INVENTORY ) then return Construct() end

	local Slot = GetSlotInfo(ContainerIndex, SlotIndex)
	if ( Slot ) then
		Slot.New = nil
	end
end