local AddOn, TPT, Private = select(2, ...):Init()

local Type = type
local ToNumber = tonumber
local Remove = table.remove
local Insert = table.insert
local TimerAfter = C_Timer.After
local GetSpellInfo = GetSpellInfo
local StringFormat = string.format
local GetSpellTexture = C_GetSpellTexture or GetSpellTexture

function TPT.Options()
	local _, AddonName = GetAddOnInfo(AddOn)

	if ( not TPTDB or TPT.Version ~= TPTDB.V ) then
		print(AddonName, ": Initialize")
		TPTDB = { Spells = TPT.Default.Spells, Position = {}, Scale = 1, OffY = 0, OffX = 0, SpaceX = 0, Glow = 1, World = 1, Arena = 1, Trinket = 1, V = TPT.Version }
	end
	TPT.DB = TPTDB

	-- Deprecated
	TPT.DB.Border = nil

	TPT:Locale()
	TPT.OptionPanel(AddonName, TPT.OptionOnLoad, "/tpt", "/pab")
end

function TPT.OptionOnLoad(Self, AddonName)
	TPT.OptionPanelHelper()

	local Panel = Self
	Panel.Default = function()end

	local Header, Parent, Attach, Lock,
	Display, Scale, Hidden, Glow, Fade, GrowLeft, Rows, Tooltip,
	Position, OffsetX, OffsetY, Padding,
	Zone, Arena, Dungeon, World,
	Ability, Trinket, Racial, Scroll, ScrollChild, Class, ClassTab, ClassAdd,
	Meta, MetaTitle, MetaError, MetaID, MetaCD, MetaEnable, MetaIndex, MetaButton1, MetaButton2

			--[[

				FUNC

			]]

			local function Update(Type, ID, Value)
				local GroupSubSize = GetNumSubgroupMembers()

				if ( ID ) then TPT.DB[ID] = Value end

				if ( GroupSubSize > 0 and Type ) then
					if ( Type == "Zone" ) then
						TPT:GROUP_ROSTER_UPDATE(Type)
					else
						for i=1, GroupSubSize do
							if ( TPT.Anchors[i] ) then
								if ( Type == "Icons" ) then
									TPT:IconUpdate(i)
								elseif ( Type == "Position" ) then
									TPT:AnchorUpdatePosition(i)
								else
									TPT:AnchorUpdate(i)
								end
							end
						end
					end
				end
			end

			local function FindAbilityByName(Data, Name)
				for i=1,#Data do
					local v = Data[i]
					if ( TPT.Default.SpellName[v[1]] == Name ) then
						return i, v
					end
				end
			end

			local function ClassChangeColors()
				local Color = {}
				for k,v in pairs(RAID_CLASS_COLORS) do
					Color[k] = "|c"..v.colorStr
				end

				return Color
			end

			local function ScrollBottom()
				Scroll:SetVerticalScroll(Scroll:GetVerticalScrollRange())
			end

			local function ClearFocus()
				MetaID:ClearFocus()
				MetaCD:ClearFocus()
			end

			local function UpdateLock()
				local Attach = TPT.DB.Attach
				Lock:Enable()

				if ( Lock:GetChecked() ~= Attach ) then
					Lock:Click()
				end

				if ( Attach ) then
					Lock:Disable()
					OffsetY:Enable()
					OffsetX:Enable()
				else
					OffsetX:Disable()
					OffsetY:Disable()
				end
			end

			local function ClassChangeButtonClick(Button)
				ScrollChild.Button = Button.Index
				Class._Set(nil, Class.selectedValue)
			end

			local function ClassChangeButtonCreate(Self, Index)
				local Buttons = Self.Data

				local Button = CreateFrame("Button", nil, Self)
				Button:SetNormalFontObject("GameFontNormalLeft")
				Button:SetSize(320, 30)

				local Texture = "Interface\\Tooltips\\UI-Tooltip-Background"
				Button:SetNormalTexture(Texture)
					local Normal = Button:GetNormalTexture()
					Normal:SetVertexColor(0, 0, 0, .3)
					Normal:SetDrawLayer("BACKGROUND", 1)

				Button:SetHighlightTexture(Texture)
				Button:GetHighlightTexture():SetVertexColor(1, 1, 1, .3)

				if ( Index == 1 ) then
					Button:SetPoint("TOPLEFT", Self, "TOPLEFT", 2, 0)
				else
					Button:SetPoint("TOP", Buttons[Index - 1], "BOTTOM", 0, -2)
				end

				Button.Index = Index
				Buttons[Index] = Button

				Button:SetScript("OnClick", ClassChangeButtonClick)

				return Button
			end

			local function ClassChangeUpdate(ClassName)
				ScrollChild.Data = ScrollChild.Data or {}

				local All = TPT.DB.Spells[ClassName]
				local Total = #All

				for Index=1, Total do
					local Data = All[Index]
					local Name, ID, CD, Status = TPT.Default.SpellName[Data[1]], Data[1], Data[2], Data[3]
					local Icon = GetSpellTexture(ID)
					local Button = ScrollChild.Data[Index] or ClassChangeButtonCreate(ScrollChild, Index)

					local Text = " |T"..Icon..":20|t "..Name
					if ( Status == false ) then
						Text = "|cff808080"..Text
					end
					Button:SetText(Text)

					if ( ScrollChild.Button == Index ) then
						Button:LockHighlight()
					else
						Button:UnlockHighlight()
					end

					Button:Show()
				end

				for Index=Total+1, #ScrollChild.Data do ScrollChild.Data[Index]:Hide() end
			end

			local function ClassAddClick(Self)
				ClearFocus()

				MetaTitle:SetText("|TInterface\\MINIMAP\\UI-Minimap-ZoomInButton-Up:22|t Add Ability")
				MetaError:SetText(nil)

				MetaID:SetAlpha(1)
				MetaID:EnableMouse(true)
				MetaID:SetText("")
				MetaCD:SetText("")
				MetaEnable:Hide()
				MetaIndex:Hide()

				MetaButton1:SetText("Add")
				MetaButton2:SetText("Cancel")

				if ( Self ) then
					ScrollChild.Button = nil
					ClassChangeUpdate(Class.selectedValue)
				end
			end

			local function ClassChangeEdit(ClassName)
				local Button = ScrollChild.Button
				local DataClass = TPT.DB.Spells[ClassName]
				local DataClassTotal = #DataClass
				local Data = DataClass[Button]
				if ( Data ) then
					local Name, ID, CD, Status = TPT.Default.SpellName[Data[1]], Data[1], Data[2], Data[3]

					MetaTitle:SetText("|T"..GetSpellTexture(ID)..":20|t  "..Name)
					MetaError:SetText(nil)

					MetaID:SetAlpha(0.5)
					MetaID:EnableMouse(false)
					MetaID:SetText(ID)
					MetaCD:SetText(CD)
					MetaEnable:Show()
					MetaEnable:SetChecked(Status == nil)
					MetaIndex:Show()

					MetaIndex:SetMinMaxValues(1, DataClassTotal)
					MetaIndex:SetValue(Button)
					MetaIndex.display:SetText(Button)
					MetaIndex.high:SetText(DataClassTotal)

					MetaButton1:SetText("Update")
					MetaButton2:SetText("Remove")

					ClearFocus()
				else
					ClassAddClick()
				end
			end

			local function ClassChange(Dropdown, ClassName)
				if ( Dropdown ) then
					Scroll:SetVerticalScroll(0)
					ScrollChild.Button = 1
				end

				ClassChangeUpdate(ClassName)
				ClassChangeEdit(ClassName)
			end

			local function MetaButtonClick(Self)
				local Button = Self:GetText()
				local Selected = Class.selectedValue

				ClearFocus()

				if ( Button == "Cancel" ) then
					ClassChange(1, Selected)
				else
					local ID = ToNumber(MetaID:GetText())
					local CD = ToNumber(MetaCD:GetText())
					local Name = (ID) and GetSpellInfo(ID)

					if ( Name and CD ) then
						local Data = TPT.DB.Spells[Selected]
						local Index = FindAbilityByName(Data, Name)

						if ( Button == "Remove" ) then
							Remove(Data, Index)
							TPT.Default.SpellName[ID] = nil
							if ( ScrollChild.Button ~= 1 ) then ScrollChild.Button = ScrollChild.Button - 1 end
							ClassChange(nil, Selected)
						else -- Add/Edit
							local New = not MetaIndex:IsShown()
							local NewIndex, Enabled

							if ( New ) then
								NewIndex = #Data+1
							else
								NewIndex = MetaIndex:GetValue()
								Remove(Data, Index)
								if ( not MetaEnable:GetChecked() ) then Enabled = false end
							end
							Insert(Data, NewIndex, {ID, CD, Enabled})

							ScrollChild.Button = NewIndex

							if ( New ) then
								TPT.Default.SpellName[ID] = Name
								ClassChange(nil, Selected)
								TimerAfter(.1, ScrollBottom)
							else
								ClassChangeUpdate(Selected)
							end
						end

						Update("All")
					else
						MetaError:SetText("Error: Invalid information.")
					end
				end
			end

			--[[

				INTERFACE

			]]

			--[[ HEADER ]]

			Header = TPT.CreateText(Panel, AddonName)
			Header:SetPoint("TOPLEFT", 16, -16)

			Parent = TPT.CreateContainer(Panel, nil, 600, 505)
			Parent:SetPoint("CENTER", Panel, "CENTER", 0, -18)
			Parent:SetFrameLevel(Panel:GetFrameLevel() - 1)

			-------------

			Attach = TPT.CreateCheck(Panel, "Frame Attach",
				function() return TPT.DB.Attach end,
				function(_, Value)
					TPT.DB.Attach = Value
					UpdateLock()
					Update("Position")
				end,
				"Attach to supported frames.",
				true)
			Attach:SetPoint("TOPRIGHT", Panel, "TOPRIGHT", -100, -12)

			Lock = TPT.CreateCheck(Panel, "Lock", 
				function() return TPT.DB.Lock end,
				function(_, Value) Update(nil, "Lock", Value) TPT.Anchors:Lock() end,
				"Lock position.",
				true)
			Lock:SetPoint("RIGHT", Attach, "LEFT", -50, 0)

			--[[ Display ]]

			Display = TPT.CreateContainer(Parent, nil, 580, 75)
			Display:SetPoint("TOP", Parent, "TOP", 0, -10)

			-------------

			Scale = TPT.CreateSlider(Panel, "Icon Size",
				.1, 5, .1,
				"", "",
				function(_, Value) return StringFormat("%.1f", Value) end,
				function() return TPT.DB.Scale end,
				function(_, Value) Update(nil, "Scale", Value) TPT.Icons:SetScale(TPT.DB.Scale) end,
				nil, true)
			Scale:SetPoint("LEFT", Display, "LEFT", 20, 0)

			Hidden = TPT.CreateCheck(Panel, "Hidden",
				function() return TPT.DB.Hidden end,
				function(_, Value) Update("Icons", "Hidden", Value) end,
				"Icon only when used.",
				true)
			Hidden:SetPoint("TOPLEFT", Scale, "TOPRIGHT", 75, 18)

			Glow = TPT.CreateCheck(Panel, "Glow",
				function() return TPT.DB.Glow end,
				function(_, Value) Update(nil, "Glow", Value) end,
				"Glow active icons.")
			Glow:SetPoint("LEFT", Hidden, "RIGHT", 100, 0)

			local Border -- Remove, here for search purposes.
			Fade = TPT.CreateCheck(Panel, "Fade",
				function() return TPT.DB.Fade end,
				function(_, Value) Update("All", "Fade", Value) end,
				"Fade icon on cooldown.",
				true)
			Fade:SetPoint("LEFT", Glow, "RIGHT", 100, 0)

			GrowLeft = TPT.CreateCheck(Panel, "Grow Left",
				function() return TPT.DB.Left end,
				function(_, Value) Update("Position", "Left", Value) Update("Icons") end,
				"Grow icons left.",
				true)
			GrowLeft:SetPoint("TOP", Hidden, "BOTTOM", 0, 0)

			Rows = TPT.CreateCheck(Panel, "Two Rows",
				function() return TPT.DB.Rows end,
				function(_, Value)
					Update("Icons", "Rows", Value)
				end,
				"Icons on two rows.",
				true)
			Rows:SetPoint("LEFT", GrowLeft, "RIGHT", 100, 0)

			Tooltip = TPT.CreateCheck(Panel, "Tooltip",
				function() return TPT.DB.Tooltip end,
				function(_, Value) Update(nil, "Tooltip", Value) end,
				"Tooltip on mouseover.",
				true)
			Tooltip:SetPoint("LEFT", Rows, "RIGHT", 100, 0)

			--[[ POSITION ]]

			Position = TPT.CreateContainer(Parent, nil, 580, 69)
			Position:SetPoint("TOP", Display, "BOTTOM", 0, -6)

			-------------

			OffsetX = TPT.CreateSlider(Panel, "Attach Offset: X",
				-50, 50, 1,
				"", "",
				function(_, Value) return Value end,
				function() return TPT.DB.OffX end,
				function(_, Value) Update("Position", "OffX", Value) end,
				nil, true)
			OffsetX:SetPoint("LEFT", Position, "LEFT", 50, 0)

			OffsetY = TPT.CreateSlider(Panel, "Attach Offset: Y",
				-50, 50, 1,
				"", "",
				function(_, Value) return Value end,
				function() return TPT.DB.OffY end,
				function(_, Value) Update("Position", "OffY", Value) end,
				nil, true)
			OffsetY:SetPoint("LEFT", OffsetX, "RIGHT", 20, 0)

			Padding = TPT.CreateSlider(Panel, "Icon Padding",
				0, 20, 1,
				"", "",
				function(_, Value) return Value end,
				function() return TPT.DB.SpaceX end,
				function(_, Value) Update("Icons", "SpaceX", Value) end,
				nil, true)
			Padding:SetPoint("LEFT", OffsetY, "RIGHT", 20, 0)

			--[[ ZONE ]]

			Zone = TPT.CreateContainer(Parent, nil, 580, 50)
			Zone:SetPoint("TOP", Position, "BOTTOM", 0, -6)

			-------------

			Arena = TPT.CreateCheck(Panel, "Arena",
				function() return TPT.DB.Arena end,
				function(_, Value) Update("Zone", "Arena", Value) end,
				"Display in Arena.",
				true)
			Arena:SetPoint("CENTER", Zone, "CENTER", -156, 0)

			Dungeon = TPT.CreateCheck(Panel, "Dungeon",
				function() return TPT.DB.Dungeon end,
				function(_, Value) Update("Zone", "Dungeon", Value) end,
				"Display in Dungeon.",
				true)
			Dungeon:SetPoint("LEFT", Arena, "RIGHT", 100, 0)

			World = TPT.CreateCheck(Panel, "World",
				function() return TPT.DB.World end,
				function(_, Value) Update("Zone", "World", Value) end,
				"Display in World.",
				true)
			World:SetPoint("LEFT", Dungeon, "RIGHT", 115, 0)

			--[[ ABILITY EDIT ]]

			Meta = TPT.CreateContainer(Parent, nil, 225, 220)
			Meta:SetPoint("BOTTOMRIGHT", Parent, "BOTTOMRIGHT", -10, 10)

			-------------

			MetaTitle = TPT.CreateText(Panel)
			MetaTitle:SetPoint("TOPLEFT", Meta, "TOPLEFT", 16, -15)
			MetaTitle:SetSize(200, 20)
			MetaTitle:SetJustifyH("LEFT")
			MetaTitle:SetNonSpaceWrap(true)

			MetaError = TPT.CreateText(Panel, nil, "GameFontRed")
			MetaError:SetPoint("TOPLEFT", MetaTitle, "BOTTOMLEFT", -1, -5)

			local MetaIDTooltip = "Abilities with same number are linked.\n\n|cFFe87117Example: Pummel will trigger Shield Bash.|r"
			for Class, Data in pairs(TPT.Default.Shared) do
				if ( Class ~= "CD" ) then
					MetaIDTooltip = MetaIDTooltip.."\n\n|r"..Class
					for Ability, Type in pairs(Data) do
						MetaIDTooltip = MetaIDTooltip.."\n  |cFFffffff"..Type.." - "..Ability
					end
				end
			end

			MetaID = TPT.CreateInput(Panel, "ID", MetaIDTooltip, 55, 25)
			MetaID:SetPoint("LEFT", Meta, "LEFT", 20, 20)
			MetaID:SetNumeric()
				

			MetaCD = TPT.CreateInput(Panel, "CD", "Cooldown in seconds.", 40, 25)
			MetaCD:SetPoint("LEFT", MetaID, "LEFT", 65, 0)
			MetaCD:SetNumeric()

			MetaEnable = TPT.CreateCheck(Panel, "Enable",
				nil, nil,
				"Enable/disable ability.")
			MetaEnable:SetPoint("LEFT", MetaCD, "LEFT", 45, 0)

			MetaIndex = TPT.CreateSlider(Panel, "Icon Position",
				1, 2, 1,
				"1", nil,
				function(_, Value) return Value end)
			MetaIndex:SetPoint("TOP", MetaCD, "BOTTOM", -15, -25)

			MetaButton1 = TPT.CreateButton(Panel, nil, nil, nil, 80)
			MetaButton1:SetPoint("BOTTOMLEFT", Meta, "BOTTOMLEFT", 12, 12)
			MetaButton1._Click = MetaButtonClick

			MetaButton2 = TPT.CreateButton(Panel, nil, nil, nil, 80)
			MetaButton2:SetPoint("BOTTOMRIGHT", Meta, "BOTTOMRIGHT", -12, 12)
			MetaButton2:SetNormalTexture(nil)
			MetaButton2:SetPushedTexture(nil)
			MetaButton2._Click = MetaButtonClick

			--[[ ABILITY LIST ]]

			Ability = TPT.CreateContainer(Parent, nil, 350, 220)
			Ability:SetPoint("BOTTOMLEFT", Parent, "BOTTOMLEFT", 10, 10)

			-------------

			Trinket = TPT.CreateCheck(Panel, "PvP Trinket",
				function() return TPT.DB.Trinket end,
				function(_, Value) Update("All", "Trinket", Value) end,
				"Show PvP Trinket.",
				true)
			Trinket:SetPoint("BOTTOMLEFT", Meta, "TOPRIGHT", -102, 0)

			Racial = TPT.CreateCheck(Panel, "Racial",
				function() return TPT.DB.Racial end,
				function(_, Value) Update("All", "Racial", Value) end,
				"Show Racial icon.",
				true)
			Racial:SetPoint("RIGHT", Trinket, "LEFT", -61, 0)

			-------------

			Scroll, ScrollChild = TPT.CreateScroll(Panel)
			Scroll:SetPoint("TOPLEFT", Ability, 4, -4)
			Scroll:SetPoint("BOTTOMRIGHT", Ability, -26, 4)

			Class = TPT.CreateDropdown(Panel, nil,
				LOCALIZED_CLASS_NAMES_MALE,
				function(Self) return Self.selectedValue or "DEATHKNIGHT" end,
				ClassChange,
				true, nil, nil, nil,
				ClassChangeColors())
			Class:SetPoint("BOTTOMLEFT", Ability, "TOPLEFT", 7, -8)

			ClassTab = Class:CreateTexture()
			ClassTab:SetTexture("Interface\\OptionsFrame\\UI-OptionsFrame-ActiveTab")
			ClassTab:SetPoint("CENTER", Class, "CENTER", 1, 2)
			ClassTab:SetSize(131, 28)

			ClassAdd = TPT.CreateButton(Panel, "|TInterface\\MINIMAP\\UI-Minimap-ZoomInButton-Up:16|t Add Ability",
				ClassAddClick,
				"Add ability to class.",
				80)
			ClassAdd:SetPoint("LEFT", Class, "RIGHT", 0, 3)
			ClassAdd:SetNormalTexture(nil)
			ClassAdd:SetPushedTexture(nil)

	UpdateLock()
end