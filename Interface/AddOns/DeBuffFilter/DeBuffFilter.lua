local AddonName = "DeBuffFilter"

local DeBuffFilter = LibStub:NewLibrary(AddonName, 8)
local MAX_TARGET_DEBUFFS = 16
local MAX_TARGET_BUFFS = 32
local AURA_START_Y = 32
local AURA_START_X = 5
local mabs, pairs, mfloor = math.abs, pairs, math.floor
local tinsert, tsort, tostring = table.insert, table.sort, tostring
local UnitBuff, UnitDebuff, UnitIsEnemy = _G.UnitBuff, _G.UnitDebuff, _G.UnitIsEnemy
local UnitIsUnit, UnitIsOwnerOrControllerOfUnit, UnitIsFriend = _G.UnitIsUnit, _G.UnitIsOwnerOrControllerOfUnit, _G.UnitIsFriend
local IsAddOnLoaded = C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded
local GetAddOnInfo = C_AddOns and C_AddOns.GetAddOnInfo or GetAddOnInfo
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local playerClass = select(2, UnitClass("player"))
local lastTime, fontName = 0

local defaults = {
    profile = {
        hiddenBuffs = {},
        selfSize = 21,
        otherSize = 20,
        auraWidth = 122,
        verticalSpace = 1,
        horizontalSpace = 3,
        customHighlights = {},
        customHighlightColors = {},
        customSizes = {},
        sortBySize = false,
        sortbyDispellable = false,
        highlightAll = false,
        enablePrioritySort = false,
        customHighlightPriorities = {},
        customShowOwnOnly = {},
        removeDuplicates = {},
        focusBarPosX = 0,
        focusBarPosY = 0,
        targetBarPosX = 0,
        targetBarPosY = 0,
        targetCastBarSize = 1,
        focusCastBarSize = 1,
    }
}

function DeBuffFilter:AddCustomHighlightOptions()
    local new_args = {}

    for _, buff in ipairs(self.db.profile.customHighlights) do
        local buffName = tonumber(buff) and GetSpellInfo(buff) .. " (" .. buff .. ")" or buff

        local customSize = self.db.profile.customSizes[buff] or {}
        self.db.profile.customSizes[buff] = customSize

        customSize.enabled = customSize.enabled or false
        customSize.ownSize = customSize.ownSize or self.db.profile.selfSize
        customSize.otherSize = customSize.otherSize or self.db.profile.otherSize

        new_args["highlight_" .. buff] = {
            type = "group",
            name = buffName,
            args = {
                delete = {
                    order = 1,
                    type = "execute",
                    width = "0.5",
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
                            self.db.profile.customSizes[buff] = nil
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
                        if FocusFrame then
                            TargetFrame_UpdateAuras(FocusFrame)
                        end
                    end,
                },
                customSizeToggle = {
                    order = 3,
                    type = "toggle",
                    width = "full",
                    name = "Enable custom sizing",
                    get = function(info)
                        return self.db.profile.customSizes[buff].enabled
                    end,
                    set = function(info, val)
                        self.db.profile.customSizes[buff].enabled = val
                        if val == false then
                            self.db.profile.customSizes[buff] = {
                                ownSize = self.db.profile.selfSize,
                                otherSize = self.db.profile.otherSize
                            }
                        end
                    end,
                },
                ownAuraSize = {
                    order = 4,
                    type = "range",
                    width = 1.2,
                    name = "Personal aura size",
                    desc = "Change this aura's size when cast by you",
                    min = 17,
                    max = 34,
                    step = 1,
                    get = function(info)
                        local size = self.db.profile.customSizes[buff].ownSize
                        if not size then
                            size = self.db.profile.selfSize
                            self.db.profile.customSizes[buff].ownSize = size
                        end
                        return size
                    end,
                    set = function(info, val)
                        self.db.profile.customSizes[buff].ownSize = val
                        TargetFrame_UpdateAuras(TargetFrame)
                        if FocusFrame then
                            TargetFrame_UpdateAuras(FocusFrame)
                        end
                    end,
                    hidden = function()
                        return not self.db.profile.customSizes[buff].enabled
                    end,
                },
                otherAuraSize = {
                    order = 4.5,
                    type = "range",
                    width = 1.2,
                    name = "Other's aura size",
                    desc = "Change this aura's size when cast by others",
                    min = 17,
                    max = 34,
                    step = 1,
                    get = function(info)
                        local size = self.db.profile.customSizes[buff].otherSize
                        if not size then
                            size = self.db.profile.otherSize
                            self.db.profile.customSizes[buff].otherSize = size
                        end
                        return size
                    end,
                    set = function(info, val)
                        self.db.profile.customSizes[buff].otherSize = val
                        TargetFrame_UpdateAuras(TargetFrame)
                        if FocusFrame then
                            TargetFrame_UpdateAuras(FocusFrame)
                        end
                    end,
                    hidden = function()
                        return not self.db.profile.customSizes[buff].enabled
                    end,
                },
                priority = {
                    order = 5,
                    type = "range",
                    width = 2,
                    name = "Priority",
                    desc = "Set the priority of the aura",
                    min = 0,
                    max = 100,
                    step = 1,
                    get = function(info)
                        local priority = self.db.profile.customHighlightPriorities[buff]
                        if not priority then
                            priority = 0
                            self.db.profile.customHighlightPriorities[buff] = priority
                        end
                        return priority
                    end,
                    set = function(info, val)
                        self.db.profile.customHighlightPriorities[buff] = val
                        TargetFrame_UpdateAuras(TargetFrame)
                        if FocusFrame then
                            TargetFrame_UpdateAuras(FocusFrame)
                        end
                    end,
                    hidden = function()
                        return not self.db.profile.enablePrioritySort
                    end,
                },
                separator = {
                    order = 6,
                    type = "description",
                    name = "\n",
                    width = "full"
                },
                ownOnly = {
                    order = 7,
                    type = "toggle",
                    name = "Show own buff only",
                    desc = "Hides the aura when it is not applied by you",
                    get = function(info)
                        return self.db.profile.customShowOwnOnly[buff]
                    end,
                    set = function(info, val)
                        self.db.profile.customShowOwnOnly[buff] = val
                    end,
                },
                removeDuplicates = {
                    order = 8,
                    type = "toggle",
                    name = "Hide duplicate auras",
                    desc = "Hides duplicate effects of this aura",
                    get = function(info)
                        return self.db.profile.removeDuplicates[buff]
                    end,
                    set = function(info, val)
                        self.db.profile.removeDuplicates[buff] = val
                    end,
                },
                spellTitle = {
                    order = 0.5,
                    type = "description",
                    name = buffName,
                    fontSize = "medium",
                    width = "full",
                },
            },
        }
    end

    return new_args
