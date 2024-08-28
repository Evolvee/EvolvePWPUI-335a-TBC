local addon, ATTdefault = ...

ATTdefault.defaultAbilities = {
    ["GENERAL"] = {
        ["ALL"] = {    -- All specs
        },
    },
    ["DRUID"] = {
        ["ALL"] = {
            { 29166, 360 }, -- Innervate
            { 8983, 60 }, -- Bash
            { 22812, 60 }, -- Barkskin
        }
    },
    ["HUNTER"] = {
        ["ALL"] = {
            { 14311, 30 }, -- Freezing Trap
            { 19503, 30 }, -- Scatter Shot
            { 27068, 180 }, -- Wyvern Sting
        }
    },
    ["MAGE"] = {
        ["ALL"] = {
            { 2139, 24 }, -- Counterspell
            { 45438, 300 }, -- Ice Block
            { 27088, 21 }, -- Frostnova
            { 11958, 384 }, -- Cold Snap
            { 12472, 180 }, -- Icy Veins
            { 31687, 180 }, -- Summon Water Elemental
        }
    },
    ["PALADIN"] = {
        ["ALL"] = {
            { 10308, 50 }, -- Hammer of Justice
            { 1044, 25 }, -- Blessing Hand of Freedom
            { 27148, 30 }, -- Blessing of Sacrifice
            { 10278, 180 }, -- Blessing of Protection
            { 1020, 300 }, -- Divine Shield
        }
    },
    ["PRIEST"] = {
        ["ALL"] = {
            { 10890, 27 }, -- Psychic Scream
            { 33206, 120 }, -- Pain Suppression
            { 10060, 180 }, -- Power Infusion
            { 34433, 300 }, -- Shadowfiend
        }
    },
    ["ROGUE"] = {
        ["ALL"] = {
            { 2094, 90 }, -- Blind
            { 26889, 210 }, -- Vanish
            { 14185, 600 }, -- Preparation
            { 1766, 10 }, -- Kick
            { 31224, 60 }, -- Cloak of Shadows
        }
    },
    ["SHAMAN"] = {
        ["ALL"] = {
            { 25454, 6 }, -- Earth Shock
            { 16190, 300 }, -- Manatide
        }
    },
    ["WARLOCK"] = {
        ["ALL"] = {
            { 19647, 24 }, -- Spell Lock
            { 17925, 120 }, -- Death Coil
        }
    },
    ["WARRIOR"] = {
        ["ALL"] = {
            { 25275, 15 }, -- Intercept
            { 43443, 10 }, -- Spell Reflection
            { 3411, 30 }, -- Intervene
            { 6552, 10 }, -- Pummel
        }
    },
}