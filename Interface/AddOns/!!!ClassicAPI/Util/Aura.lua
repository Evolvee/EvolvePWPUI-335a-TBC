local UnitAura = UnitAura
local UnitBuff = UnitBuff
local UnitDebuff = UnitDebuff
local GetSpellInfo = GetSpellInfo
local UnitAffectingCombat = UnitAffectingCombat

local _, CLASS_PLAYER = UnitClass("player")

local AURA

function SpellIsPriorityAura(SpellID)
    return false
end

function SpellCanApplyAura(SpellName)
    local Info = (SpellName) and AURA[SpellName]
    return (Info and Info.CanApply)
end

function SpellAppliesOnlyYourself(SpellName)
    local Info = (SpellName) and AURA[SpellName]
    return (Info and Info.SelfOnly)
end

function SpellIsSelfBuff(SpellID)
    if ( SpellID ) then
        local SpellName = GetSpellInfo(SpellID)
        local Info = (SpellName) and AURA[SpellName]

        if ( Info ) then
            return Info.SelfOnly, Info.CanApply
        end
    end
end

function SpellGetVisibilityInfo(SpellID, Type)
    if ( SpellID and Type ) then
        local SpellName = GetSpellInfo(SpellID)
        local Info = (SpellName) and AURA[SpellName]

        if ( Info ) then
            local ShowMine, ShowSpec
            if ( Type == "RAID_INCOMBAT" ) then
                ShowMine = Info.ShowMine_INCOMBAT
                ShowSpec = Info.ShowSpec_INCOMBAT
            elseif ( Type == "RAID_OUTOFCOMBAT" ) then
                ShowMine = Info.ShowMine_OUTCOMBAT
                ShowSpec = Info.ShowSpec_OUTCOMBAT
            end

            return (ShowMine ~= nil or ShowSpec ~= nil), ShowMine, ShowSpec
        end
    end
end

--[[

    Aura Information

]]

local function Aura(SpellID, CanApply, SelfOnly, ShowMine_INCOMBAT, ShowMine_OUTCOMBAT, ShowSpec_INCOMBAT, ShowSpec_OUTCOMBAT)
    AURA = AURA or {}

    AURA[GetSpellInfo(SpellID)] = {
        CanApply = CanApply, -- Player can cast it.
        SelfOnly = SelfOnly, -- Spell is not usable on others.

       --[[
            Combat State Information: RAID_INCOMBAT, RAID_OUTOFCOMBAT
                ShowMine: whether to show the spell if cast by the player/player's pet/vehicle (e.g. the Paladin Forbearance debuff)
                ShowSpec: whether to show the spell for the current specialization of the player, it will override all others if set.
        ]]
        ShowMine_INCOMBAT = ShowMine_INCOMBAT,
        ShowMine_OUTCOMBAT = ShowMine_OUTCOMBAT,

        ShowSpec_INCOMBAT = ShowSpec_INCOMBAT,
        ShowSpec_OUTCOMBAT = ShowSpec_OUTCOMBAT,
    }
end

if ( CLASS_PLAYER == "DEATHKNIGHT" ) then
    Aura(48265, true, true) -- Unholy Presence
    Aura(48263, true, true) -- Frost Presence
    Aura(48266, true, true) -- Blood Presence
    Aura(45529, true, true) -- Blood Tap
    Aura(49016, true, false) -- Hysteria
    Aura(57330, true, false) -- Horn of Winter
    Aura(49028, true, false) -- Dancing Rune Weapon

    Aura(3714, true, false, false, true) -- Path of Frost
elseif ( CLASS_PLAYER == "DRUID" ) then
    Aura(29166, true, false) -- Innervate
    Aura(9634, true, true) -- Dire Bear Form
    Aura(768, true, true) -- Cat Form
    Aura(48451, true, false) -- Lifebloom
    Aura(48441, true, false) -- Rejuvenation
    Aura(48443, true, false) -- Regrowth
    Aura(53251, true, false) -- Wild Growth
    Aura(61336, true, true) -- Survival Instincts
    Aura(50334, true, true) -- Berserk
    Aura(5229, true, true) -- Enrage
    Aura(22812, true, true) -- Barkskin
    Aura(53312, true, true) -- Nature's Grasp
    Aura(22842, true, true) -- Frenzied Regeneration
    Aura(2893, true, false) -- Abolish Poison

    Aura(467, true, false, false, true) -- Thorns
    Aura(1126, true, false, false, true) -- Mark of the Wild
    Aura(21849, true, false, false, true) -- Gift of the Wild
elseif ( CLASS_PLAYER == "HUNTER" ) then
    Aura(5384, true, true) -- Feign Death
    Aura(3045, true, true) -- Rapid Fire
    Aura(53480, true, false) -- Roar of Sacrifice
    Aura(53271, true, false) -- Master's Call
    Aura(53476, true, false) -- Intervene

    Aura(19506, true, false, false, true) -- Trueshot Aura
