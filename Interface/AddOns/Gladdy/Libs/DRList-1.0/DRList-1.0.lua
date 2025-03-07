--[[
Name: DRList-1.0
Description: Diminishing returns categorization. Fork of outdated DRData-1.0.
Website: https://github.com/wardz/DRList-1.0/
Documentation: https://wardz.github.io/DRList-1.0/
Dependencies: LibStub
License: MIT
]]

--- DRList-1.0
-- @module DRList-1.0
local MAJOR, MINOR = "DRList-1.0", 51 -- Don't forget to change this in Spells.lua aswell!
local Lib = assert(LibStub, MAJOR .. " requires LibStub."):NewLibrary(MAJOR, MINOR)
if not Lib then return end -- already loaded

-------------------------------------------------------------------------------
-- *** LOCALIZATIONS ARE AUTOMATICALLY GENERATED ***
-- Please see Curseforge localization page if you'd like to help translate.
-- https://www.curseforge.com/wow/addons/drlist-1-0/localization
local L = {}
Lib.L = L
L["DISARMS"] = "Disarms"
L["DISORIENTS"] = "Disorients"
L["INCAPACITATES"] = "Incapacitates"
L["KNOCKBACKS"] = "Knockbacks"
L["ROOTS"] = "Roots"
L["SILENCES"] = "Silences"
L["STUNS"] = "Stuns"
L["TAUNTS"] = "Taunts"
L["FEARS"] = "Fears"
L["RANDOM_ROOTS"] = "Random roots"
L["RANDOM_STUNS"] = "Random stuns"
L["OPENER_STUN"] = "Opener Stuns"
L["HORROR"] = "Horrors"
L["SCATTERS"] = "Scatters"
L["SLEEPS"] = GetSpellInfo(1090) or "Sleep"
L["MIND_CONTROL"] = GetSpellInfo(605) or "Mind Control"
L["FROST_SHOCK"] = GetSpellInfo(15089) or "Frost Shock"
L["KIDNEY_SHOT"] = GetSpellInfo(408) or "Kidney Shot"
L["DEATH_COIL"] = GetSpellInfo(28412) or "Death Coil"
L["UNSTABLE_AFFLICTION"] = GetSpellInfo(31117) or "Unstable Affliction"
L["CHASTISE"] = GetSpellInfo(44041) or "Chastise"
L["COUNTERATTACK"] = GetSpellInfo(19306) or "Counterattack"
L["CYCLONE"] = GetSpellInfo(33786) or "Cyclone"
L["BANISH"] = GetSpellInfo(710) or "Banish"
L["CHARGE"] = GetSpellInfo(100) or "Charge"

-- luacheck: push ignore 542
local locale = GetLocale()
if locale == "deDE" then
    L["FEARS"] = "Furchteffekte"
    L["KNOCKBACKS"] = "Rückstoßeffekte"
    L["ROOTS"] = "Bewegungsunfähigkeitseffekte"
    L["SILENCES"] = "Stilleeffekte"
    L["STUNS"] = "Betäubungseffekte"
    L["TAUNTS"] = "Spotteffekte"
elseif locale == "frFR" then
    L["FEARS"] = "Peurs"
    L["KNOCKBACKS"] = "Projections"
    L["ROOTS"] = "Immobilisations"
    L["SILENCES"] = "Silences"
    L["STUNS"] = "Etourdissements"
    L["TAUNTS"] = "Provocations"
elseif locale == "itIT" then
    -- Categories

elseif locale == "koKR" then
    L["DISORIENTS"] = "방향 감각 상실"
    L["INCAPACITATES"] = "행동 불가"
    L["KNOCKBACKS"] = "밀쳐내기"
    L["ROOTS"] = "이동 불가"
    L["SILENCES"] = "침묵"
    L["STUNS"] = "기절"
elseif locale == "ptBR" then
    -- Categories

elseif locale == "ruRU" then
    L["DISARMS"] = "Разоружение"
    L["DISORIENTS"] = "Дезориентация"
    L["FEARS"] = "Опасения"
    L["INCAPACITATES"] = "Паралич"
    L["KNOCKBACKS"] = "Отбрасывание"
    L["RANDOM_ROOTS"] = "Случайные корни"
    L["RANDOM_STUNS"] = "Случайные оглушения"
    L["ROOTS"] = "Сковывание"
    L["SILENCES"] = "Немота"
    L["STUNS"] = "Оглушение"
    L["TAUNTS"] = "Насмешки"
