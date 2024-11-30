-- AddonUsage 1.1
-- This is a simple mod to display comparative memory and cpu usage of addons.
-- 1.1 4/10/09 belated fix for scrollbar change in 3.02
-- 1.0 7/14/08 initial release


AddonUsage = {
	List = {}, -- numerically-indexed table that stores current addon usage
	Loaded = {}, -- string-indexed table of addons that already have a list entry
	Profile = nil, -- 1 if CPU profile enabled, nil if not
}

AddonUsageSettings = {
	SortBy = "Name", -- "Name", "Mem", "CPU"
	SortDir = 0 -- 1 descending, 0 ascending
}

BINDING_HEADER_ADDONUSAGE = "AddonUsage"

function AddonUsage.Toggle()
	if AddonUsageFrame:IsVisible() then
		AddonUsageFrame:Hide()
	else
		AddonUsage.UpdateData()
		AddonUsageFrame:Show()
	end
end

function AddonUsage.Initialize()
	table.insert(UISpecialFrames,"AddonUsageFrame")
	SlashCmdList["ADDONUSAGE"] = AddonUsage.Toggle
	SLASH_ADDONUSAGE1 = "/addonusage"
	SLASH_ADDONUSAGE2 = "/usage"
	AddonUsageProfileCheckText:SetText("Profile CPU")
	AddonUsage.Profile = GetCVar("scriptProfile")=="1" and 1 or nil
	if AddonUsage.Profile then
		ResetCPUUsage()
		AddonUsageProfileCheck:SetChecked(1)
	else
		AddonUsageResetButton:Hide()
		AddonUsageHeaderCPU:Hide()
		for i=1,12 do
			getglobal("AddonUsageList"..i.."Name"):SetWidth(117)
			getglobal("AddonUsageList"..i.."CPU"):SetWidth(1)
		end
	end
	AddonUsage.UpdateData()
end

function AddonUsage.UpdateData()
	if AddonUsage.Profile then
		UpdateAddOnCPUUsage()
	end
	UpdateAddOnMemoryUsage()

	-- populate list of enabled and loaded addons
	local list = AddonUsage.List
	local loaded = AddonUsage.Loaded
	local name,enabled
	for i=1,GetNumAddOns() do
		name,_,_,enabled = GetAddOnInfo(i)
		if enabled and IsAddOnLoaded(name) and not loaded[name] then
			loaded[name] = 1
			table.insert(list,{Name=name,Mem=0,MemPercent=0,CPU=0})
		end
	end

	-- gather stats for each addon and running totals
	local totalMem = 0
	local totalCPU = 0
	for i=1,#(list) do
		list[i].Mem = GetAddOnMemoryUsage(list[i].Name)
		totalMem = totalMem + list[i].Mem
		if AddonUsage.Profile then
			list[i].CPU = GetAddOnCPUUsage(list[i].Name)
			totalCPU = totalCPU + list[i].CPU
		end
	end

	-- calculate percentages for mem and cpu for each addon
	for i=1,#(list) do
		if totalMem>0 then
			list[i].MemPercent = math.floor((list[i].Mem / totalMem)*100)
		end
		if totalCPU>0 then
			list[i].CPU = math.floor((list[i].CPU / totalCPU)*100)
		end
	end

	-- sort based on sort criterea
	table.sort(list,AddonUsage.Sort)

	-- format list entries for display
	for i=1,#(list) do
		if list[i].Mem>9000 then
			list[i].Mem = string.format("%.2fMb",list[i].Mem/1024) -- list very large mods in MB
		else
			list[i].Mem = string.format("%.1fkb",list[i].Mem) -- list rest in KB
		end
		list[i].MemPercent = string.format("%d%%",list[i].MemPercent)
		if totalCPU>0 then
			list[i].CPU = string.format("%d%%",list[i].CPU)
		end
	end

	-- update scrollframe list
	AddonUsage.ScrollFrameUpdate()

end

function AddonUsage.Sort(e1,e2)
	local by = AddonUsageSettings.SortBy
	if AddonUsageSettings.SortDir==1 then
		if e1[by] and e2[by] and e1[by]>e2[by] then return 1 else return nil end
	else
		if e1[by] and e2[by] and e1[by]<e2[by] then return 1 else return nil end
	end
end

function AddonUsage.HeaderOnClick(sortby)
	if AddonUsageSettings.SortBy == sortby then
		AddonUsageSettings.SortDir = 1-AddonUsageSettings.SortDir
	else
		AddonUsageSettings.SortBy = sortby
		AddonUsageSettings.SortDir = (sortby=="Name" and 0) or 1
	end
	AddonUsage.UpdateData()
end

function AddonUsage.ScrollFrameUpdate()

	local offset = FauxScrollFrame_GetOffset(AddonUsageScrollFrame)
	local idx
	local list = AddonUsage.List

	FauxScrollFrame_Update(AddonUsageScrollFrame, #(list), 12, 16)

	for i=1,12 do
		idx = offset + i
		if idx<=#(list) then
			getglobal("AddonUsageList"..i.."Name"):SetText(list[idx].Name)
			getglobal("AddonUsageList"..i.."Mem"):SetText(list[idx].Mem)
			getglobal("AddonUsageList"..i.."MemPercent"):SetText(list[idx].MemPercent)
			getglobal("AddonUsageList"..i.."CPU"):SetText(list[idx].CPU)
			getglobal("AddonUsageList"..i):Show()
		else
			getglobal("AddonUsageList"..i):Hide()
		end

	end
end

function AddonUsage.ProfileCheckOnClick()
	local newValue = AddonUsageProfileCheck:GetChecked()
	if newValue ~= AddonUsage.Profile then
		AddonUsageProfileCheck:Disable()
		if newValue then
			StaticPopupDialogs["ADDONUSAGEPROFILE"] = { text="CPU Profiling causes overhead that will affect performance/loss of fps while it is enabled.  Do you want to turn CPU Profiling on and reload the UI?",
				button1="Yes", button2="No", timeout=0, whileDead=1,
				OnAccept=function() SetCVar("scriptProfile",1) ReloadUI() end,
				OnCancel=function() AddonUsageProfileCheck:Enable() AddonUsageProfileCheck:SetChecked(0) end
			}
		else
			StaticPopupDialogs["ADDONUSAGEPROFILE"] = { text = "Turn off CPU Profiling and reload the UI?",
				button1="Yes", button2="No", timeout=0, whileDead=1,
				OnAccept=function() SetCVar("scriptProfile",0) ReloadUI() end,
				OnCancel=function() AddonUsageProfileCheck:Enable() AddonUsageProfileCheck:SetChecked(1) end
			}
		end
		StaticPopup_Show("ADDONUSAGEPROFILE")
	end
end