local AddonName = "DeBuffFilter"

local DeBuffFilter = LibStub:NewLibrary(AddonName, 8)
local MAX_TARGET_DEBUFFS = 16
local MAX_TARGET_BUFFS = 32
local AURA_START_Y = 32
local AURA_START_X = 5
local mabs, pairs, mfloor = math.abs, pairs, math.floor
local _G = getfenv(0)
local UnitBuff, UnitDebuff = _G.UnitBuff, _G.UnitDebuff
local UnitIsUnit, UnitIsOwnerOrControllerOfUnit, UnitIsFriend = _G.UnitIsUnit, _G.UnitIsOwnerOrControllerOfUnit, _G.UnitIsFriend
local IsAddOnLoaded = C_AddOns.IsAddOnLoaded or IsAddOnLoaded
local GetAddOnInfo = C_AddOns.GetAddOnInfo or GetAddOnInfo

local defaults = {
    profile = {
        hiddenBuffs = {},
        selfSize = 21,
        otherSize = 17,
        auraWidth = 122,
        verticalSpace = 1,
        horizontalSpace = 3,
        customHighlights = {},
        customHighlightColors = {},
    }
}

function DeBuffFilter:AddCustomHighlightOptions()
    local new_args = {}

    for _, buff in ipairs(self.db.profile.customHighlights) do
        new_args["highlight_" .. buff] = {
            type = "group",
            name = buff,
            args = {
                delete = {
                    order = 1,
                    type = "execute",
                    name = "Delete",
                    func = function()
                        local cur_index = 0
                        for i, value in ipairs(self.db.profile.customHighlights) do
                            if value == buff then
                                cur_index = i
                                break
                            end
                        end
                        if cur_index > 0 then
                            table.remove(self.db.profile.customHighlights, cur_index)
                            self.db.profile.customHighlightColors[buff] = nil
                            self.options.args.highlightBuffs.args.buffList.args = self:AddCustomHighlightOptions()
                        end
                    end
                },
                color = {
                    order = 2,
                    type = "color",
                    name = "Color",
                    get = function(info)
                        local color = self.db.profile.customHighlightColors[buff]
                        if not color then
                            color = { r = 1, g = 1, b = 1, a = 1 }
                            self.db.profile.customHighlightColors[buff] = color
                        end
                        return color.r, color.g, color.b, color.a
                    end,
                    set = function(info, r, g, b, a)
                        self.db.profile.customHighlightColors[buff] = { r = r, g = g, b = b, a = a }
                        TargetFrame_UpdateAuras(TargetFrame)
                        TargetFrame_UpdateAuras(FocusFrame)
                    end,
                }
            }
        }
    end

    return new_args
end