end

local function updateCastbarPosition(bar, val, xPos)
    if not bar:IsShown() then
        bar:SetAlpha(1)
        bar:Show()
    end

    local a, b, c, d, e = bar:GetPoint()
    bar:ClearAllPoints()

    if xPos then
        bar:SetPoint(a, b, c, val, e)
    else
        bar:SetPoint(a, b, c, d, val)
    end

    lastTime = GetTime()

    C_Timer.After(3, function()
        if (GetTime() - lastTime) > 2 then
            bar:SetAlpha(0)
            bar:Hide()
        end
    end)

end

function DeBuffFilter:SetupOptions()
    self.db = LibStub("AceDB-3.0"):New("DeBuffFilterDB", defaults, true)

    self.options = {
        type = "group",
        childGroups = "tab",
        plugins = {},
        args = {
            author = {
                name = "|cff4693E6Author:|r Xyz",
                type = "description"
            },
            version = {
                name = "|cff4693E6Version:|r " .. GetAddOnMetadata("DeBuffFilter", "Version") .. "\n",
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
                                if not GetSpellInfo(val) then
                                    return
                                end
                                val = tostring(val)
                            end

                            for _, value in ipairs(self.db.profile.hiddenBuffs) do
                                if value == val then
                                    return
                                end
                            end

                            tinsert(self.db.profile.hiddenBuffs, val);
                            tsort(self.db.profile.hiddenBuffs)
                            TargetFrame_UpdateAuras(TargetFrame);
                            if FocusFrame then
                                TargetFrame_UpdateAuras(FocusFrame)
                            end
                        end,
                    },
                    buffList = {
                        order = 3,
                        width = 1,
                        name = "Hidden Auras:",
                        type = "multiselect",
                        values = function()
                            local list = {}
                            for _, value in pairs(self.db.profile.hiddenBuffs) do
                                local spellName = GetSpellInfo(value)
                                if spellName then
                                    list[value] = spellName .. " (" .. value .. ")"
                                else
                                    list[value] = value
                                end
                            end
                            return list
                        end,
                        get = function(info, val)
                            return true;
                        end,
                        set = function(info, val)
                            for index, spellID in ipairs(self.db.profile.hiddenBuffs) do
                                if spellID == val then
                                    table.remove(self.db.profile.hiddenBuffs, index)
                                    break
                                end
                            end
                        end,
                        confirm = function(info, val, v2)
                            local spellName = GetSpellInfo(val) or val
                            return "Delete " .. spellName .. " (" .. val .. ")?"
                        end
                    },
                },
            },
            sizeoptions = {
                name = "General Settings",
                type = "group",
                order = 2,
                args = {
                    fancySliders = {
                        order = 1,
                        type = "group",
                        inline = false,
                        name = "Resizer",
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
                                    if FocusFrame then
                                        TargetFrame_UpdateAuras(FocusFrame)
                                    end
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
                                    if FocusFrame then
                                        TargetFrame_UpdateAuras(FocusFrame)
                                    end
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
                                    if FocusFrame then
                                        TargetFrame_UpdateAuras(FocusFrame)
                                    end
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
                                    if FocusFrame then
                                        TargetFrame_UpdateAuras(FocusFrame)
                                    end
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
                                    if FocusFrame then
                                        TargetFrame_UpdateAuras(FocusFrame)
                                    end
                                end
                            },
                        },
                    },
                    fancyCheckboxes = {
                        order = 2,
                        type = "group",
                        inline = false,
                        name = "Sorting options",
                        args = {
                            sortBySize = {
                                order = 1,
                                type = "toggle",
                                name = "Sort auras by size",
                                desc = "Recommended when using a different size per aura",
                                get = function()
                                    return self.db.profile.sortBySize
                                end,
                                set = function(_, value)
                                    self.db.profile.sortBySize = value
                                end,
                            },
                            sortbyDispellable = {
                                order = 2,
                                type = "toggle",
                                name = "Sort by dispellable",
                                desc = "Shows dispellable buffs first, unless size or priority sorting is enabled",
                                get = function()
                                    return self.db.profile.sortbyDispellable
                                end,
                                set = function(_, value)
                                    self.db.profile.sortbyDispellable = value
                                end,
                            },
                            highlightAll = {
                                order = 3,
                                type = "toggle",
                                name = "Highlight magic buffs",
                                desc = "Shows a glowing border on all dispellable magic buffs",
                                get = function()
                                    return self.db.profile.highlightAll
                                end,
                                set = function(_, value)
                                    self.db.profile.highlightAll = value
                                end,
                            },
                            enablePrioritySort = {
                                order = 4,
                                type = "toggle",
                                name = "Enable priority slider",
                                desc = "When enabled 'auras-specific customizations' will display an extra slider",
                                get = function()
                                    return self.db.profile.enablePrioritySort
                                end,
                                set = function(_, value)
                                    self.db.profile.enablePrioritySort = value
                                end,
                            },
                        },
                    },
                    fancyCastBar = {
                        order = 3,
                        type = "group",
                        inline = false,
                        name = "Castbar settings",
                        args = {
                            targetSpellbarPosX = {
                                order = 1,
                                width = 1.5,
                                name = "Target spellbar horizontal position",
                                desc = "Set horizontal & vertical to 0 for default behaviour",
                                type = "range",
                                min = -300,
                                max = 300,
                                step = 1,
                                get = function(info, val)
                                    return self.db.profile.targetBarPosX
                                end,
                                set = function(info, val)
                                    self.db.profile.targetBarPosX = val
                                    updateCastbarPosition(TargetFrameSpellBar, val, true)
                                end
                            },
                            targetSpellbarPosY = {
                                order = 2,
                                width = 1.5,
                                name = "Target spellbar vertical position",
                                desc = "Set horizontal & vertical to 0 for default behaviour",
                                type = "range",
                                min = -300,
                                max = 300,
                                step = 1,
                                get = function(info, val)
                                    return self.db.profile.targetBarPosY
                                end,
                                set = function(info, val)
                                    self.db.profile.targetBarPosY = val
                                    updateCastbarPosition(TargetFrameSpellBar, val, false)
                                end
                            },
                            focusSpellbarPosX = {
                                order = 3,
                                width = 1.5,
                                name = "Focus spellbar horizontal position",
                                desc = "Set horizontal & vertical to 0 for default behaviour",
                                type = "range",
                                min = -300,
                                max = 300,
                                step = 1,
                                get = function(info, val)
                                    return self.db.profile.focusBarPosX
                                end,
                                set = function(info, val)
                                    self.db.profile.focusBarPosX = val
                                    updateCastbarPosition(FocusFrameSpellBar, val, true)
                                end
                            },
                            focusSpellbarPosY = {
                                order = 4,
                                width = 1.5,
                                name = "Focus spellbar vertical position",
                                desc = "Set horizontal & vertical to 0 for default behaviour",
                                type = "range",
                                min = -300,
                                max = 300,
                                step = 1,
                                get = function(info, val)
                                    return self.db.profile.focusBarPosY
                                end,
                                set = function(info, val)
                                    self.db.profile.focusBarPosY = val
                                    updateCastbarPosition(FocusFrameSpellBar, val, false)
                                end
                            },
                            targetSpellbarScale = {
                                order = 5,
                                width = 1.5,
                                name = "Target spellbar size",
                                desc = "Change the scale of the castbar",
                                type = "range",
                                min = 0.7,
                                max = 3,
                                step = 0.05,
                                get = function(info, val)
                                    return self.db.profile.targetCastBarSize
                                end,
                                set = function(info, val)
                                    self.db.profile.targetCastBarSize = val
                                    TargetFrameSpellBar:SetScale(self.db.profile.targetCastBarSize)
                                    if not TargetFrameSpellBar:IsShown() then
                                        TargetFrameSpellBar:SetAlpha(1)
                                        TargetFrameSpellBar:Show()
                                    end
                                end
                            },
                            focusSpellbarScale = {
                                order = 6,
                                width = 1.5,
                                name = "Focus spellbar size",
                                desc = "Change the scale of the castbar",
                                type = "range",
                                min = 0.7,
                                max = 3,
                                step = 0.05,
                                get = function(info, val)
                                    return self.db.profile.focusCastBarSize
                                end,
                                set = function(info, val)
                                    self.db.profile.focusCastBarSize = val
                                    FocusFrameSpellBar:SetScale(self.db.profile.focusCastBarSize)
                                    if not FocusFrameSpellBar:IsShown() then
                                        FocusFrameSpellBar:SetAlpha(1)
                                        FocusFrameSpellBar:Show()
                                    end
                                end
                            },
                        },
                    },
                },
            },
            highlightBuffs = {
                type = "group",
                name = "Aura-specific customization",
                childGroups = "tree",
                order = 3,
                args = {
                    buffNameInput = {
                        order = 1,
                        width = 1.5,
                        name = "Add (De)Buff By Name / Spell Id",
                        desc = "Type the name or spell id of a (de)buff to customize",
                        type = "input",
                        set = function(info, val)
                            if tonumber(val) then
                                if not GetSpellInfo(val) then
                                    return
                                end
                                val = tostring(val)
                            end

                            for _, value in ipairs(self.db.profile.customHighlights) do
                                if value == val then
                                    return
                                end
                            end

                            tinsert(self.db.profile.customHighlights, val)
                            tsort(self.db.profile.customHighlights)
                            self.db.profile.customHighlightColors[val] = { r = 1, g = 1, b = 1, a = 0 }

                            self.options.args.highlightBuffs.args.buffList.args = self:AddCustomHighlightOptions()
                        end,
                    },
                    buffList = {
                        order = 2,
                        width = 1,
                        name = "Aura List",
                        type = "group",
                        args = DeBuffFilter:AddCustomHighlightOptions()
                    },
                },
            },
        },
    }

    local options = {
        name = "DeBuffFilter",
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
    LibStub("AceConsole-3.0"):RegisterChatCommand("dbf", function()
        HideUIPanel(SettingsPanel)
        LibStub("AceConfigDialog-3.0"):Open("DeBuffFilter")
    end)
end

function DeBuffFilter:Blacklisted(value)
    value = tostring(value)
    for _, blockedName in pairs(self.db.profile.hiddenBuffs) do
        if blockedName == value then
            return true
        end
    end
    return false
end

local function adjustCastbar(frame)
    local parentFrame = frame:GetParent()
    local yOffset, xOffset = parentFrame.largestAura or 0
    local spellbarAnchor = parentFrame.spellbarAnchor

    local barPosX = parentFrame == TargetFrame and DeBuffFilter.db.profile.targetBarPosX or parentFrame == FocusFrame and DeBuffFilter.db.profile.focusBarPosX
    local barPosY = parentFrame == TargetFrame and DeBuffFilter.db.profile.targetBarPosY or parentFrame == FocusFrame and DeBuffFilter.db.profile.focusBarPosY

    if (barPosX and barPosX ~= 0) or (barPosY and barPosY ~= 0) then
        spellbarAnchor = parentFrame
    end

    if frame.boss then
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", barPosX ~= 0 and barPosX or 25, barPosY ~= 0 and barPosY or 10 - yOffset)
    elseif parentFrame.haveToT then
        if parentFrame.buffsOnTop or parentFrame.auraRows <= 1 then
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", barPosX ~= 0 and barPosX or 25, barPosY ~= 0 and barPosY or -25)
        else
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", spellbarAnchor, "BOTTOMLEFT", barPosX ~= 0 and barPosX or 20, barPosY ~= 0 and barPosY or -15 - yOffset)
        end
    elseif parentFrame.haveElite then
        if parentFrame.buffsOnTop or parentFrame.auraRows <= 1 then
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", barPosX ~= 0 and barPosX or 25, barPosY ~= 0 and barPosY or -5)
        else
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", spellbarAnchor, "BOTTOMLEFT", barPosX ~= 0 and barPosX or 20, barPosY ~= 0 and barPosY or -15 - yOffset)
        end
    else
        if not parentFrame.buffsOnTop and parentFrame.auraRows > 0 then
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", spellbarAnchor, "BOTTOMLEFT", barPosX ~= 0 and barPosX or 20, barPosY ~= 0 and barPosY or -15 - yOffset)
        else
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", barPosX ~= 0 and barPosX or 25, barPosY ~= 0 and barPosY or 7 - yOffset)
        end
    end
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
        if UnitIsUnit(caster, token) then
            return value;
        end
    end
end

local function safeSetPoint(frame, point, relativeTo, relativePoint, x, y)
    if not frame or not relativeTo then return end

    local current = relativeTo
    while current do
        if current == frame then
            print("Circular dependency detected. Bugsack error?")
            frame:ClearAllPoints()
            frame:SetPoint(point, relativeTo:GetParent(), relativePoint, x, y)
            return
        end

        local _, parent = current:GetPoint()
        current = parent
    end

    frame:ClearAllPoints()
    frame:SetPoint(point, relativeTo, relativePoint, x, y)
end

local function UpdateBuffAnchor(self, buffName, numDebuffs, anchorBuff, size, offsetX, offsetY, mirrorVertically, newRow)
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

    buffName:ClearAllPoints()

    if anchorBuff == nil then
        if (UnitIsFriend("player", self.unit) or numDebuffs == 0) then
            -- unit is friendly or there are no debuffs...buffs start on top
            buffName:SetPoint(point .. "LEFT", self, relativePoint .. "LEFT", AURA_START_X, startY);
        else
            safeSetPoint(buffName, point .. "LEFT", self.debuffz, relativePoint .. "LEFT", 0, -offsetY);
        end

        self.buffz:ClearAllPoints()
        self.buffz:SetPoint(point .. "LEFT", buffName, point .. "LEFT", 0, 0);
        self.buffz:SetPoint(relativePoint .. "LEFT", buffName, relativePoint .. "LEFT", 0, -auraOffsetY);
        self.spellbarAnchor = buffName;
    elseif newRow then
        buffName:SetPoint(point .. "LEFT", anchorBuff, relativePoint .. "LEFT", 0, -offsetY);
        self.buffz:ClearAllPoints()
        self.buffz:SetPoint(relativePoint .. "LEFT", buffName, relativePoint .. "LEFT", 0, -auraOffsetY);
        self.spellbarAnchor = buffName;
    else
        buffName:SetPoint(point .. "LEFT", anchorBuff, point .. "RIGHT", offsetX, 0);
    end

    -- Resize
    buffName:SetWidth(size);
    buffName:SetHeight(size);
end

local function UpdateDebuffAnchor(self, debuffName, numBuffs, anchorDebuff, size, offsetX, offsetY, mirrorVertically, newRow)
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

    debuffName:ClearAllPoints()

    if anchorDebuff == nil then
        if (isFriend and numBuffs > 0) then
            -- unit is friendly and there are buffs...debuffs start on bottom
            debuffName:SetPoint(point .. "LEFT", self.buffz, relativePoint .. "LEFT", 0, -offsetY);
        else
            -- unit is not friendly or there are no buffs...debuffs start on top
            debuffName:SetPoint(point .. "LEFT", self, relativePoint .. "LEFT", AURA_START_X, startY);
        end
        self.debuffz:ClearAllPoints()
        self.debuffz:SetPoint(point .. "LEFT", debuffName, point .. "LEFT", 0, 0);
        self.debuffz:SetPoint(relativePoint .. "LEFT", debuffName, relativePoint .. "LEFT", 0, -auraOffsetY);
        if ((isFriend) or (not isFriend and numBuffs == 0)) then
            self.spellbarAnchor = debuffName;
        end
    elseif newRow then
        debuffName:SetPoint(point .. "LEFT", anchorDebuff, relativePoint .. "LEFT", 0, -offsetY);
        self.debuffz:ClearAllPoints()
        self.debuffz:SetPoint(relativePoint .. "LEFT", debuffName, relativePoint .. "LEFT", 0, -auraOffsetY);
        if ((isFriend) or (not isFriend and numBuffs == 0)) then
            self.spellbarAnchor = debuffName;
        end
    else
        debuffName:SetPoint(point .. "LEFT", anchorDebuff, point .. "RIGHT", offsetX, 0);
    end

    -- Resize
    debuffName:SetWidth(size);
    debuffName:SetHeight(size);
    local debuffFrame = _G[debuffName:GetName() .. "Border"];
    if debuffFrame then
        debuffFrame:SetWidth(size + 2);
        debuffFrame:SetHeight(size + 2);
    end
end

local function GetFramePosition(frame)
    if not frame then
        return 0, 0, 0
    end

    local left = frame:GetLeft() or 0
    local bottom = frame:GetBottom() or 0
    local top = frame:GetTop() or 0
    return left, top, bottom
end

local function sizeSorter(a, b)
    return a.size > b.size
end

local function typeSort(a, b)
    if playerClass == "ROGUE" and (a.dispelType == "" and b.dispelType ~= "") then
        return true
    elseif playerClass == "ROGUE" and (a.dispelType ~= "" and b.dispelType == "") then
        return false
    elseif a.dispelType == "Magic" and b.dispelType ~= "Magic" then
        return true
    elseif a.dispelType ~= "Magic" and b.dispelType == "Magic" then
        return false
    else
        return a.index < b.index
    end
end

local function prioritySort(a, b)
    return a.prio > b.prio
end

local function auraSortBySize(frame, auraName, numAuras, numOppositeAuras, updateFunc, offsetX, mirrorAurasVertically)
    local LARGE_AURA_SIZE = DeBuffFilter.db.profile.selfSize
    local SMALL_AURA_SIZE = DeBuffFilter.db.profile.otherSize
    local maxRowWidth = DeBuffFilter.db.profile.auraWidth
    local yDistance = DeBuffFilter.db.profile.verticalSpace
    local offsetY = yDistance
    local size, biggestAura
    local rowWidth = 0
    local anchorRowAura, lastBuff = nil, nil
    local firstBuffonRow = 1
    local haveTargetofTarget = frame.totFrame and frame.totFrame:IsShown()
    local totFrameX, totFrameTop, totFrameBottom = GetFramePosition(frame.totFrame)
    local currentX, currentY
    local auras, processedSpellIDs = {}, {}

    for i = 1, numAuras do
        local filter
        if updateFunc == UpdateBuffAnchor then
            filter = "HELPFUL"
        else
            filter = "HARMFUL"
        end

        local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitAura(frame.unit, i, filter)
        if name then
            local customSize = DeBuffFilter.db.profile.customSizes[tostring(spellId)] or DeBuffFilter.db.profile.customSizes[name]
            if customSize then
                size = ShouldAuraBeLarge(unitCaster) and customSize.ownSize or customSize.otherSize
            else
                if unitCaster and ShouldAuraBeLarge(unitCaster) then
                    size = LARGE_AURA_SIZE
                else
                    size = SMALL_AURA_SIZE
                end
            end

            if debuffType == nil then
                debuffType = "GG"
            end

            local priority = DeBuffFilter.db.profile.customHighlightPriorities[name] or 0
            tinsert(auras, { size = size,
                             name = name,
                             dbf = _G[auraName .. i],
                             dispelType = debuffType,
                             prio = priority,
                             source = unitCaster,
                             index = i,
                             spellId = spellId
            })
        end
    end

    if DeBuffFilter.db.profile.sortbyDispellable then
        tsort(auras, typeSort)
    end

    if DeBuffFilter.db.profile.sortBySize then
        tsort(auras, sizeSorter)
    end

    if DeBuffFilter.db.profile.enablePrioritySort then
        tsort(auras, prioritySort)
    end

    for _, auraData in ipairs(auras) do
        local size = auraData.size
        local aura = auraData.dbf
        local source = auraData.source
        local ownOnly = DeBuffFilter.db.profile.customShowOwnOnly[tostring(auraData.spellId)] or DeBuffFilter.db.profile.customShowOwnOnly[auraData.name]

        if not (DeBuffFilter:Blacklisted(auraData.name) or DeBuffFilter:Blacklisted(auraData.spellId)) and (not ownOnly or (ownOnly and auraData.source == "player")) and not processedSpellIDs[auraData.spellId] then
            if DeBuffFilter.db.profile.removeDuplicates[tostring(auraData.spellId)] or DeBuffFilter.db.profile.removeDuplicates[auraData.name] then
                processedSpellIDs[auraData.spellId] = true
            end

            if source and ShouldAuraBeLarge(source) then
                offsetY = yDistance * 2
            end

            if lastBuff == nil then
                rowWidth = size;
                frame.auraRows = frame.auraRows + 1;
                anchorRowAura = aura

                if frame.largestAura then
                    offsetY = frame.largestAura
                end
            else
                rowWidth = rowWidth + size + offsetX;
            end

            local verticalDistance = currentY and (currentY - totFrameBottom) or 0
            local horizontalDistance = rowWidth

            if currentX then
                horizontalDistance = (mfloor(mabs((currentX + size + offsetX) - totFrameX))) + 5 -- Cheat a bit
            end

            if (haveTargetofTarget and (horizontalDistance < size) and verticalDistance > 0) or (rowWidth > maxRowWidth) then
                if biggestAura >= mfloor(anchorRowAura:GetSize() + 0.5) then
                    offsetY = (yDistance * 2) + (biggestAura - anchorRowAura:GetSize())
                end
                updateFunc(frame, aura, numOppositeAuras, anchorRowAura, size, offsetX, offsetY, mirrorAurasVertically, true);
                rowWidth = size;
                frame.auraRows = frame.auraRows + 1
                anchorRowAura = aura
                offsetY = yDistance;
                biggestAura = nil
                frame.largestAura = nil
            else
                updateFunc(frame, aura, numOppositeAuras, lastBuff, size, offsetX, offsetY, mirrorAurasVertically);
            end

            lastBuff = aura
            currentX, currentY = aura:GetLeft(), aura:GetTop()

            if not biggestAura or (biggestAura and (biggestAura < size)) then
                biggestAura = size
            end

            local calc = (yDistance * 2) + (biggestAura - anchorRowAura:GetSize())
            if not frame.largestAura or (frame.largestAura and (frame.largestAura < calc)) then
                frame.largestAura = calc
            end
        else
            if aura then
                aura:ClearAllPoints()
                aura:SetPoint("CENTER", frame, "CENTER", 100000, 100000)
            end
        end
    end
end

local function updatePositions(frame, auraName, numAuras, numOppositeAuras, updateFunc, offsetX, mirrorAurasVertically)
    local LARGE_AURA_SIZE = DeBuffFilter.db.profile.selfSize
    local SMALL_AURA_SIZE = DeBuffFilter.db.profile.otherSize
    local maxRowWidth = DeBuffFilter.db.profile.auraWidth
    local yDistance = DeBuffFilter.db.profile.verticalSpace
    local offsetY = yDistance
    local size, biggestAura
    local rowWidth = 0
    local anchorRowAura, lastBuff = nil, nil
    local haveTargetofTarget = frame.totFrame and frame.totFrame:IsShown()
    local totFrameX, totFrameTop, totFrameBottom = GetFramePosition(frame.totFrame)
    local currentX, currentY
    local processedSpellIDs = {}

    for i = 1, numAuras do
        local filter
        if updateFunc == UpdateBuffAnchor then
            filter = "HELPFUL"
        else
            filter = "HARMFUL"
        end

        local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitAura(frame.unit, i, filter)
        if name and icon then
            local dbf = _G[auraName .. i]
            local ownOnly = DeBuffFilter.db.profile.customShowOwnOnly[tostring(spellId)] or DeBuffFilter.db.profile.customShowOwnOnly[name]
            if not (DeBuffFilter:Blacklisted(name) or DeBuffFilter:Blacklisted(spellId)) and (not ownOnly or (ownOnly and unitCaster == "player")) and not processedSpellIDs[spellId] then

                if DeBuffFilter.db.profile.removeDuplicates[tostring(spellId)] or DeBuffFilter.db.profile.removeDuplicates[name] then
                    processedSpellIDs[spellId] = true
                end

                local shouldbeLarge = ShouldAuraBeLarge(unitCaster)
                if unitCaster and shouldbeLarge then
                    size = LARGE_AURA_SIZE
                    offsetY = yDistance * 2
                else
                    size = SMALL_AURA_SIZE
                end

                local customSize = DeBuffFilter.db.profile.customSizes[tostring(spellId)] or DeBuffFilter.db.profile.customSizes[name]
                if customSize then
                    size = shouldbeLarge and customSize.ownSize or customSize.otherSize
                end

                if lastBuff == nil then
                    rowWidth = size;
                    frame.auraRows = frame.auraRows + 1;
                    anchorRowAura = dbf

                    if frame.largestAura then
                        offsetY = frame.largestAura
                    end
                else
                    rowWidth = rowWidth + size + offsetX;
                end

                local verticalDistance = currentY and (currentY - totFrameBottom) or 0
                local horizontalDistance = rowWidth

                if currentX then
                    horizontalDistance = (mfloor(mabs((currentX + size + offsetX) - totFrameX))) + 5 -- Cheat a bit
                end

                if (haveTargetofTarget and (horizontalDistance < size) and verticalDistance > 0) or (rowWidth > maxRowWidth) then
                    if biggestAura >= mfloor(anchorRowAura:GetSize() + 0.5) then
                        offsetY = (yDistance * 2) + (biggestAura - anchorRowAura:GetSize())
                    end
                    updateFunc(frame, dbf, numOppositeAuras, anchorRowAura, size, offsetX, offsetY, mirrorAurasVertically, true)
                    rowWidth = size;
                    frame.auraRows = frame.auraRows + 1;
                    offsetY = yDistance
                    anchorRowAura = dbf
                    biggestAura = nil
                    frame.largestAura = nil
                else
                    updateFunc(frame, dbf, numOppositeAuras, lastBuff, size, offsetX, offsetY, mirrorAurasVertically)
                end

                lastBuff = dbf
                currentX, currentY = dbf:GetLeft(), dbf:GetTop()

                if not biggestAura or (biggestAura and (biggestAura < size)) then
                    biggestAura = size
                end

                local calc = (yDistance * 2) + (biggestAura - anchorRowAura:GetSize())
                if not frame.largestAura or (frame.largestAura and (frame.largestAura < calc)) then
                    frame.largestAura = calc
                end
            else
                if dbf then
                    dbf:ClearAllPoints()
                    dbf:SetPoint("CENTER", frame, "CENTER", 100000, 100000)
                end
            end
        end
    end
end

local function Filterino(self)
    if self and (not (self == TargetFrame or self == FocusFrame) or self:IsForbidden()) then
        return
    end

    local frame, frameName;
    local selfName = self:GetName()
    local numDebuffs, numBuffs = 0, 0
    local numDebuff, numBuff = 0, 0
    local playerIsTarget = UnitIsUnit("player", self.unit);
    local isEnemy = UnitIsEnemy("player", self.unit)

    for i = 1, MAX_TARGET_BUFFS do
        local buffName, rank, icon, _, debuffType, _, _, caster, canStealOrPurge, _, spellId = UnitBuff(self.unit, i, "HELPFUL");
        if buffName then
            frameName = selfName .. "Buff" .. i
            local frameStealable = _G[frameName .. "Stealable"]
            local shouldBeLarge = caster and ShouldAuraBeLarge(caster)
            local buffSize = shouldBeLarge and DeBuffFilter.db.profile.selfSize or DeBuffFilter.db.profile.otherSize
            local modifier = 1.34
            local stockR, stockG, stockB = 1, 1, 1

            if IsAddOnLoaded("RougeUI") and (RougeUI.Lorti or RougeUI.Roug or RougeUI.Modern) then
                modifier = 2.06
                stockR, stockG, stockB = 1, 1, 0.75
            end

            local newSize = DeBuffFilter.db.profile.customSizes[tostring(spellId)] or DeBuffFilter.db.profile.customSizes[buffName]
            if newSize then
                buffSize = shouldBeLarge and newSize.ownSize or newSize.otherSize
            end

            if DeBuffFilter.db.profile.customHighlights then
                local customColor = DeBuffFilter.db.profile.customHighlightColors[tostring(spellId)] or DeBuffFilter.db.profile.customHighlightColors[buffName]
                if icon and (customColor or (DeBuffFilter.db.profile.highlightAll and debuffType == "Magic")) then
                    if not customColor then
                        customColor = { r = 1, g = 1, b = 0.85, a = 1 }
                    end
                    local r, g, b, a = customColor.r, customColor.g, customColor.b, customColor.a
                    frameStealable:Show()
                    frameStealable:SetHeight(buffSize * modifier)
                    frameStealable:SetWidth(buffSize * modifier)
                    frameStealable:SetVertexColor(r, g, b, a)
                    if modifier == 2.06 then
                        frameStealable:SetDesaturated(true)
                    end
                elseif (not playerIsTarget and isEnemy and canStealOrPurge) then
                    frameStealable:Show()
                    frameStealable:SetVertexColor(stockR, stockG, stockB)
                    frameStealable:SetHeight(buffSize * modifier)
                    frameStealable:SetWidth(buffSize * modifier)
                    if modifier == 2.06 then
                        frameStealable:SetDesaturated(true)
                    end
                else
                    frameStealable:Hide()
                end
            end

            local frameCount = _G[frameName .. "Count"]
            if frameCount then
                if not fontName then
                    fontName = frameCount:GetFont()
                end
                _G[frameName .. "Count"]:SetFont(fontName, buffSize / 1.75, "OUTLINE, THICKOUTLINE, MONOCHROME")
            end

            numBuffs = numBuffs + 1;
            if not (DeBuffFilter:Blacklisted(buffName) or DeBuffFilter:Blacklisted(spellId)) then
                numBuff = numBuff + 1
            end
        end
    end

    local frameNum = 1;
    local index = 1;

    local maxDebuffs = self.maxDebuffs or MAX_TARGET_DEBUFFS;
    while (frameNum <= maxDebuffs and index <= maxDebuffs) do
        local debuffName, rank, icon, _, debuffType, _, _, caster, _, _, spellId, _, _, casterIsPlayer, nameplateShowAll = UnitDebuff(self.unit, index, "INCLUDE_NAME_PLATE_ONLY")
        if debuffName then
            if ( icon and ( SHOW_CASTABLE_DEBUFFS == "0" or not isEnemy or caster == "player" or caster == "vehicle") ) then
                frameName = selfName .. "Debuff" .. frameNum
                frame = _G[frameName]
                local debuffBorder = _G[frameName .. "Border"]
                local shouldBeLarge = caster and ShouldAuraBeLarge(caster)
                local buffSize = shouldBeLarge and DeBuffFilter.db.profile.selfSize or DeBuffFilter.db.profile.otherSize

                if DeBuffFilter.db.profile.customHighlights then
                    local customColor = DeBuffFilter.db.profile.customHighlightColors[tostring(spellId)] or DeBuffFilter.db.profile.customHighlightColors[debuffName]
                    local modifier = 1.3
                    local stockR, stockG, stockB = 1, 1, 1
                    local texturePath = "Interface\\TargetingFrame\\UI-TargetingFrame-Stealable"

                    if IsAddOnLoaded("RougeUI") and (RougeUI.Lorti or RougeUI.Roug or RougeUI.Modern) then
                        modifier = 2.06
                        stockR, stockG, stockB = 1, 1, 0.75
                    end

                    local frameStealable = _G[frameName .. "Stealable"]
                    if not frameStealable and frame and customColor then
                        frameStealable = frame:CreateTexture(frameName .. "Stealable", "OVERLAY")
                        if modifier == 2.06 then
                            texturePath = "Interface\\AddOns\\RougeUI\\textures\\newexp"
                            frameStealable:SetTexCoord(0.338379, 0.412598, 0.680664, 0.829102)
                        end
                        frameStealable:SetTexture(texturePath)
                        frameStealable:SetSize(24, 24)
                        frameStealable:SetPoint("CENTER", 0, 0)
                        frameStealable:SetBlendMode("ADD")
                    end

                    if frameStealable then
                        if customColor then
                            local newSize = DeBuffFilter.db.profile.customSizes[tostring(spellId)] or DeBuffFilter.db.profile.customSizes[debuffName]
                            if newSize then
                                buffSize = shouldBeLarge and newSize.ownSize or newSize.otherSize
                            end

                            local r, g, b, a = customColor.r, customColor.g, customColor.b, customColor.a
                            frameStealable:Show()
                            frameStealable:SetHeight(buffSize * modifier)
                            frameStealable:SetWidth(buffSize * modifier)
                            frameStealable:SetVertexColor(r, g, b, a)
                            debuffBorder:SetShown(r == 0 and g == 0 and b == 0 or a == 0)

                            if modifier == 2.06 then
                                frameStealable:SetDesaturated(true)
                            end
                        else
                            frameStealable:Hide()
                            debuffBorder:Show()
                        end
                    end
                end

                local frameCount = _G[frameName .. "Count"]
                if frameCount then
                    if not fontName then
                        fontName = frameCount:GetFont()
                    end
                    _G[frameName .. "Count"]:SetFont(fontName, buffSize / 1.75, "OUTLINE, THICKOUTLINE, MONOCHROME")
                end

                numDebuffs = numDebuffs + 1;
                frameNum = frameNum + 1;
                if not (DeBuffFilter:Blacklisted(debuffName) or DeBuffFilter:Blacklisted(spellId)) then
                    numDebuff = numDebuff + 1
                end
            end
        else
            break
        end
        index = index + 1;
    end

    local mirrorAurasVertically = self.buffsOnTop and true or false
    local db = DeBuffFilter.db.profile
    local offsetX = db.horizontalSpace

    self.auraRows = 0
    self.largestAura = 0
    self.spellbarAnchor = nil

    local sortOrDefault = (db.sortBySize or db.sortbyDispellable or db.enablePrioritySort) and auraSortBySize or updatePositions

    if not self.buffz then
        self.buffz = CreateFrame("Frame", "$parentBuffz", self)
        self.buffz:SetSize(10, 10)
    end

    if not self.debuffz then
        self.debuffz = CreateFrame("Frame", "$parentDebuffz", self)
        self.debuffz:SetSize(10, 10)
    end

    if isEnemy then
        sortOrDefault(self, selfName .. "Debuff", numDebuffs, numBuff, UpdateDebuffAnchor, offsetX, mirrorAurasVertically)
        sortOrDefault(self, selfName .. "Buff", numBuffs, numDebuff, UpdateBuffAnchor, offsetX, mirrorAurasVertically)
    else
        sortOrDefault(self, selfName .. "Buff", numBuffs, numDebuff, UpdateBuffAnchor, offsetX, mirrorAurasVertically)
        sortOrDefault(self, selfName .. "Debuff", numDebuffs, numBuff, UpdateDebuffAnchor, offsetX, mirrorAurasVertically)
    end

    if self.spellbar then
        adjustCastbar(self.spellbar)
    end
end

DeBuffFilter.event = CreateFrame("Frame")
DeBuffFilter.event:RegisterEvent("PLAYER_LOGIN")
DeBuffFilter.event:SetScript("OnEvent", function(self)
    DeBuffFilter:SetupOptions()
    hooksecurefunc("TargetFrame_UpdateAuras", Filterino)

    for _, v in pairs({ TargetFrameSpellBar, FocusFrameSpellBar }) do
        if v then
            hooksecurefunc(v, "SetPoint", function(self)
                if self.busy then
                    return
                end
                self.busy = true
                adjustCastbar(self)
                self.busy = false
            end)
        end
    end

    TargetFrameSpellBar:SetScale(DeBuffFilter.db.profile.targetCastBarSize)
    if FocusFrameSpellBar then
        FocusFrameSpellBar:SetScale(DeBuffFilter.db.profile.focusCastBarSize)
    end

    playerClass = select(2, UnitClass("player"))
end)