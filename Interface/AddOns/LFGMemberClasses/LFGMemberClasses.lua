-- Inspired by https://www.curseforge.com/wow/addons/lfg_allmembers which doesn't work anymore
-- since the launch of ICC patch and the redesign of LFG tool

function LFGListUtil_SetSearchEntryTooltip2(tooltip, resultID, autoAcceptOption)
    local sri = C_LFGList.GetSearchResultInfo(resultID)
    local count = sri.numMembers

    if (count == 0) then
        return
    end

    tooltip:AddLine(" ")

    local members = {}

    for i = 1, count do
        local role, class, className = C_LFGList.GetSearchResultMemberInfo(resultID, i)
        local key = role .. "_" .. class

        if (members[key]) then
            members[key].count = members[key].count + 1
        else
            members[key] = {
                role = role,
                class = class,
                className = className,
                count = 1
            }
        end
    end

    local membersToSort = {}

    for i, v in pairs(members) do
        table.insert(membersToSort, {
            role = v.role,
            class = v.class,
            className = v.className,
            count = v.count
        })
    end

    table.sort(membersToSort, function(v1, v2)
        if (v1.role == v2.role) then
            return v1.class < v2.class
        end
        return v1.role > v2.role
    end)

    local icons = {
        TANK = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:0:19:22:41|t",
        HEALER = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:1:20|t",
        DAMAGER = "|TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:16:16:0:0:64:64:20:39:22:41|t",
    }

    for i, v in ipairs(membersToSort) do
        local c = RAID_CLASS_COLORS[v.class]
        local str = icons[v.role] .. " |c" .. c.colorStr .. v.className

        if (v.count > 1) then
            str = str .. " |cFFFFFFFF(" .. v.count .. ")"
        end

        tooltip:AddLine(str)
    end

    tooltip:Show()
end

local lfgmcFrame = CreateFrame("Frame", "lfgmcFrame")
lfgmcFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
lfgmcFrame:SetScript("OnEvent", function(self, event, ...)
    hooksecurefunc("LFGListUtil_SetSearchEntryTooltip", LFGListUtil_SetSearchEntryTooltip2)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end)