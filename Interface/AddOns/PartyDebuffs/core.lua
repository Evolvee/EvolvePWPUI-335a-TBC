local BuffsPerRow = 4
local BuffRowSpacing = 4
local HorizontalSpacing = 2
local maxDebuffs = 8
local iconSize = 13
local xPos, yPos = 45, 6
local _G = getfenv(0)
local mod, UnitDebuff, DebuffTypeColor = _G.mod, _G.UnitDebuff, _G.DebuffTypeColor

local blacklist = {
    [GetSpellInfo(6788)] = true, -- Weakened Soul
    [GetSpellInfo(99)] = true, -- Demoralizing Roar
	[GetSpellInfo(1160)] = true, -- Demoralizing Shout
    [GetSpellInfo(16511)] = true, -- Hemorrhage
    [GetSpellInfo(33878)] = true, -- Mangle (Bear)
    [GetSpellInfo(33876)] = true, -- Mangle (Cat)
    [GetSpellInfo(26013)] = true, -- Deserter
    [GetSpellInfo(8647)] = true, -- Expose Armor
    [GetSpellInfo(6343)] = true, -- Thunder Clap
    [GetSpellInfo(29836)] = true, -- Blood Frenzy
}

local function UpdateDebuffs(frame, unit)
    local numAuraRows = 0
    local previousDebuff, aboveDebuff = nil, nil
    local lastIndex = 1
    local frameName, buffName, buffNameIcon
    local buffNameBorder, buffNameCooldown

    -- unregister og event
    if frame:IsEventRegistered("UNIT_AURA") then
        frame:UnregisterEvent("UNIT_AURA")
    end

    -- hide og buffs
    for i = 1,4 do
       local frame = _G[frame:GetName() .. "Debuff" .. i]
        if frame:IsShown() then
            frame:Hide() -- or SetAlpha(0) if it taints..
        end
    end

    -- create our own buffs
    for i = 1, maxDebuffs do
        local name, rank, tex, _, debuffType, duration, expirationTime = UnitDebuff(unit, i, "HARMFUL")

        if name and not blacklist[name] then
            frameName = frame:GetName() .. "DeBuff" .. lastIndex
            buffName = _G[frameName]

            if not buffName then
                if not tex then
                    break
                else
                    buffName = CreateFrame("Frame", frameName, frame, "TargetDebuffFrameTemplate")
                    buffName.unit = frame.unit
                end
            end
            if tex and (not maxDebuffs or lastIndex <= maxDebuffs) then
                buffName:SetID(i)

                -- Icon
                buffNameIcon = _G[frameName .. "Icon"]
                buffNameIcon:SetSize(iconSize, iconSize)
                buffNameIcon:SetTexture(tex)

                -- Positioning
                buffName:ClearAllPoints()
                if ((lastIndex > 1) and (mod(lastIndex, BuffsPerRow) == 1)) then
                    numAuraRows = numAuraRows + 1
                    buffName:SetPoint("TOPLEFT", aboveDebuff, "BOTTOMLEFT", 0, -BuffRowSpacing)
                    aboveDebuff = buffName
                elseif (lastIndex == 1) then
                    numAuraRows = 1
                    buffName:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", xPos, yPos)
                    aboveDebuff = buffName
                else
                    buffName:SetPoint("LEFT", previousDebuff, "RIGHT", HorizontalSpacing, 0)
                end

                -- Border
                buffNameBorder = _G[frameName .. "Border"]
                local color = debuffType and DebuffTypeColor[debuffType] or DebuffTypeColor["none"]
                buffNameBorder:SetVertexColor(color.r, color.g, color.b)

                -- Cooldown
                buffNameCooldown = _G[frameName .. "Cooldown"]
                if duration and expirationTime then
                    CooldownFrame_Set(buffNameCooldown, expirationTime - duration, duration, duration > 0, true)
                    buffNameCooldown:SetReverse(true)
                    buffNameCooldown:SetHideCountdownNumbers(true)
                else
                    CooldownFrame_Clear(buffNameCooldown)
                end

                -- show buff, set last visible index, remember prev buff for anchoring
                buffName:Show()
                lastIndex = lastIndex + 1
                previousDebuff = buffName
            else
                buffName:Hide()
            end
        end
    end

    for i = lastIndex, maxDebuffs do
        local dbf = _G[frame:GetName() .. "DeBuff" .. i]
        if dbf then
            dbf:Hide()
        end
    end
end

local gg = CreateFrame("Frame")
gg:RegisterEvent("UNIT_AURA")
gg:RegisterEvent("PLAYER_LOGIN")
gg:SetScript("OnEvent", function(self, event, arg1)
    if (event == "UNIT_AURA" and arg1:match("party%d")) then
        local nr = arg1:match("%d")
        local frame = _G["PartyMemberFrame" .. nr]
        if arg1 ~= frame.unit then return end
        UpdateDebuffs(frame, arg1)
    elseif event == "PLAYER_LOGIN" then
        C_Timer.After(2, function()
            for i = 1, 4 do
                local frame = _G["PartyMemberFrame" .. i]
                if frame then
                    frame:UnregisterEvent("UNIT_AURA")
                end
                for j = 1, 4 do
                    local debuffFrame = _G["PartyMemberFrame" .. i .. "Debuff" .. j]
                    if debuffFrame then
                        debuffFrame:SetAlpha(0)
                    end
                end
            end
        end)
    end
end)