function DeBuffFilter:SetupOptions()
    self.db = LibStub("AceDB-3.0"):New("DeBuffFilterDB", defaults, true)

    self.options = {
        type = "group",
        childGroups = "tab",
        plugins = {},
        args = {
            author = {
                name = "|cff4693E6Author:|r Xyz - discord.gg/CtxPasSQnQ",
                type = "description"
            },
            version = {
                name = "|cff4693E6Version:|r " .. C_AddOns.GetAddOnMetadata("DeBuffFilter", "Version") .. "\n",
                type = "description"
            },
            moreoptions = {
                name = "Hide Auras",
                type = "group",
                order = 1,
                args = {
                    buffNameInput = {
                        order = 1,
                        width = 1.5,
                        name = "Add (De)Buff By Name / Spell Id",
                        desc = "Type the name or spell id of a (de)buff to hide",
                        type = "input",
                        set = function(info, val)
                            if tonumber(val) then
                                val = select(1, GetSpellInfo(val))
                            end

                            for _, value in ipairs(self.db.profile.hiddenBuffs) do
                                if value == val then
                                    return
                                end
                            end
                            table.insert(self.db.profile.hiddenBuffs, val);
                            table.sort(self.db.profile.hiddenBuffs)
                            TargetFrame_UpdateAuras(TargetFrame);
                            TargetFrame_UpdateAuras(FocusFrame);
                        end,
                    },
                    buffList = {
                        order = 3,
                        width = 1,
                        name = "Hidden Auras:",
                        type = "multiselect",
                        values = self.db.profile.hiddenBuffs,
                        get = function(info, val)
                            return true;
                        end,
                        set = function(info, val)
                            table.remove(self.db.profile.hiddenBuffs, val);
                        end,
                        confirm = function(info, val, v2)
                            return "Delete " .. self.db.profile.hiddenBuffs[val] .. "?"
                        end
                    },
                },
            },
            sizeoptions = {
                name = "Resizer",
                type = "group",
                order = 2,
                args = {
                    selfSize = {
                        order = 1,
                        width = 2,
                        name = "My Debuffs/Buffs size",
                        desc = "Resize your own (de)buffs displayed on target",
                        type = "range",
                        min = 17,
                        max = 34,
                        step = 1,
                        get = function(info, val)
                            return self.db.profile.selfSize
                        end,
                        set = function(info, val)
                            self.db.profile.selfSize = val
                            TargetFrame_UpdateAuras(TargetFrame);
                            TargetFrame_UpdateAuras(FocusFrame);
                        end

                    },
                    otherSize = {
                        order = 2,
                        width = 2,
                        name = "Others Debuffs/Buffs size",
                        desc = "Resize the (de)buffs casted by others that are displayed on target",
                        type = "range",
                        min = 17,
                        max = 34,
                        step = 1,
                        get = function(info, val)
                            return self.db.profile.otherSize
                        end,
                        set = function(info, val)
                            self.db.profile.otherSize = val
                            TargetFrame_UpdateAuras(TargetFrame);
                            TargetFrame_UpdateAuras(FocusFrame);
                        end
                    },
                    auraWidth = {
                        order = 3,
                        width = 2,
                        name = "Aura row width",
                        desc = "How many auras do you want per row?",
                        type = "range",
                        min = 108,
                        max = 178,
                        step = 14,
                        get = function(info, val)
                            return self.db.profile.auraWidth
                        end,
                        set = function(info, val)
                            self.db.profile.auraWidth = val
                            TargetFrame_UpdateAuras(TargetFrame);
                            TargetFrame_UpdateAuras(FocusFrame);
                        end
                    },
                    verticalSpacing = {
                        order = 4,
                        width = 2,
                        name = "Vertical spacing",
                        desc = "The spacing between aura rows",
                        type = "range",
                        min = 1,
                        max = 50,
                        step = 1,
                        get = function(info, val)
                            return self.db.profile.verticalSpace
                        end,
                        set = function(info, val)
                            self.db.profile.verticalSpace = val
                            TargetFrame_UpdateAuras(TargetFrame);
                            TargetFrame_UpdateAuras(FocusFrame);
                        end
                    },
                    horizontalSpacing = {
                        order = 5,
                        width = 2,
                        name = "Horizontal spacing",
                        desc = "The spacing between auras",
                        type = "range",
                        min = 3,
                        max = 35,
                        step = 1,
                        get = function(info, val)
                            return self.db.profile.horizontalSpace
                        end,
                        set = function(info, val)
                            self.db.profile.horizontalSpace = val
                            TargetFrame_UpdateAuras(TargetFrame);
                            TargetFrame_UpdateAuras(FocusFrame);
                        end
                    },
                },
            },
            highlightBuffs = {
                type = "group",
                name = "Custom Highlights",
                childGroups = "tree",
                order = 3,
                args = {
                    buffNameInput = {
                        order = 1,
                        width = 1.5,
                        name = "Add (De)Buff By Name / Spell Id",
                        desc = "Type the name or spell id of a (de)buff to custom highlight",
                        type = "input",
                        set = function(info, val)
                            if tonumber(val) then
                                val = select(1, GetSpellInfo(val))
                            end

                            for _, value in ipairs(self.db.profile.customHighlights) do
                                if value == val then
                                    return
                                end
                            end

                            table.insert(self.db.profile.customHighlights, val)
                            table.sort(self.db.profile.customHighlights)
                            self.db.profile.customHighlightColors[val] = { r = 1, g = 1, b = 1, a = 1 }

                            self.options.args.highlightBuffs.args.buffList.args = self:AddCustomHighlightOptions()
                        end,
                    },
                    buffList = {
                        order = 2,
                        width = 1,
                        name = "Buff List",
                        type = "group",
                        args = DeBuffFilter:AddCustomHighlightOptions()
                    },
                },
            },
        },
    }

    local options = {
        name = "DeBuffFilter    ",
        type = "group",
        args = {
            load = {
                name = "Load configuration",
                desc = "Load configuration options",
                type = "execute",
                func = function()
                    HideUIPanel(SettingsPanel)
                    LibStub("AceConfigDialog-3.0"):Open("DeBuffFilter")
                end,
            },
        },
    }

    self.options.plugins.profiles = { profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) }
    LibStub("AceConfig-3.0"):RegisterOptionsTable(AddonName .. "_blizz", options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddonName .. "_blizz", "|cff4693E6DeBuffFilter|r")
    LibStub("AceConfig-3.0"):RegisterOptionsTable(AddonName, self.options)
    LibStub("AceConsole-3.0"):RegisterChatCommand("dbf", function() HideUIPanel(SettingsPanel) LibStub("AceConfigDialog-3.0"):Open("DeBuffFilter") end)
