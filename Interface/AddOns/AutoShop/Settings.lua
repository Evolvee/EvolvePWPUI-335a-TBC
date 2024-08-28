----------------------------------------------------------------------------------------------------
-- helper functions
----------------------------------------------------------------------------------------------------
-- clear focus from any input field
local function ClearFocus()
	if GetCurrentKeyBoardFocus() then GetCurrentKeyBoardFocus():ClearFocus() end
end

----------------------------------------------------------------------------------------------------
-- Settings window
----------------------------------------------------------------------------------------------------
local window = nil -- created on first use

local function CreateGUI()
	if window then
		return
	end

	window = CreateFrame("Frame", "AutoShopFrame", UIParent, "BackdropTemplate")
	table.insert(UISpecialFrames, window:GetName()) -- make it closable with escape key
	window:SetFrameStrata("HIGH")
	window:SetBackdrop({
		bgFile="Interface/Tooltips/UI-Tooltip-Background",
		edgeFile="Interface/DialogFrame/UI-DialogBox-Border",
		tile=1, tileSize=32, edgeSize=32,
		insets={left=11, right=12, top=12, bottom=11}
	})
	window:SetBackdropColor(0,0,0,1)
	window:SetPoint("CENTER")
	window:SetSize(880, 450)
	window:SetMovable(true)
	window:EnableMouse(true)
	window:RegisterForDrag("LeftButton")
	window:SetScript("OnDragStart", window.StartMoving)
	window:SetScript("OnDragStop", window.StopMovingOrSizing)
	window:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" and not self.isMoving then
			self:StartMoving()
			self.isMoving = true
		end
	end)
	window:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" and self.isMoving then
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	end)
	window:SetScript("OnHide", function(self)
		if self.isMoving then
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	end)
	window:Hide()

	--------------------------------------------------
	-- header title
	--------------------------------------------------
	local textureHeader = window:CreateTexture(nil, "ARTWORK")
	textureHeader:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
	textureHeader:SetWidth(315)
	textureHeader:SetHeight(64)
	textureHeader:SetPoint("TOP", 0, 12)
	local textHeader = window:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	textHeader:SetPoint("TOP", textureHeader, "TOP", 0, -14)
	textHeader:SetText("AutoShop 1.0")

	--------------------------------------------------
	-- checkbox options
	--------------------------------------------------
	-- create a checkbox and fix the hit detection on it
	local function CreateCheckbox(name, text, tooltip)
		local frame = CreateFrame("CheckButton", "AutoshopCheckbox"..name, window, "OptionsCheckButtonTemplate")
		_G[frame:GetName().."Text"]:SetText(text)
		local width = _G[frame:GetName().."Text"]:GetStringWidth()
		frame:SetHitRectInsets(0, -width, 4, 4)
		frame.tooltipText = tooltip
		return frame
	end

	-- Autosell gray items
	local checkboxAutoSellGray = CreateCheckbox("AutoSellGray", "Sell gray quality items.")
	checkboxAutoSellGray:SetPoint("TOPLEFT", window, "TOPLEFT", 12, -36)
	checkboxAutoSellGray:SetScript("OnClick", function(this)
		ClearFocus()
		AutoShopSave.autoSellGray = this:GetChecked() or false
	end)

	-- Autosell white equipment
	local checkboxAutoSellWhite = CreateCheckbox("AutoSellWhite", "Sell white equipment except profession tools.",
		"Only sells armor and weapons (not shirts, tabards, and tools like blacksmith hammers and fishing poles).")
	checkboxAutoSellWhite:SetPoint("TOPLEFT", checkboxAutoSellGray, "BOTTOMLEFT", 0, 6)
	checkboxAutoSellWhite:SetScript("OnClick", function(this)
		ClearFocus()
		AutoShopSave.autoSellWhite = this:GetChecked() or false
	end)

	-- Autosell green/blue/purple equipment
	local function CreateQualityOption(color, widget_above_this)
		-- checkbox to enable the option
		local checkbox1 = CreateCheckbox("AutoSell"..color, "Sell " .. color:lower() .. " equipment below ilvl")
		checkbox1:SetPoint("TOPLEFT", widget_above_this, "BOTTOMLEFT", 0, 6)
		checkbox1:SetScript("OnClick", function(this)
			ClearFocus()
			AutoShopSave["autoSell"..color] = this:GetChecked() or false
		end)

		-- input to set the ilvl
		local input = CreateFrame("EditBox", "AutoshopInputAutoSell"..color, window, "InputBoxTemplate")
		input:SetWidth(28)
		input:SetHeight(16)
		input:SetNumeric(true)
		input:SetMaxLetters(3)
		input:SetPoint("LEFT", _G[checkbox1:GetName().."Text"], "RIGHT", 8, 0)
		input:SetAutoFocus(false)
		input:SetScript("OnEnterPressed", function(this) this:ClearFocus() end)
		input:SetScript("OnEditFocusLost", function(this)
			AutoShopSave["autoSell"..color.."Ilvl"] = tonumber(this:GetText()) or 0
			input:SetText(AutoShopSave["autoSell"..color.."Ilvl"])
		end)

		-- checkbox to also sell soulbound/unusable equipment no matter what the ilvl is
		local checkbox2 = CreateFrame("CheckButton", "AutoshopCheckboxUnusable"..color, window, "OptionsCheckButtonTemplate")
		checkbox2:SetPoint("LEFT", input, "RIGHT", 0, 0)
		_G[checkbox2:GetName().."Text"]:SetText("or unusable & bound.")
		checkbox2.tooltipText = "It only counts as unusable from incompatible wear types (like plate or wand) or class restrictions."
		checkbox2:SetScript("OnClick", function(this)
			ClearFocus()
			AutoShopSave["autoSell"..color.."Unusable"] = this:GetChecked() or false
		end)

		return checkbox1, input, checkbox2
	end
	local checkboxAutoSellGreen,  inputGreenIlvl,  checkboxAutoSellGreenUnusable  = CreateQualityOption("Green",  checkboxAutoSellWhite)
	local checkboxAutoSellBlue,   inputBlueIlvl,   checkboxAutoSellBlueUnusable   = CreateQualityOption("Blue",   checkboxAutoSellGreen)
	local checkboxAutoSellPurple, inputPurpleIlvl, checkboxAutoSellPurpleUnusable = CreateQualityOption("Purple", checkboxAutoSellBlue)
	checkboxAutoSellGreen.tooltipText  = "Only sells armor and weapons (not shirts and tabards)."
	checkboxAutoSellBlue.tooltipText   = "Only sells armor and weapons (not shirts and tabards)."
	checkboxAutoSellPurple.tooltipText = "Only sells armor and weapons (not shirts and tabards)."

	-- Autosell recipes
	local checkboxAutoSellRecipe = CreateCheckbox("AutoSellRecipe", "Sell recipes that are both unusable & bound.",
		"|cffff0000Warning: this includes recipes you don't have a high enough skill for, so you may want to wait until maxed to enable this.|r")
	checkboxAutoSellRecipe:SetPoint("TOPLEFT", checkboxAutoSellPurple, "BOTTOMLEFT", 0, 6)
	checkboxAutoSellRecipe:SetScript("OnClick", function(this)
		ClearFocus()
		AutoShopSave.autoSellRecipe = this:GetChecked() or false
	end)

	-- repair items
	local checkboxAutoRepair = CreateCheckbox("AutoRepair", "Repair automatically")
	checkboxAutoRepair:SetPoint("TOPLEFT", checkboxAutoSellGray, "TOPLEFT", window:GetWidth()/2+24, 0)
	checkboxAutoRepair:SetScript("OnClick", function(this)
		ClearFocus()
		AutoShopSave.autoRepair = this:GetChecked() or false
	end)

	local checkboxAutoRepairGuild = CreateCheckbox("AutoRepairGuild", "and try using guild money.")
	checkboxAutoRepairGuild:SetPoint("LEFT", _G[checkboxAutoRepair:GetName().."Text"], "RIGHT", 0, 0)
	checkboxAutoRepairGuild:SetScript("OnClick", function(this)
		ClearFocus()
		AutoShopSave.autoRepairGuild = this:GetChecked() or false
	end)

	-- show buy activity
	local checkboxShowBuyActivity = CreateCheckbox("ShowBuyActivity", "Show chat window messages about buying items.")
	checkboxShowBuyActivity:SetPoint("TOPLEFT", checkboxAutoRepair, "BOTTOMLEFT", 0, 6)
	checkboxShowBuyActivity:SetScript("OnClick", function(this)
		ClearFocus()
		AutoShopSave.showBuyActivity = this:GetChecked() or false
	end)

	-- show sell activity
	local checkboxShowSellActivity = CreateCheckbox("ShowSellActivity", "Show chat window messages about selling items.")
	checkboxShowSellActivity:SetPoint("TOPLEFT", checkboxShowBuyActivity, "BOTTOMLEFT", 0, 6)
	checkboxShowSellActivity:SetScript("OnClick", function(this)
		ClearFocus()
		AutoShopSave.showSellActivity = this:GetChecked() or false
	end)

	--------------------------------------------------
	-- editboxes
	--------------------------------------------------
	local function CreateEditBox(type_name, position_number, title_left, title_right)
		local container = CreateFrame("Frame", "AutoshopEdit"..type_name, window, "BackdropTemplate")
		local input = CreateFrame("EditBox", "AutoshopEdit"..type_name.."Input", container)
		local scroll = CreateFrame("ScrollFrame", "AutoshopEdit"..type_name.."Scroll", container, "UIPanelScrollFrameTemplate")

		-- header title (left)
		local title1 = window:CreateFontString(nil, "ARTWORK", "GameFontNormal")
		if position_number == 1 then
			title1:SetPoint("LEFT", window, "LEFT", 16, 0)
		elseif position_number == 2 then
			title1:SetPoint("LEFT", window, "LEFT", (window:GetWidth() / 2) - (125+8), 0)
		elseif position_number == 3 then
			title1:SetPoint("RIGHT", window, "RIGHT", -(250+8), 0)
		end
		title1:SetPoint("TOP", checkboxAutoSellRecipe, "BOTTOM", 0, -18)
		title1:SetText(title_left)

		-- editbox container
		container:SetPoint("TOPLEFT", title1, "BOTTOMLEFT", 0, -2)
		container:SetPoint("BOTTOM", window, "BOTTOM", 0, 12)
		container:SetWidth(250)
		container:SetBackdrop({
			bgFile = "Interface/Tooltips/UI-Tooltip-Background",
			edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
			tile=1, tileSize=32, edgeSize=16,
			insets={left=5, right=5, top=5, bottom=5}})
		container:SetBackdropColor(0,0,0,1)

		-- header title (right)
		if title_right then
			local title2 = window:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
			title2:SetPoint("TOP", title1, "TOP", 0, 0)
			title2:SetPoint("RIGHT", container, "RIGHT", 0, 0)
			title2:SetText(title_right)
		end

		-- input part
		input:SetMultiLine(true)
		input:SetAutoFocus(false)
		input:EnableMouse(true)
		input:SetFont("Fonts/ARIALN.ttf", 14)
		input:SetWidth(container:GetWidth()-20)
		input:SetHeight(container:GetHeight()-8)
		input:SetScript("OnEscapePressed", function() input:ClearFocus() end)

		-- scroll part
		scroll:SetPoint("TOPLEFT", container, "TOPLEFT", 8, -8)
		scroll:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -6, 8)
		scroll:EnableMouse(true)
		scroll:SetScript("OnMouseDown", function() input:SetFocus() end)
		scroll:SetScrollChild(input)

		input:SetScript("OnTextChanged", function(self) ScrollingEdit_OnTextChanged(self, self:GetParent()) end)
		input:SetScript("OnUpdate", function(self, elapsed) ScrollingEdit_OnUpdate(self, elapsed, self:GetParent()) end)
		input:SetScript("OnCursorChanged", ScrollingEdit_OnCursorChanged)

		-- allow items to be dragged into the lists
		local function InputReceiveItem(input)
			local cursor_type, _, cursor_link = GetCursorInfo()
			if cursor_type == "item" and input:IsVisible() then
				local name = cursor_link:match("%[(.+)]"):lower()
				local original = input:GetText()
				if original == "" or original:sub(-1) == "\n" then
					input:SetText(original .. name .. "\n")
				else
					input:SetText(original .. "\n" .. name .. "\n")
				end
				input:SetFocus()
				CloseDropDownMenus()
				ClearCursor()
			end
		end

		local function SetReceivable(widget, input)
			widget:SetScript("OnReceiveDrag", function() InputReceiveItem(input) end)
			widget.OnMouseDownOriginal = widget:GetScript("OnMouseDown")
			widget:SetScript("OnMouseDown", function(self, button)
				if button == "LeftButton" then InputReceiveItem(input) end
				if self.OnMouseDownOriginal then
					self:OnMouseDownOriginal(button)
				end
			end)
		end

		SetReceivable(scroll, input) -- has to affect the scroll part too to cover all areas
		SetReceivable(input, input)
		return input
	end

	local inputSell    = CreateEditBox("Sell", 1, "Sell:")
	local inputExclude = CreateEditBox("Exclude", 2, "Sell exclusions:")
	local inputBuy     = CreateEditBox("Buy", 3, "Buy:", "(example: 60 Wild Quillvine)")

	-- saving the lists
	inputSell:SetScript("OnEditFocusLost", function(this)
		AutoShopSave.autoSellList = {}
		for line in string.gmatch(this:GetText(), "[^\r\n]+") do
			AutoShopSave.autoSellList[line:trim():lower()] = true
		end
	end)

	inputExclude:SetScript("OnEditFocusLost", function(this)
		AutoShopSave.excludeList = {}
		for line in string.gmatch(this:GetText(), "[^\r\n]+") do
			AutoShopSave.excludeList[line:trim():lower()] = true
		end
	end)

	inputBuy:SetScript("OnEditFocusLost", function(this)
		AutoShopSave.autoBuyList = {}
		for line in string.gmatch(this:GetText(), "[^\r\n]+") do
			local amount, name = line:match("^%s*(%d*)%s*(.+)")
			AutoShopSave.autoBuyList[name:trim():lower()] = amount == "" and 0 or tonumber(amount)
		end
	end)