elseif locale == "esES" or locale == "esMX" then
    L["DISARMS"] = "Desarmar"
    L["DISORIENTS"] = "Desorientar"
    L["FEARS"] = "Miedos"
    L["INCAPACITATES"] = "Incapacitar"
    L["KNOCKBACKS"] = "Derribos"
    L["RANDOM_ROOTS"] = "Raíces aleatorias"
    L["RANDOM_STUNS"] = "Aturdir aleatorio"
    L["ROOTS"] = "Raíces"
    L["SILENCES"] = "Silencios"
    L["STUNS"] = "Aturdimientos"
    L["TAUNTS"] = "Provocaciones"
elseif locale == "zhCN" then
    L["DISARMS"] = "缴械"
    L["DISORIENTS"] = "迷惑"
    L["FEARS"] = "恐惧"
    L["INCAPACITATES"] = "瘫痪"
    L["KNOCKBACKS"] = "击退"
    L["RANDOM_ROOTS"] = "随机定身"
    L["RANDOM_STUNS"] = "随机眩晕"
    L["ROOTS"] = "定身"
    L["SILENCES"] = "沉默"
    L["STUNS"] = "昏迷"
    L["TAUNTS"] = "嘲讽"
elseif locale == "zhTW" then
    L["DISARMS"] = "繳械"
    L["DISORIENTS"] = "迷惑"
    L["FEARS"] = "恐懼"
    L["INCAPACITATES"] = "癱瘓"
    L["KNOCKBACKS"] = "擊退"
    L["RANDOM_ROOTS"] = "隨機定身"
    L["RANDOM_STUNS"] = "隨機昏迷"
    L["ROOTS"] = "定身"
    L["SILENCES"] = "沉默"
    L["STUNS"] = "昏迷"
    L["TAUNTS"] = "嘲諷"
end
-- luacheck: pop
-------------------------------------------------------------------------------

-- Check what game version we're running
Lib.gameExpansion = ({
    [WOW_PROJECT_MAINLINE] = "retail",
    [WOW_PROJECT_CLASSIC] = "classic",
    [WOW_PROJECT_BURNING_CRUSADE_CLASSIC or 5] = "tbc",
    [WOW_PROJECT_WRATH_CLASSIC or 11] = "wotlk",
})[WOW_PROJECT_ID_RCE]

-- How long it takes for a DR to expire, in seconds.
Lib.resetTimes = {
    retail = {
        ["default"] = 18.5, -- 18 sec + 0.5 latency
        ["npc"] = 23, -- Against mobs it seems to last slightly longer, depending on server load
        ["knockback"] = 10.5, -- Knockbacks are immediately immune and only DRs for 10s
    },

    classic = {
        ["default"] = 20, -- dynamic between 15 and 20s
        ["npc"] = 23,
    },

    tbc = {
        ["default"] = 20, -- dynamic between 15 and 20s
        ["npc"] = 23,
    },

    wotlk = {
        ["default"] = 20, -- dynamic between 15 and 20s
        ["npc"] = 23,
    },
}