end

function DeBuffFilter:Blacklisted(name)
    local val = false
    for _, blockedName in pairs(self.db.profile.hiddenBuffs) do
        if blockedName == name then
            val = true
            break
        end
    end
    return val
end

function DeBuffFilter:RFBuffs(name)
    local val = false
    for _, blockedName in pairs(self.db.profile.hiddenRaidAuras) do
        if blockedName == name then
            val = true
            break
        end
    end
    return val
end

local function hookCastBar(frame)
    local parentFrame = frame:GetParent()
    if frame.isMoving then return end
    if parentFrame.auraRowz == nil then
        parentFrame.auraRowz = 0
    end
    frame.isMoving = true
    frame:ClearAllPoints()
    if ( frame.boss ) then
        frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 25, 10 );
    elseif ( parentFrame.haveToT ) then
        if parentFrame.buffsOnTop or (parentFrame.auraRowz <= 1) then
            frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 25, -21 );
        else
            frame:SetPoint("TOPLEFT", parentFrame.spellbarAnchorz, "BOTTOMLEFT", 20, -15);
        end
    elseif ( parentFrame.haveElite ) then
        if ( parentFrame.buffsOnTop or parentFrame.auraRowz <= 1 ) then
            frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 25, -5 );
        else
            frame:SetPoint("TOPLEFT", parentFrame.spellbarAnchorz, "BOTTOMLEFT", 20, -15);
        end
    else
        if ( (not parentFrame.buffsOnTop) and parentFrame.auraRowz > 0 ) then
            frame:SetPoint("TOPLEFT", parentFrame.spellbarAnchorz, "BOTTOMLEFT", 20, -15);
        else
            frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 25, 7 );
        end
    end
    frame.isMoving = false
end

local PLAYER_UNITS = {
    player = true,
    vehicle = true,
    pet = true,
};

local function ShouldAuraBeLarge(caster)
    if not caster then
        return false;
    end

    for token, value in pairs(PLAYER_UNITS) do
        if UnitIsUnit(caster, token) or UnitIsOwnerOrControllerOfUnit(token, caster) then
            return value;
        end
    end
end

local function RealWidth(frame, auraName, width)
    if not auraName then
        return
    end

    local x1 = frame.totFrame:GetLeft()
    local x2 = _G[auraName .. "1"]:GetLeft()
    if not x1 or not x2 then
        return frame.TOT_AURA_ROW_WIDTH
    end

    local diff = mabs(x2 - x1)
    local distance = mfloor(diff) + 2 -- cheat a bit

    if distance > 136 then
        -- let user regulate when ToTo is in Africa
        return width
    else
        return distance
    end
end

local function maxRows(self, width, mirror, auraName)
    local haveTargetofTarget

    if self.totFrame ~= nil then
        haveTargetofTarget = self.totFrame:IsShown();
    end

    if (haveTargetofTarget and self.auraRowz <= 2) and not mirror then
        return RealWidth(self, auraName, width)
    else
        return width
    end
end

