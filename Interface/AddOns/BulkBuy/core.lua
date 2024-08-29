local MAX_STACK = 10000 -- The maximum stack size accepted by the stack split frame.

-----------------
--END OF CONFIG--
-----------------

local function MerchantItemButton_SplitStack(self, split)
	if self.extendedCost then
		MerchantFrame_ConfirmExtendedItemCost(self, split)
	elseif split > 0 then
		local slot = self:GetID()
		local stackSize = GetMerchantItemMaxStack(slot)

		if split > stackSize then
			while split > stackSize do -- Buy as many full stacks as we can
				BuyMerchantItem(slot, stackSize)
				split = split - stackSize
			end
			
			if split > 0 then -- Buy any leftover items
				BuyMerchantItem(slot, split)
			end
		else
			BuyMerchantItem(slot, split)
		end
	end
end

-- Overwrite the default UI's SplitStack method
-- There are 12 MerchantItemXItemButtons, but the merchant frame only uses the first 10; the others are only used by the buyback window
for i = 1, 10 do
	local button = _G["MerchantItem".. i .."ItemButton"]
	button.SplitStack = MerchantItemButton_SplitStack
end

local function MerchantItemButton_OnModifiedClick_Hook(self, button)
	if self.hasStackSplit == 1 then
		UpdateStackSplitFrame(MAX_STACK)
	elseif MerchantFrame.selectedTab == 1 and IsModifiedClick("SPLITSTACK") then
		local _, _, _, stackCount, _, _, extendedCost = GetMerchantItemInfo(self:GetID())
		if stackCount > 1 and extendedCost then return end
		
		OpenStackSplitFrame(MAX_STACK, self, "BOTTOMLEFT", "TOPLEFT")
	end
end

hooksecurefunc("MerchantItemButton_OnModifiedClick", MerchantItemButton_OnModifiedClick_Hook)