-- List of all DR categories, english -> localized.
Lib.categoryNames = {
    retail = {
        ["disorient"] = L.DISORIENTS,
        ["incapacitate"] = L.INCAPACITATES,
        ["silence"] = L.SILENCES,
        ["stun"] = L.STUNS,
        ["root"] = L.ROOTS,
        ["disarm"] = L.DISARMS,
        ["taunt"] = L.TAUNTS,
        ["knockback"] = L.KNOCKBACKS,
    },

    classic = {
        ["incapacitate"] = L.INCAPACITATES,
        ["stun"] = L.STUNS, -- controlled stun
        ["root"] = L.ROOTS, -- controlled root
        ["random_stun"] = L.RANDOM_STUNS, -- random proc stun, usually short (<3s)
        ["random_root"] = L.RANDOM_ROOTS,
        ["fear"] = L.FEARS,
        ["mind_control"] = L.MIND_CONTROL,
        ["frost_shock"] = L.FROST_SHOCK,
        ["kidney_shot"] = L.KIDNEY_SHOT,
    },

    tbc = {
        ["disorient"] = L.DISORIENTS,
        ["incapacitate"] = L.INCAPACITATES,
        ["stun"] = L.STUNS,
        ["random_stun"] = L.RANDOM_STUNS,
        ["random_root"] = L.RANDOM_ROOTS,
        ["root"] = L.ROOTS,
        ["disarm"] = L.DISARMS,
        ["fear"] = L.FEARS,
        ["scatter"] = L.SCATTERS,
        ["mind_control"] = L.MIND_CONTROL,
        ["kidney_shot"] = L.KIDNEY_SHOT,
        ["death_coil"] = L.DEATH_COIL,
        ["unstable_affliction"] = L.UNSTABLE_AFFLICTION,
        ["chastise"] = L.CHASTISE,
        ["counterattack"] = L.COUNTERATTACK,
    },

    wotlk = {
        ["incapacitate"] = L.INCAPACITATES,
        ["stun"] = L.STUNS,
        ["random_stun"] = L.RANDOM_STUNS,
        ["random_root"] = L.RANDOM_ROOTS,
        ["root"] = L.ROOTS,
        ["disarm"] = L.DISARMS,
        ["fear"] = L.FEARS,
        ["scatter"] = L.SCATTERS,
        ["silence"] = L.SILENCES,
        ["horror"] = L.HORROR,
        ["mind_control"] = L.MIND_CONTROL,
        ["cyclone"] = L.CYCLONE,
        ["charge"] = L.CHARGE,
        ["opener_stun"] = L.OPENER_STUN,
        ["counterattack"] = L.COUNTERATTACK,
    },
}

-- Categories that have DR against normal mobs.
-- Note that this is only for normal mobs on retail. Special mobs or pets have DR on all categories,
-- see UnitClassification() and UnitIsQuestBoss().
Lib.categoriesPvE = {
    retail = {
        ["taunt"] = L.TAUNTS, -- Lib.categoryNames.retail.taunt
        ["stun"] = L.STUNS,
        ["root"] = L.ROOTS,
    },

    classic = {
        ["stun"] = L.STUNS,
        ["kidney_shot"] = L.KIDNEY_SHOT,
    },

    tbc = {
        ["stun"] = L.STUNS,
        ["random_stun"] = L.RANDOM_STUNS,
        ["kidney_shot"] = L.KIDNEY_SHOT,
    },

    wotlk = {
        --["taunt"] = L.TAUNTS,
        ["stun"] = L.STUNS,
        ["random_stun"] = L.RANDOM_STUNS,
        ["opener_stun"] = L.OPENER_STUN,
    },
}

-- Successives diminished durations
Lib.diminishedDurations = {
    retail = {
        -- Decreases by 50%, immune at the 4th application
        ["default"] = { 0.50, 0.25 },
        -- Decreases by 35%, immune at the 5th application
        ["taunt"] = { 0.65, 0.42, 0.27 },
        -- Immediately immune
        ["knockback"] = {},
    },

    classic = {
        ["default"] = { 0.50, 0.25 },
    },

    tbc = {
        ["default"] = { 0.50, 0.25 },
    },

    wotlk = {
        ["default"] = { 0.50, 0.25 },
    },
}

-------------------------------------------------------------------------------
-- Public API
-------------------------------------------------------------------------------

--- Get table of all spells that DRs.
-- Key is the spellID, and value is the unlocalized DR category.
-- For Classic the key is the localized spell name instead, and value
-- is a table containing both the DR category and spell ID. (Classic has no spellID payload in the combat log)
-- @see IterateSpellsByCategory
-- @treturn ?table {number=string}|table {string=table}
function Lib:GetSpells()
    return Lib.spellList
end

--- Get table of all DR categories.
-- Key is unlocalized name used for API functions, value is localized name used for UI.
-- @treturn table {string=string}
function Lib:GetCategories()
    return Lib.categoryNames[Lib.gameExpansion]
end