local function UpdateBuffAnchor(self, buffName, index, numDebuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically, firstShown, newRow)
    --For mirroring vertically
    local point, relativePoint;
    local startY, auraOffsetY;
    if (mirrorVertically) then
        point = "BOTTOM";
        relativePoint = "TOP";
        startY = -15;
        if (self.threatNumericIndicator:IsShown()) then
            startY = startY + self.threatNumericIndicator:GetHeight();
        end
        offsetY = -offsetY;
        auraOffsetY = -DeBuffFilter.db.profile.verticalSpace;
    else
        point = "TOP";
        relativePoint = "BOTTOM";
        startY = AURA_START_Y;
        auraOffsetY = DeBuffFilter.db.profile.verticalSpace;
    end

    local buff = _G[buffName .. index];
    if (index == 1) or firstShown then
        if (UnitIsFriend("player", self.unit) or numDebuffs == 0) then
            -- unit is friendly or there are no debuffs...buffs start on top
            buff:ClearAllPoints()
            buff:SetPoint(point .. "LEFT", self, relativePoint .. "LEFT", AURA_START_X, startY);
        else
            -- unit is not friendly and we have debuffs...buffs start on bottom
            buff:ClearAllPoints()
            buff:SetPoint(point .. "LEFT", self.debuffz, relativePoint .. "LEFT", 0, -offsetY);
        end
        self.buffz:ClearAllPoints()
        self.buffz:SetPoint(point .. "LEFT", buff, point .. "LEFT", 0, 0);
        self.buffz:SetPoint(relativePoint .. "LEFT", buff, relativePoint .. "LEFT", 0, -auraOffsetY);
        self.spellbarAnchorz = buff;
    elseif newRow then
        buff:ClearAllPoints()
        buff:SetPoint(point .. "LEFT", _G[buffName .. anchorIndex], relativePoint .. "LEFT", 0, -offsetY);
        self.buffz:ClearAllPoints()
        self.buffz:SetPoint(relativePoint .. "LEFT", buff, relativePoint .. "LEFT", 0, -auraOffsetY);
        self.spellbarAnchorz = buff;
    else
        buff:ClearAllPoints()
        if buff ~= _G[buffName .. anchorIndex] then
            buff:SetPoint(point .. "LEFT", _G[buffName .. anchorIndex], point .. "RIGHT", offsetX, 0);
        end
    end

    -- Resize
    buff:SetWidth(size);
    buff:SetHeight(size);
end

local function UpdateDebuffAnchor(self, debuffName, index, numBuffs, anchorIndex, size, offsetX, offsetY, mirrorVertically, firstShown, newRow)
    local buff = _G[debuffName .. index];
    local isFriend = UnitIsFriend("player", self.unit);

    --For mirroring vertically
    local point, relativePoint;
    local startY, auraOffsetY;
    if (mirrorVertically) then
        point = "BOTTOM";
        relativePoint = "TOP";
        startY = -15;
        if (self.threatNumericIndicator:IsShown()) then
            startY = startY + self.threatNumericIndicator:GetHeight();
        end
        offsetY = -offsetY;
        auraOffsetY = -DeBuffFilter.db.profile.verticalSpace;
    else
        point = "TOP";
        relativePoint = "BOTTOM";
        startY = AURA_START_Y;
        auraOffsetY = DeBuffFilter.db.profile.verticalSpace;
    end

    if (index == 1) or firstShown then
        if (isFriend and numBuffs > 0) then
            -- unit is friendly and there are buffs...debuffs start on bottom
            buff:ClearAllPoints()
            buff:SetPoint(point .. "LEFT", self.buffz, relativePoint .. "LEFT", 0, -offsetY);
        else
            -- unit is not friendly or there are no buffs...debuffs start on top
            buff:ClearAllPoints()
            buff:SetPoint(point .. "LEFT", self, relativePoint .. "LEFT", AURA_START_X, startY);
        end
        self.debuffz:ClearAllPoints()
        self.debuffz:SetPoint(point .. "LEFT", buff, point .. "LEFT", 0, 0);
        self.debuffz:SetPoint(relativePoint .. "LEFT", buff, relativePoint .. "LEFT", 0, -auraOffsetY);
        if ((isFriend) or (not isFriend and numBuffs == 0)) then
            self.spellbarAnchorz = buff;
        end
    elseif newRow then
        buff:ClearAllPoints()
        buff:SetPoint(point .. "LEFT", _G[debuffName .. anchorIndex], relativePoint .. "LEFT", 0, -offsetY);
        self.debuffz:ClearAllPoints()
        self.debuffz:SetPoint(relativePoint .. "LEFT", buff, relativePoint .. "LEFT", 0, -auraOffsetY);
        if ((isFriend) or (not isFriend and numBuffs == 0)) then
            self.spellbarAnchorz = buff;
        end
    else
        buff:ClearAllPoints()
        buff:SetPoint(point .. "LEFT", _G[debuffName .. anchorIndex], point .. "RIGHT", offsetX, 0);
    end

    -- Resize
    buff:SetWidth(size);
    buff:SetHeight(size);
    local debuffFrame = _G[debuffName .. index .. "Border"];
    if debuffFrame then
        debuffFrame:SetWidth(size + 2);
        debuffFrame:SetHeight(size + 2);
    end
