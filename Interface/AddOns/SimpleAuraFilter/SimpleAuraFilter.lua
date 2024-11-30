SimpleAuraFilter = LibStub("AceAddon-3.0"):NewAddon("SimpleAuraFilter", "AceEvent-3.0", "AceHook-3.0", "AceConsole-3.0")
local BUFFS_PER_ROW = 10
local BUFF_BUTTON_HEIGHT = 30
local BUFF_HORIZ_SPACING = -5

local defaults = {
    profile = {
        hiddenBuffs = {}
    }
}

function SimpleAuraFilter:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("SimpleAuraFilterDB", defaults, true)
    self:SetupOptions()
end

function SimpleAuraFilter:IsBuffNameBlocked(name)
    local found = false;
    table.foreach(self.db.profile.hiddenBuffs, function(index, blockedName)
        if (blockedName == name) then
            found = true;
        end
    end)
    return found;
end

local function New_BuffFrame_UpdateAllBuffAnchors()
    local buff, previousBuff, aboveBuff, index, name;
    local numBuffs = 0;
    local numAuraRows = 0;
    local slack = BuffFrame.numEnchants
    if (BuffFrame.numConsolidated > 0) then
        slack = slack + 1;    -- one icon for all consolidated buffs
    end

    for i = 1, BUFF_ACTUAL_DISPLAY do
        buff = _G["BuffButton" .. i];
        name = UnitBuff("player", i, "HELPFUL");
        if SimpleAuraFilter:IsBuffNameBlocked(name) then
            buff:ClearAllPoints()
            buff:SetPoint("TOPRIGHT", ConsolidatedBuffs, "TOPLEFT", 0, 10000);
        else
            if (buff.consolidated) then
                if (buff.parent == BuffFrame) then
                    buff:SetParent(ConsolidatedBuffsContainer);
                    buff.parent = ConsolidatedBuffsContainer;
                end
            else
                numBuffs = numBuffs + 1;
                index = numBuffs + slack;
                if (buff.parent ~= BuffFrame) then
                    buff.count:SetFontObject(NumberFontNormal);
                    buff:SetParent(BuffFrame);
                    buff.parent = BuffFrame;
                end
                buff:ClearAllPoints();
                if ((index > 1) and (mod(index, BUFFS_PER_ROW) == 1)) then
                    -- New row
                    if (index == BUFFS_PER_ROW + 1) then
                        buff:SetPoint("TOPRIGHT", ConsolidatedBuffs, "BOTTOMRIGHT", 0, -BUFF_ROW_SPACING);
                    else
                        buff:SetPoint("TOPRIGHT", aboveBuff, "BOTTOMRIGHT", 0, -BUFF_ROW_SPACING);
                    end
                    aboveBuff = buff;
                elseif (index == 1) then
                    numAuraRows = 1;
                    buff:SetPoint("TOPRIGHT", BuffFrame, "TOPRIGHT", 0, 0);
                    aboveBuff = buff;
                else
                    if (numBuffs == 1) then
                        if (BuffFrame.numEnchants > 0) then
                            buff:SetPoint("TOPRIGHT", "TemporaryEnchantFrame", "TOPLEFT", BUFF_HORIZ_SPACING, 0);
                            aboveBuff = TemporaryEnchantFrame;
                        else
                            buff:SetPoint("TOPRIGHT", ConsolidatedBuffs, "TOPLEFT", BUFF_HORIZ_SPACING, 0);
                        end
                    else
                        buff:SetPoint("RIGHT", previousBuff, "LEFT", BUFF_HORIZ_SPACING, 0);
                    end
                end
                previousBuff = buff;
            end
            if SimpleAuraFilter:IsBuffNameBlocked(name) then
                buff:SetAlpha(0);
            end
        end
    end
end

local function New_DebuffButton_UpdateAnchors(buttonName, index)
    local numBuffs = BUFF_ACTUAL_DISPLAY + BuffFrame.numEnchants;
    if (BuffFrame.numConsolidated > 0) then
        numBuffs = numBuffs - BuffFrame.numConsolidated + 1;
    end

    local rows = ceil(numBuffs / BUFFS_PER_ROW);
    local offsetY, previousBuff, name
    local numDebuffs = 0

    -- Position debuffs
    for i = 1, DEBUFF_MAX_DISPLAY do
        local buff = _G[buttonName .. i];
        if not buff then
            return
        end
        name = UnitDebuff("player", i, "HARMFUL");
        if SimpleAuraFilter:IsBuffNameBlocked(name) then
            buff:ClearAllPoints()
            buff:SetPoint("TOPRIGHT", ConsolidatedBuffs, "TOPLEFT", 0, 10000);
        else
            buff:ClearAllPoints()
            numDebuffs = numDebuffs + 1
            local index = numDebuffs
            if ((index > 1) and (mod(index, BUFFS_PER_ROW) == 1)) then
                -- New row
                buff:SetPoint("TOP", _G[buttonName .. (index - BUFFS_PER_ROW)], "BOTTOM", 0, -BUFF_ROW_SPACING);
            elseif (index == 1) then
                buff:SetPoint("TOPRIGHT", BuffFrame, "BOTTOMRIGHT", 0, -90);
            else
                buff:SetPoint("RIGHT", previousBuff, "LEFT", -5, 0);
            end
            previousBuff = buff
            if SimpleAuraFilter:IsBuffNameBlocked(name) then
                buff:SetAlpha(0);
            end
        end
    end
end

hooksecurefunc("BuffFrame_UpdateAllBuffAnchors", New_BuffFrame_UpdateAllBuffAnchors)
hooksecurefunc("DebuffButton_UpdateAnchors", New_DebuffButton_UpdateAnchors);
