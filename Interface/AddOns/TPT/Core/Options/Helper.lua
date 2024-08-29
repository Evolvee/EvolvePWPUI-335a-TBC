local AddOn, TPT, Private = select(2, ...):Init()

local Select = select
local StringUpper = string.upper
local ToNumber = tonumber
local ToString = tostring
local Type = type

function TPT.OptionPanel(Name, OnLoad, ...)
	local Panel = CreateFrame("Frame")
	Panel.name = Name

	InterfaceOptions_AddCategory(Panel)

	Panel:SetScript("OnShow", function(Self)
		Panel:SetScript("OnShow", nil)
		OnLoad(Self, Name)
		BlizzardOptionsPanel_OnLoad(Self, Self.Okay, Self.Cancel, Self.Default, Self.Refresh)

		if ( not Panel._CMD ) then
			BlizzardOptionsPanel_Refresh(Self)
		end

		Panel._CMD = nil
	end)

	local PanelNameUpper = StringUpper(Name)
	for i = 1, Select('#', ...) do
		_G["SLASH_"..PanelNameUpper..i] = Select(i, ...)
	end
	SlashCmdList[PanelNameUpper] = function()
		Panel._CMD = 1
		InterfaceOptionsFrame_OpenToCategory(Panel)
	end

	return Panel
end

