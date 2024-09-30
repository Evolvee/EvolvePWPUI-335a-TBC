local _G = _G
local Select = select
local Sort = table.sort
local Upper = string.upper
local GetAddOnInfo = GetAddOnInfo

local Processor, DB, DBAddOn

local function Handler(Self, Event, AddOn)
	if ( Event == "ADDON_LOADED" ) then
		local Compat = DB[AddOn]
		if ( Compat ) then
			for Name, Value in pairs(Compat) do
				_G[Name] = (Value ~= "nil") and Value or nil
			end
		end
	else
		DB = nil
		DBAddOn = nil
		Self:UnregisterEvent(Event)
		Self:UnregisterEvent("ADDON_LOADED")
		Self:SetScript("OnEvent", nil)
	end
end

local function FindPreviousAddOn(AddOn)
	if ( not DBAddOn ) then
		local IsAddOnLoadOnDemand = IsAddOnLoadOnDemand
		local Count = 1

		DBAddOn = {}

		for i=1,GetNumAddOns() do
			local Name, _, _, Enabled = GetAddOnInfo(i)
			if ( Enabled and not IsAddOnLoadOnDemand(i) ) then
				DBAddOn[Count] = Name
				Count = Count + 1
			end
		end

		Sort(DBAddOn, function (a, b) return Upper(a) < Upper(b) end)
	end

	for i=1,#DBAddOn do
		if ( DBAddOn[i] == AddOn and i > 1 ) then
			return DBAddOn[i-1]
		end
	end
end

local function Process(AddOn, Mode, ...)
	local _, _, _, Enabled = GetAddOnInfo(AddOn)

	if ( Enabled ) then
		if ( Mode == "ALERT" ) then
			local Meta, Flag = ...

			if ( GetAddOnMetadata(AddOn, Meta) == Flag ) then
				local PopupID = "CAPI_ADDONCOMPAT_"..AddOn
				local URL = "https://gitlab.com/users/Tsoukie/projects"
				local Width, Height = 540, 200

				StaticPopupDialogs[PopupID] = {
					text = "ClassicAPI - Incompatible:\n\n|cffFFA500%s (%s)|r\n\nTo avoid issues please use version at:",
					button1 = CLOSE,
					timeout = 0,
					whileDead = true,
					hideOnEscape = false,
					showAlert =  true,
					hasEditBox = 1,
					hasWideEditBox = 1,
					OnShow = function (Self)
						Self:SetSize(Width, Height)
						Self.maxHeightSoFar = Height
						Self.maxWidthSoFar = Width

						local Edit = Self.wideEditBox
						Edit:SetWidth(300)
						Edit:SetText(URL)
						Edit:SetScript("OnTextChanged", function(S) S:SetText(URL) end)
					end,
				}

				StaticPopup_Show(PopupID, AddOn, Flag)
			end
		else
			if ( not Processor ) then
				DB = {}
				Processor = CreateFrame("Frame")
				Processor:SetScript("OnEvent", Handler)
				Processor:RegisterEvent("ADDON_LOADED")
				Processor:RegisterEvent("PLAYER_LOGIN")
			end

			if ( Mode == "NULL" ) then
				Process(FindPreviousAddOn(AddOn), "NULL_PROCESSED", ...)
			end

			local Compat = DB[AddOn]
			if ( not Compat ) then
				if ( Mode and DB[Mode] ) then
					DB[AddOn] = DB[Mode]
					return
				end

				Compat = {}
				DB[AddOn] = Compat
			end

			for i=1, Select("#", ...) do
				local Obj = Select(i, ...)
				Compat[Obj] = (Mode == "NULL_PROCESSED") and "nil" or _G[Obj]
			end
		end
	end
end

Process("WeakAuras", nil, "IsInGroup", "IsInRaid", "GetNumGroupMembers")
Process("Details", "WeakAuras", "IsInGroup", "IsInRaid", "GetNumGroupMembers")
Process("AI_VoiceOver", "NULL", "WOW_PROJECT_ID")
Process("Outfitter", "NULL", "UnitGetIncomingHeals")
Process("CompactRaidFrame", "ALERT", "Author", "RomanSpector & Blizzard")