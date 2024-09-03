currentSelections = {}
local function seticons()

	members = GetRealNumRaidMembers()
	
	if members == 0 then 
		return
	end 

	for i=1,(members-1) do 
		unitClass = select(2,UnitClass('party'..i))
		Icon = geticonnumber(unitClass)
		if Icon then 
			SetRaidTarget('party'..i,finalIcon)
			table.insert(currentSelections, finalIcon)
		end
	end 
	
	unitClass = select(2,UnitClass('player'))
	Icon = geticonnumber(unitClass)
	if Icon then 
		SetRaidTarget('player',Icon)
		table.insert(currentSelections, Icon)
	end
end
function geticonnumber(class)
	ci={WARRIOR=7,DEATHKNIGHT=3,PALADIN=3, PRIEST=8,SHAMAN=6,DRUID=2,ROGUE=1,MAGE=6,WARLOCK=3,HUNTER=4}
	iconBackups = {[7] = 2, [2] = 7, [8] = 5, [5] = 8, [6] = 5, [3] = 7}
	Icon = ci[class]
	finalIcon = 1
	if has_value(currentSelections, Icon) then
		if iconBackups[Icon] then 
			if has_value(currentSelections, iconBackups[Icon]) then 
				for n = 1, 10 do 
					if(not has_value(currentSelections, n)) then
						finalIcon = n
						return finalIcon
					end
				end
			else
				finalIcon = iconBackups[Icon]
				return finalIcon
			end
		else
			for v = 1, 10 do 
				if not has_value(currentSelections, v) then
					finalIcon = v
					return finalIcon
				end
			end
		end
	else
		finalIcon = Icon
		return finalIcon
	end
	return
end
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
local w = CreateFrame("Frame")
--w:RegisterEvent("ARENA_OPPONENT_UPDATE")
w:RegisterEvent("PARTY_MEMBER_ENABLE")
function w:OnEvent(event, ...)
    if event == "PARTY_MEMBER_ENABLE" and UnitIsPartyLeader("player") then
	currentSelections = {}
	seticons()
    end
end
w:SetScript("OnEvent", w.OnEvent)

