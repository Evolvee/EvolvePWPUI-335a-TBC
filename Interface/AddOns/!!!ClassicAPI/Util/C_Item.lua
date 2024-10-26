local GetItemInfo = GetItemInfo

C_Item = C_Item or {}

function C_Item.GetItemInfo(itemInfo)
	return GetItemInfo(itemInfo)
end

function C_Item.IsItemDataCachedByID(itemID)
	local itemName, itemLink = GetItemInfo(itemID)
	return itemLink ~= nil
end

function C_Item.DoesItemExistByID(itemID)
	return true
end

function C_Item.DoesItemExist(itemInfo)
	-- This can accept location, id, link or name...
	return self.IsItemDataCachedByID(itemInfo)
end

function C_Item.GetItemName(itemInfo)
	return GetItemInfo(itemInfo)
end

function C_Item.GetItemNameByID(itemID)
	return GetItemInfo(itemID)
end

function C_Item.RequestLoadItemDataByID(itemID)
	local item = Item:CreateFromItemID(itemID)
	if item then
		item:ContinueOnItemLoad(self.DoesItemExistByID)
	end
end

local TODO = function()end

C_Item.GetItemGUID = TODO
C_Item.IsLocked = TODO
C_Item.GetItemID = TODO -- arg: Pass  the items location in bags/character etc, offical relies on itemLocationMixin
C_Item.LockItem = TODO
C_Item.UnlockItem = TODO
C_Item.GetItemIconByID = TODO
C_Item.GetItemIcon = TODO
C_Item.GetItemLink = TODO
C_Item.GetItemQualityByID = TODO
C_Item.GetItemQuality = TODO
C_Item.GetCurrentItemLevel = TODO
C_Item.GetItemInventoryTypeByID = TODO
C_Item.GetItemInventoryType = TODO
C_Item.GetItemGUID = TODO
C_Item.IsItemDataCached = TODO
C_Item.IsBound = TODO


function GetItemInfoInstant(itemInfo)
	-- return itemID, itemType, itemSubType, itemEquipLoc, icon, classID, subclassID
	-- TODO: if it is a link extract the id from the link text and send it back...
	-- we can't return any of the other information like classic because its not ready
	-- we have to read the tooltips
	return itemInfo
end

GetItemSubClassInfo = TODO