--- Get table of all categories that DRs in PvE only.
-- Key is unlocalized name used for API functions, value is localized name used for UI.
-- Note that this is only for normal mobs on retail. Special mobs or pets have DR on all categories,
-- see UnitClassification() and UnitIsQuestBoss().
-- Tip: you can combine :GetPvECategories() and :IterateSpellsByCategory() to get spellIDs only for PvE aswell.
-- @treturn table {string=string}
function Lib:GetPvECategories()
    return Lib.categoriesPvE[Lib.gameExpansion]
end

--- Get constant for how long a DR lasts for a given category.
-- @tparam[opt="default"] string category Unlocalized category name, or "npc" for PvE timer.
-- @treturn number
function Lib:GetResetTime(category)
    return Lib.resetTimes[Lib.gameExpansion][category or "default"] or Lib.resetTimes[Lib.gameExpansion].default
end

--- Get unlocalized DR category by spell ID.
-- For Classic (vanilla) you should pass in the spell name instead of ID.
-- For Classic you also get an optional second return value
-- which is the hardcoded spell ID of the spell name you passed in.
-- You should use this ID to query additional info from Blizzard API if needed, as
-- spell names only works for the player if they have the spell in their current spellbook.
-- @tparam number spellID
-- @treturn[1] string|nil The category name.
-- @treturn[2] number|nil The spell ID. (Classic only)
function Lib:GetCategoryBySpellID(spellID)
    if Lib.gameExpansion == "classic" then
        -- special case for classic as CLEU doesn't provide spellIDs
        local data = Lib.spellList[spellID]
        if not data then return end
        return data.category, data.spellID
    end

    return Lib.spellList[spellID]
end

--- Get localized category from unlocalized category name, case sensitive.
-- @tparam string category Unlocalized category name
-- @treturn ?string|nil The localized category name.
function Lib:GetCategoryLocalization(category)
    return Lib.categoryNames[Lib.gameExpansion][category]
end

--- Check if a category has DR against mobs.
-- Note that this is only for normal mobs on retail. Special mobs or pets have DR on all categories,
-- see UnitClassification() and UnitIsQuestBoss().
-- @tparam string category Unlocalized category name
-- @treturn bool
function Lib:IsPvECategory(category)
    return Lib.categoriesPvE[Lib.gameExpansion][category] and true or false -- make sure bool is always returned here
end

--- Get next successive diminished duration
-- @tparam number diminished How many times the DR has been applied so far
-- @tparam[opt="default"] string category Unlocalized category name
-- @usage local reduction = DRList:GetNextDR(1) -- returns 0.50, half duration on debuff
-- @treturn number DR percentage in decimals. Returns 0 if max DR is reached or arguments are invalid.
function Lib:GetNextDR(diminished, category)
    local durations = Lib.diminishedDurations[Lib.gameExpansion][category or "default"]
    if not durations and Lib.categoryNames[Lib.gameExpansion][category] then
        -- Redirect to default when "stun", "root" etc is passed
        durations = Lib.diminishedDurations[Lib.gameExpansion]["default"]
    end

    return durations and durations[diminished] or 0
end

do
    local next = _G.next

    local function CategoryIterator(category, index)
        local spellList, newCat = Lib.spellList
        repeat
            index, newCat = next(spellList, index)
            if index then
                if newCat == category or newCat.category == category then
                    return index, category
                end
            end
        until not index
    end

    --- Iterate through the spells of a given category.
    -- @tparam string category Unlocalized category name
    -- @usage for spellID in DRList:IterateSpellsByCategory("root") do print(spellID) end
    -- @warning Slow function, do not use for frequent combat related stuff unless you cache results.
    -- @return Iterator function
    function Lib:IterateSpellsByCategory(category)
        assert(Lib.categoryNames[Lib.gameExpansion][category], "invalid category")
        return CategoryIterator, category
    end
end

-- keep same API as DRData-1.0 for easier transitions
Lib.GetCategoryName = Lib.GetCategoryLocalization
Lib.IsPVE = Lib.IsPvECategory
Lib.NextDR = Lib.GetNextDR
Lib.GetSpellCategory = Lib.GetCategoryBySpellID
Lib.IterateSpells = Lib.IterateSpellsByCategory
Lib.RESET_TIME = Lib.resetTimes[Lib.gameExpansion].default
Lib.pveDR = Lib.categoriesPvE