--------------------------------------------------
	-- help button
	--------------------------------------------------
	local buttonHelp = CreateFrame("Button", "AutoShopButtonHelp", window)
	buttonHelp:SetSize(16, 16)
	buttonHelp:SetNormalTexture("Interface/FriendsFrame/InformationIcon")
	buttonHelp:SetPoint("TOPLEFT", window, "TOPLEFT", 14, -14)
	buttonHelp:SetScript("OnEnter", function()
		GameTooltip:SetOwner(window, "ANCHOR_NONE")
		GameTooltip:SetPoint("BOTTOM", window, "TOP", 0, 0)
		GameTooltip:SetText("Write each item name on a separate line.\nNames aren't case sensitive.\nYou can drag and drop items onto the editboxes.\nTo buy all of a limited quantity item, just use the name without a wanted amount.\nPress escape or close the window to save list changes.")
		GameTooltip:Show()
	end)
	buttonHelp:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	--------------------------------------------------
	-- close button
	--------------------------------------------------
	local buttonClose = CreateFrame("Button", "AutoshopButtonClose", window, "UIPanelCloseButton")
	buttonClose:SetPoint("TOPRIGHT", window, "TOPRIGHT", -8, -8)
	buttonClose:SetScript("OnClick", function(this)
		ClearFocus()
		window:Hide()
	end)

	--------------------------------------------------
	-- showing the window
	--------------------------------------------------
	window:SetScript("OnShow", function()
		checkboxAutoSellGray:SetChecked(AutoShopSave.autoSellGray)
		checkboxAutoSellWhite:SetChecked(AutoShopSave.autoSellWhite)
		checkboxAutoSellGreen:SetChecked(AutoShopSave.autoSellGreen)
		checkboxAutoSellGreenUnusable:SetChecked(AutoShopSave.autoSellGreenUnusable)
		checkboxAutoSellBlue:SetChecked(AutoShopSave.autoSellBlue)
		checkboxAutoSellBlueUnusable:SetChecked(AutoShopSave.autoSellBlueUnusable)
		checkboxAutoSellPurple:SetChecked(AutoShopSave.autoSellPurple)
		checkboxAutoSellPurpleUnusable:SetChecked(AutoShopSave.autoSellPurpleUnusable)
		checkboxAutoSellRecipe:SetChecked(AutoShopSave.autoSellRecipe)

		checkboxShowBuyActivity:SetChecked(AutoShopSave.showBuyActivity)
		checkboxShowSellActivity:SetChecked(AutoShopSave.showSellActivity)
		checkboxAutoRepair:SetChecked(AutoShopSave.autoRepair)
		checkboxAutoRepairGuild:SetChecked(AutoShopSave.autoRepairGuild)

		inputGreenIlvl:SetText(AutoShopSave.autoSellGreenIlvl)
		inputBlueIlvl:SetText(AutoShopSave.autoSellBlueIlvl)
		inputPurpleIlvl:SetText(AutoShopSave.autoSellPurpleIlvl)

		-- put lists in alphabetical order
		local list = {}
		for name in pairs(AutoShopSave.autoSellList) do
			list[#list+1] = name
		end
		table.sort(list)
		inputSell:SetText(table.concat(list, "\n"))

		list = {}
		for name in pairs(AutoShopSave.excludeList) do
			list[#list+1] = name
		end
		table.sort(list)
		inputExclude:SetText(table.concat(list, "\n"))

		list = {}
		for name,amount in pairs(AutoShopSave.autoBuyList) do
			if amount and amount > 0 then
				list[#list+1] = amount .. " " .. name
			else
				list[#list+1] = name
			end
		end
		table.sort(list, function(text1, text2) return text1:match("^%d*%s*(.+)") < text2:match("^%d*%s*(.+)") end)
		inputBuy:SetText(table.concat(list, "\n"))
	end)

	return
end

----------------------------------------------------------------------------------------------------
-- slash command to open the options window
----------------------------------------------------------------------------------------------------
_G.SLASH_AUTOSHOP1 = "/autoshop"
function SlashCmdList.AUTOSHOP()
	if not window then
		CreateGUI()
	end
	window:Show()
end