function TPT.OptionPanelHelper()
	local function Tooltip_Show(Self)
		GameTooltip:SetOwner(Self, "ANCHOR_TOPRIGHT")
		GameTooltip:SetText(Self.tooltipText, nil, nil, nil, nil, 1)
	end

	local function Tooltip_Hide()
		GameTooltip:Hide()
	end

	local function Tooltip_Set(Self, Text)
		if ( Text ) then
			Self.tooltipText = Text
			Self:SetScript("OnEnter", Tooltip_Show)
			Self:SetScript("OnLeave", Tooltip_Hide)
		end
	end

	local function CreateButton_OnClick(Self)
		Self:_Click()
	end

	local function CreateDropdown_Select(_, Self, Value)
		if ( Self.selectedValue ~= Value ) then
			Self.newValue = Value
			UIDropDownMenu_SetSelectedValue(Self, Value)

			if ( Self._OnChange and Self._Set ) then
				Self.value = Value
				Self:_Set(Value)
			end
		end
	end

	local function CreateDropdown_Initialize(Self)
		local Button = Self._Buttons

		for Value, Text in pairs(Self._Data) do
			Button.text = Text
			Button.value = Value
			Button.checked = Value == Self.selectedValue
			Button.arg1 = Self
			Button.arg2 = Value
			Button.func = CreateDropdown_Select

			if ( Self._Color ) then
				Button.colorCode = (Type(Self._Color) == "table") and Self._Color[Value] or Self._Color
			end

			if ( Self._Icon ) then
				Button.icon = Self._Icon

				if ( Self._IconCoord ) then
					local Coord = Self._IconCoord[Value]
					Button.tCoordLeft = Coord[1]
					Button.tCoordRight = Coord[2]
					Button.tCoordTop = Coord[3]
					Button.tCoordBottom = Coord[4]
				end
			end

			UIDropDownMenu_AddButton(Button)
		end
	end

	local function CreateDropdown_RefreshValue(Self)
		if ( Self.selectedValue ~= Self.value ) then
			UIDropDownMenu_Initialize(Self, CreateDropdown_Initialize)
			UIDropDownMenu_SetSelectedValue(Self, Self.value)
		end

		Self.newValue = Self.value -- Avoid GetValue error in OptionsPanelTemplates.
	end

	local function CreateSlider_OnValueChanged(Self, Value)
		Self.newValue = Value

		if ( Self._Set and Self._OnChange and Self.value ~= Value ) then Self:_Set(Value) end
		if ( Self._Display ) then Self.display:SetText(Self:_Display(Value)) end
	end

	local function Control_SetValue(Self, Value, SetFunc)
		if ( SetFunc or (Self._Set and ((Self._OnChange and Value == Self.value) or not Self._OnChange)) ) then
			if ( Self.type == CONTROLTYPE_CHECKBOX ) then
				Value = (Value ~= "0") and ToNumber(Value) or nil
			end

			Self:_Set(Value)
		end
	end

	local function Control_GetValue(Self)
		return Self.value
	end

	local function Control_ClearFocus(Self)
		Self:ClearFocus()
	end

	local function NamespaceSafe(Parent, Prefix) 
		Parent.ElementCount = (Parent.ElementCount or 0) + 1
		return Parent.name..Parent.ElementCount
	end

	local function ControlSetup(Control, Type, Void)
		local Panel = Control:GetParent()
		local ControlName = Control:GetName()
		Control.type = Type

		if ( not Void ) then
			BlizzardOptionsPanel_RegisterControl(Control, Panel)
		end

		if ( Type == CONTROLTYPE_CHECKBOX ) then
			Control.text = _G[ControlName.."Text"]
		elseif ( Type == CONTROLTYPE_SLIDER ) then
			Control.text = _G[ControlName.."Text"]
			Control.low = _G[ControlName.."Low"]
			Control.high = _G[ControlName.."High"]
		end

		BlizzardOptionsPanel_SetupControl(Control)
	end

	--[[

		OPTION PANEL LIB

	]]

	function TPT.CreateContainer(Parent, Backdrop, Width, Height, R, G, B, A)
		local Frame = CreateFrame("Frame", nil, Parent, "BackdropTemplate")
		Frame:SetBackdrop(Backdrop or BACKDROP_TOOLTIP_8_12_1111)
		Frame:SetBackdropColor(R or .25, G or .25, B or .25, A or .6)
		Frame:SetBackdropBorderColor(1, 1, 1, .5)
		Frame:SetSize(Width, Height)

		return Frame
	end

	function TPT.CreateText(Parent, Text, Template, Layer)
		local Font = Parent:CreateFontString(nil, Layer or "LOW", Template or "GameFontNormalLarge")
		Font:SetText(Text)

		return Font
	end

	function TPT.CreateTexture(Parent, Width, Height, File, Alpha)
		local Texture = Parent:CreateTexture()
		Texture:SetTexture(File or "Interface\\Tooltips\\UI-Tooltip-Background")
		Texture:SetSize(Width, Height)
		Texture:SetAlpha(Alpha or 1)

		return Texture
	end

	function TPT.CreateInput(Parent, Label, Tooltip, Width, Height)
		local Input = CreateFrame("EditBox", NamespaceSafe(Parent), Parent, "InputBoxTemplate")
		Input:SetSize(Width, Height)
		Input:SetAutoFocus(false)
		Input:SetScript("OnEnterPressed", Control_ClearFocus)

		if ( Label ) then
			Input.text = TPT.CreateText(Input, Label, "GameFontNormal")
			Input.text:SetPoint("BOTTOMLEFT", Input, "TOPLEFT", -3, 0)
		end

		Tooltip_Set(Input, Tooltip)

		return Input
	end

	function TPT.CreateButton(Parent, Text, Click, Tooltip, Width, Height)
		local Button = CreateFrame("Button", nil, Parent, "UIPanelButtonTemplate")
		Button:SetSize(Width or 120, Height or 22)
		Button:SetText(Text)

		Button._Click = Click
		Button:SetScript("OnClick", CreateButton_OnClick)

		Tooltip_Set(Button, Tooltip)

		return Button
	end

	function TPT.CreateDropdown(Parent, Label, Data, Get, Set, OnChange, Tooltip, Icon, IconCoord, Color, Width)
		local Dropdown = CreateFrame("Frame", NamespaceSafe(Parent), Parent, "UIDropDownMenuTemplate")

		Dropdown._Data = Data
		Dropdown._Get = Get
		Dropdown._Set = Set
		Dropdown._OnChange = OnChange
		Dropdown._Icon = Icon
		Dropdown._IconCoord = IconCoord
		Dropdown._Color = Color

		if ( Get ) then
			Dropdown.value = Dropdown:_Get()
			Dropdown.RefreshValue = CreateDropdown_RefreshValue
		end
		Dropdown.SetValue = CreateSlider_SetValue

		if ( Label ) then
			Dropdown.text = TPT.CreateText(Dropdown, Label, "GameFontNormal")
			Dropdown.text:SetPoint("BOTTOMLEFT", Dropdown, "TOPLEFT", 16, 3)
		end

		ControlSetup(Dropdown, CONTROLTYPE_DROPDOWN)

		Dropdown._Buttons = {}
		UIDropDownMenu_SetWidth(Dropdown, Width or 90)
		Dropdown:RefreshValue()
		if ( Dropdown._OnChange and Dropdown._Set ) then Dropdown:_Set(Dropdown.value) end

		Tooltip_Set(Dropdown, Tooltip)

		return Dropdown
	end

	function TPT.CreateSlider(Parent, Label, ValueMin, ValueMax, Step, TextMin, TextMax, Display, Get, Set, Tooltip, OnChange)
		local Slider = CreateFrame("Slider", NamespaceSafe(Parent), Parent, "OptionsSliderTemplate")

		Slider._Get = Get
		Slider._Set = Set
		Slider._OnChange = OnChange
		Slider._Display = Display

		Slider:SetMinMaxValues(ValueMin, ValueMax)
		Slider:SetValueStep(Step or 1)

		if ( Get ) then
			Slider.value = Get()
			Slider:SetValue(Slider.value)
		end

		if ( Display ) then
			Slider.display = TPT.CreateText(Slider, (Get) and Slider:_Display(Slider.value) or nil, "GameFontHighlightSmall")
			Slider.display:SetPoint("TOP", Slider, "CENTER", 0, -8)
		end

		ControlSetup(Slider, CONTROLTYPE_SLIDER, (not (Get and Set)))

		Slider:SetScript("OnValueChanged", CreateSlider_OnValueChanged)
		hooksecurefunc(Slider, "SetValue", Control_SetValue)

		if ( Label ) then
			Slider.text:SetTextColor(1, .82, 0)
			Slider.text:SetText(Label)
		end

		if ( TextMin ) then Slider.low:SetText(TextMin) end
		if ( TextMax ) then Slider.high:SetText(TextMax) end

		Slider.tooltipText = Tooltip

		return Slider
	end

	function TPT.CreateScroll(Parent)
		local Scroll = CreateFrame("ScrollFrame", NamespaceSafe(Parent), Parent, "UIPanelScrollFrameTemplate")
		local Child = CreateFrame("Frame", nil, Scroll)

		Child:SetSize(1, 1)
		Scroll:SetScrollChild(Child)

		return Scroll, Child
	end

	function TPT.CreateCheck(Parent, Label, Get, Set, Tooltip, OnChange)
		local Check = CreateFrame("CheckButton", NamespaceSafe(Parent), Parent, "OptionsCheckButtonTemplate")

		Check._Get = Get
		Check._Set = Set

		if ( Get ) then
			Check.value = Check:_Get() or 0
			Check.GetValue = Control_GetValue
		end

		ControlSetup(Check, CONTROLTYPE_CHECKBOX, (not (Get and Set)))

		if ( Set ) then
			Check.SetValue = Control_SetValue

			if ( OnChange ) then
				Check._OnChange = OnChange
				Check.setFunc = function(Value)
					Control_SetValue(Check, Value, 1)
				end
			end
		end

		Check.text:SetText(Label)
		Check.tooltipText = Tooltip

		return Check
	end
end