end

local function updatePositions(frame, auraName, numAuras, numOppositeAuras, updateFunc, offsetX, mirrorAurasVertically)
    local LARGE_AURA_SIZE = DeBuffFilter.db.profile.selfSize
    local SMALL_AURA_SIZE = DeBuffFilter.db.profile.otherSize
    local maxRowWidth = DeBuffFilter.db.profile.auraWidth
    local offsetY = DeBuffFilter.db.profile.verticalSpace
    local size
    local rowWidth = 0
    local firstBuffOnRow = 1
    local firstShown = true
    local lastIndex = 1

    -- illegal frames
    if not frame.buffz then
        frame.buffz = CreateFrame("Frame", frame:GetName() .. "Buffz", frame)
        frame.buffz:SetSize(10, 10)
    end
    if not frame.debuffz then
        frame.debuffz = CreateFrame("Frame", frame:GetName() .. "Debuffz", frame)
        frame.debuffz:SetSize(10, 10)
    end

    for i = 1, numAuras do
        local buffName, icon, caster, debuffType, _
        if updateFunc == UpdateBuffAnchor then
            buffName, icon, _, debuffType, _, _, caster = UnitBuff(frame.unit, i, "HELPFUL")
        else
            buffName, icon, _, debuffType, _, _, caster = UnitDebuff(frame.unit, i, "HARMFUL")
        end
        if buffName and icon then
            local dbf = _G[auraName .. i]
            if not DeBuffFilter:Blacklisted(buffName) then
                if not dbf:IsShown() then
                    dbf:Show()
                end
                if ShouldAuraBeLarge(caster) then
                    size = LARGE_AURA_SIZE
                    offsetY = DeBuffFilter.db.profile.verticalSpace + DeBuffFilter.db.profile.verticalSpace
                else
                    size = SMALL_AURA_SIZE
                end

                if (i == 1) or firstShown then
                    rowWidth = size;
                    frame.auraRowz = frame.auraRowz + 1;
                    firstBuffOnRow = i
                else
                    rowWidth = rowWidth + size + offsetX;
                end

                if rowWidth > maxRows(frame, maxRowWidth, mirrorAurasVertically, auraName) then
                    updateFunc(frame, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY, mirrorAurasVertically, firstShown, true)
                    rowWidth = size;
                    frame.auraRowz = frame.auraRowz + 1;
                    firstBuffOnRow = i
                    offsetY = DeBuffFilter.db.profile.verticalSpace;
                else
                    updateFunc(frame, auraName, i, numOppositeAuras, lastIndex, size, offsetX, offsetY, mirrorAurasVertically, firstShown, false)
                end
                lastIndex = i
                if firstShown then
                    firstShown = false
                end
            else
                if dbf and dbf:IsShown() then
                    dbf:Hide()
                end
            end
        end
    end
end

