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

local function Process(AddOn, Ref, Incognito, ...)
	local _, _, _, Enabled = GetAddOnInfo(AddOn)

	if ( Enabled ) then
		if ( not Processor ) then
			DB = {}
			Processor = CreateFrame("Frame")
			Processor:SetScript("OnEvent", Handler)
			Processor:RegisterEvent("ADDON_LOADED")
			Processor:RegisterEvent("PLAYER_LOGIN")
		end

		if ( Incognito ) then
			Process(FindPreviousAddOn(AddOn), Ref, false, ...)
		end

		local Compat = DB[AddOn]
		if ( not Compat ) then
			if ( Ref and DB[Ref] ) then
				DB[AddOn] = DB[Ref]
				return
			end

			Compat = {}
			DB[AddOn] = Compat
		end

		for i=1, Select("#", ...) do
			local Obj = Select(i, ...)
			Compat[Obj] = (Incognito == false) and "nil" or _G[Obj]
		end
	end
end

-- COMPATIBILITY
Process("WeakAuras", nil, nil, "IsInGroup", "IsInRaid", "GetNumGroupMembers")
Process("Details", "WeakAuras", nil, "IsInGroup", "IsInRaid", "GetNumGroupMembers")
Process("AI_VoiceOver", nil, true, "WOW_PROJECT_ID")