elseif ( CLASS_PLAYER == "MAGE" ) then
    Aura(43039, true, true) -- Ice Barrier
    Aura(45438, true, true) -- Ice Block
    Aura(43012, true, true) -- Frost Ward
    Aura(43008, true, true) -- Ice Armor
    Aura(7301, true, true) -- Frost Armor
    Aura(12472, true, true) -- Icy Veins
    Aura(43010, true, true) -- Fire Ward
    Aura(43046, true, true) -- Molten Armor
    Aura(43020, true, true) -- Mana Shield
    Aura(43024, true, true) -- Mage Armor
    Aura(66, true, true) -- Invisibility
    Aura(130, true, false) -- Slow Fall
    Aura(11213, true, true) -- Arcane Concentration
    Aura(12043, true, true) -- Presence of Mind
    Aura(12042, true, true) -- Arcane Power
    Aura(31579, true, true) -- Arcane Empowerment

    Aura(61024, true, false, false, true) -- Dalaran Intellect
    Aura(61316, true, false, false, true) -- Dalaran Brilliance
    Aura(42995, true, false, false, true) -- Arcane Intellect
    Aura(43002, true, false, false, true) -- Arcane Brilliance
    Aura(43015, true, false, false, true) -- Dampen Magic
    Aura(54646, true, false, false, true) -- Focus Magic
elseif ( CLASS_PLAYER == "PALADIN" ) then
    Aura(53601, true, false) -- Sacred Shield
    Aura(53563, true, false) -- Beacon of Light
    Aura(6940, true, false) -- Hand of Sacrifice
    Aura(64205, true, false) -- Divine Sacrifice
    Aura(31821, true, true) -- Aura Mastery
    Aura(642, true, true) -- Divine Shield
    Aura(1022, true, false) -- Hand of Protection
    Aura(1044, true, false) -- Hand of Freedom
    Aura(54428, true, true) -- Divine Plea
    Aura(48952, true, true) -- Holy Shield
    Aura(48942, true, true) -- Devotion Aura
    Aura(54043, true, true) -- Retribution Aura
    Aura(19746, true, true) -- Concentration Aura
    Aura(48943, true, true) -- Shadow Resistance Aura
    Aura(48945, true, true) -- Frost Resistance Aura
    Aura(48947, true, true) -- Fire Resistance Aura
    Aura(32223, true, true) -- Crusader Aura
    Aura(31884, true, true) -- Avenging Wrath
    Aura(54203, true, false) -- Sheath of Light
    Aura(20053, true, true) -- Vengeance
    Aura(59578, true, true) -- The Art of War

    Aura(20217, true, false, false, true) -- Blessing of Kings
    Aura(25898, true, false, false, true) -- Greater Blessing of Kings
    Aura(48936, true, false, false, true) -- Blessing of Wisdom
    Aura(48938, true, false, false, true) -- Greater Blessing of Wisdom
    Aura(48932, true, false, false, true) -- Blessing of Might
    Aura(48934, true, false, false, true) -- Greater Blessing of Might
    Aura(25899, true, false, false, true) -- Greater Blessing of Sanctuary
    Aura(20911, true, false, false, true) -- Blessing of Sanctuary
elseif ( CLASS_PLAYER == "PRIEST" ) then
    Aura(48111, true, false) -- Prayer of Mending
    Aura(33206, true, false) -- Pain Suppression
    Aura(48068, true, false) -- Renew
    Aura(48066, true, false) -- Power Word: Shield
    Aura(72418, true, true) -- Chilling Knowledge
    Aura(47930, false, false) -- Grace
    Aura(10060, true, false) -- Power Infusion
    Aura(586, true, true) -- Fade
    Aura(48168, true, true) -- Inner Fire
    Aura(14751, true, true) -- Inner Focus
    Aura(6346, true, false) -- Fear Ward
    Aura(64901, true, false) -- Hymn of Hope
    Aura(1706, true, false) -- Levitate
    Aura(64843, false, false) -- Divine Hymn
    Aura(59891, false, false) -- Borrowed Time
    Aura(552, true, false) -- Abolish Disease
    Aura(15473, true, true) -- Shadowform
    Aura(15286, true, true) -- Vampiric Embrace
    Aura(49694, true, true) -- Improved Spirit Tap
    Aura(47788, true, false) -- Guardian Spirit
    Aura(33151, true, true) -- Surge of Light
    Aura(33151, true, true) -- Inspiration
    Aura(7001, true, false) -- Lightwell Renew
    Aura(27827, true, true) -- Spirit of Redemption
    Aura(63734, true, true) -- Serendipity
    Aura(65081, true, false) -- Body and Soul
    Aura(63944, false, false) -- Renewed Hope

    Aura(48073, true, false, false, true) -- Divine Spirit
    Aura(48074, true, false, false, true) -- Prayer of Spirit
    Aura(48169, true, false, false, true) -- Shadow Protection
    Aura(48170, true, false, false, true) -- Prayer of Shadow Protection
    Aura(48162, true, false, false, true) -- Prayer of Fortitude
    Aura(48161, true, false, false, true) -- Power Word: Fortitude