local function Filterino(self)
    if self and (not (self == TargetFrame or self == FocusFrame) or self:IsForbidden()) then
        return
    end

    local selfName = self:GetName()
    local numDebuffs, numBuffs = 0, 0
    local numDebuff, numBuff = 0, 0
    local playerIsTarget = UnitIsUnit("player", self.unit);

    for i = 1, MAX_TARGET_BUFFS do
        local buffName, icon, _, _, _, _, caster, canStealOrPurge = UnitBuff(self.unit, i, "HELPFUL");
        if buffName then
            local frameName = selfName .. "Buff" .. i
            local frameStealable = _G[frameName .. "Stealable"]
            local buffSize = caster == "player" and DeBuffFilter.db.profile.selfSize or DeBuffFilter.db.profile.otherSize

            if DeBuffFilter.db.profile.customHighlights then
                local customColor = DeBuffFilter.db.profile.customHighlightColors[buffName]
                if icon and customColor and not playerIsTarget then
                    -- and isEnemy
                    local r, g, b, a = customColor.r, customColor.g, customColor.b, customColor.a
                    frameStealable:Show()
                    frameStealable:SetHeight(buffSize * 1.3)
                    frameStealable:SetWidth(buffSize * 1.3)
                    frameStealable:SetVertexColor(r, g, b, a)
                elseif (not playerIsTarget and canStealOrPurge) then
                    frameStealable:Show()
                    frameStealable:SetVertexColor(1, 1, 1)
                    frameStealable:SetHeight(buffSize * 1.3)
                    frameStealable:SetWidth(buffSize * 1.3)
                else
                    frameStealable:Hide()
                end
            end
            numBuffs = numBuffs + 1;
            if not DeBuffFilter:Blacklisted(buffName) then
                numBuff = numBuff + 1
            end
        end
    end

    local frameNum = 1;
    local index = 1;

    local maxDebuffs = self.maxDebuffs or MAX_TARGET_DEBUFFS;
    while (frameNum <= maxDebuffs and index <= maxDebuffs) do
        local debuffName, _, _, debuffType, _, _, caster, _, _, _, _, _, casterIsPlayer, nameplateShowAll = UnitDebuff(self.unit, index, "INCLUDE_NAME_PLATE_ONLY")
        if debuffName then
            if (TargetFrame_ShouldShowDebuffs(self.unit, caster, nameplateShowAll, casterIsPlayer)) then
                numDebuffs = numDebuffs + 1;
                frameNum = frameNum + 1;
                if not DeBuffFilter:Blacklisted(debuffName) then
                    numDebuff = numDebuff + 1
                end
            end
        else
            break
        end
        index = index + 1;
    end

    self.auraRowz = 0

    local mirrorAurasVertically = false
    if self.buffsOnTop then
        mirrorAurasVertically = true
    else
        mirrorAurasVertically = false
    end
    self.spellbarAnchorz = nil

    local offsetX = DeBuffFilter.db.profile.horizontalSpace

    if (UnitIsFriend("player", self.unit)) then
        updatePositions(self, selfName .. "Buff", numBuffs, numDebuff, UpdateBuffAnchor, offsetX, mirrorAurasVertically)
        updatePositions(self, selfName .. "Debuff", numDebuffs, numBuff, UpdateDebuffAnchor, offsetX, mirrorAurasVertically)
    else
        updatePositions(self, selfName .. "Debuff", numDebuffs, numBuff, UpdateDebuffAnchor, offsetX, mirrorAurasVertically)
        updatePositions(self, selfName .. "Buff", numBuffs, numDebuff, UpdateBuffAnchor, offsetX, mirrorAurasVertically)
    end

    if self.spellbar then
        hookCastBar(self.spellbar)
    end
end

DeBuffFilter.event = CreateFrame("Frame")
DeBuffFilter.event:RegisterEvent("PLAYER_LOGIN")
DeBuffFilter.event:SetScript("OnEvent", function(self)
    DeBuffFilter:SetupOptions()
    hooksecurefunc("TargetFrame_UpdateAuras", Filterino)
    hooksecurefunc(TargetFrame.spellbar, "SetPoint", hookCastBar)
    hooksecurefunc(FocusFrame.spellbar, "SetPoint", hookCastBar)

    self:UnregisterEvent("PLAYER_LOGIN")
    self:SetScript("OnEvent", nil)
end)