elseif ( CLASS_PLAYER == "ROGUE" ) then
    Aura(1784, true, true) -- Stealth
    Aura(31665, true, true) -- Master of Subtlety
    Aura(26669, true, true) -- Evasion
    Aura(11305, true, true) -- Sprint
    Aura(26888, true, true) -- Vanish
    Aura(36554, true, true) -- Shadowstep
    Aura(48659, true, true) -- Feint
    Aura(31224, true, true) -- Clock of Shadow
    Aura(51713, true, true) -- Shadow dance
    Aura(14177, true, true) -- Cold Blood
    Aura(57934, true, false) -- Tricks of the Trade
elseif ( CLASS_PLAYER == "SHAMAN" ) then
    Aura(49284, true, false) -- Earth Shield
    Aura(8515, false, false) -- Windfury Totem
    Aura(8178, true, false) -- Grounding Totem
    Aura(32182, true, false) -- Heroism
    Aura(2825, true, false) -- Bloodlust
    Aura(61301, true, false) -- Riptide
    Aura(51466, true, false) -- Elemental Oath
elseif ( CLASS_PLAYER == "WARLOCK" ) then
    Aura(2947, true, false) -- Fire Shield
    Aura(132, true, false) -- Detect Invisibility
    Aura(19028, true, false) -- Soul Link
    Aura(54424, true, false) -- Fel Intelligence
elseif ( CLASS_PLAYER == "WARRIOR" ) then
    Aura(2687, true, true) -- Bloodrage
    Aura(18499, true, true) -- Berserker Rage
    Aura(12328, true, true) -- Sweeping Strikes
    Aura(23920, true, true) -- Spell Reflection
    Aura(871, true, true) -- Shield Wall
    Aura(2565, true, true) -- Shield Block
    Aura(55694, true, true) -- Enraged Regeneration
    Aura(1719, true, true) -- Recklessness
    Aura(57522, true, true) -- Enrage
    Aura(20230, true, true) -- Retaliation
    Aura(46924, true, true) -- Bladestorm
    Aura(47440, true, false) -- Commanding Shout
    Aura(47436, true, false) -- Battle Shout
    Aura(46913, true, true) -- Bloodsurge
    Aura(12292, true, true) -- Death Wish
    Aura(16492, true, true) -- Blood Craze
    Aura(65156, true, true) -- Juggernaut
    Aura(3411, true, false) -- Intervene
end

--[[

    Global Auras

]]

Aura(69127, nil, nil, nil, nil, false, true) -- Chill of the Throne
Aura(26013, nil, nil, nil, nil, false, true) -- Deserter
Aura(31694, nil, nil, nil, nil, false, false) -- Strange Feeling
Aura(70013, nil, nil, nil, nil, false, false) -- Quel'Delar's Compulsion

-- TODO: Add PvP flags as a priority buff.

--[[

    UNITAURA / UNITBUFF / UNITDEBUFF
    Modern payload.

]]

function C_UnitAura(...)
    local Name, Rank, Icon, Count, Type, Duration, Expire, Caster, Steal, Consolidate, ID = UnitAura(...)
    local Aura = AURA[Name]
    return Name, Icon, Count, Type, Duration, Expire, Caster, Steal, Consolidate, ID, (Aura and Aura.CanApply)
end

function C_UnitBuff(...)
    local Name, Rank, Icon, Count, Type, Duration, Expire, Caster, Steal, Consolidate, ID = UnitBuff(...)
    local Aura = AURA[Name]
    return Name, Icon, Count, Type, Duration, Expire, Caster, Steal, Consolidate, ID, (Aura and Aura.CanApply)
end

function C_UnitDebuff(...)
    local Name, Rank, Icon, Count, Type, Duration, Expire, Caster, Steal, Consolidate, ID = UnitDebuff(...)
    return Name, Icon, Count, Type, Duration, Expire, Caster, Steal, Consolidate, ID
end

--[[

    CompactUnitFrame_UtilShouldDisplayDebuff
    Note: Support if CompactRaidFrames not installed.

]]
local SpellGetVisibilityInfo = SpellGetVisibilityInfo

function CompactUnitFrame_UtilShouldDisplayDebuff(...)
    local _, _, _, _, _, _, _, Caster, _, _, SpellID = UnitDebuff(...)

    if ( SpellID ) then
        local HasCustom, AlwaysShowMine, ShowForMySpec = SpellGetVisibilityInfo(SpellID, UnitAffectingCombat("player") and "RAID_INCOMBAT" or "RAID_OUTOFCOMBAT")
        if ( HasCustom ) then
            return ShowForMySpec or (AlwaysShowMine and (Caster == "player" or Caster == "pet" or Caster == "vehicle"))
        end

        return true
    end
end

--[[ TODO
function UnitAuraBySlot(unit, slot)
    if ( unit and LibAura ) then
        return LibAura:UnitAuraBySlot(unit, slot)
    end
end

function UnitAuraSlots(unit, filter, maxCount, continuationToken)
    if ( unit and LibAura ) then
        return LibAura:UnitAuraSlots(unit, filter, maxCount, continuationToken)
    end
end]]