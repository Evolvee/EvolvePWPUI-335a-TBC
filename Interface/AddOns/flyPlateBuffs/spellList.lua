local _, fPB = ...

local defaultSpells1 = {--Highest prio spells (distinguished via size by default...)

	45438, --Ice Block
	642, --Divine Shield
	498, --Divine Protection
	31224, --Cloak of Shadows
	
	--CCs (gonna have to rewrite this in case I ever want to play wotlk-hopefully never, dogshit expansion for DK retards):
	
	20549, --War Stomp
    28730, --Arcane Torrent (Mana)
    25046, --Arcane Torrent (Energy)
    50613, --Arcane Torrent (Runic Power)
    30457, --Complete Vulnerability
    1090, --Magic Dust
    13327, --Reckless Charge
    835, --Tidal Charm
    5134, --Flash Bomb
    19769, --Thorium Grenade
    4068, --Iron Grenade
    15753, --Linken's Boomerang Stun
    13237, --Goblin Mortar trinket
    47476, --Strangulate
    47481, --Gnaw
    51209, --Hungering Cold
    64044, --Psychic Horror (Horrify)
    64058, --Psychic Horror (Disarm)
    605, --Mind Control
    8122, --Psychic Scream
    15487, --Silence
    9484, --Shackle Undead
    47860, --Death Coil
    47995, --Intercept (Felguard)
    60995, --Demon Charge (Metamorphosis)
    24259, --Spell Lock Silence
    6358, --Seduction
    5782, --Fear
    5484, --Howl of Terror
    710, --Banish
    6789, --Death Coil
    18093, --Pyroclasm
    22703, --Inferno Effect
    30283, --Shadowfury
    43523, --Unstable Affliction
    32752, --Summoning Disorientation
    19482, --Doom Guard Stun
    30153, --Felguard Stun
    51514, --Hex
    58861, --Bash (Spirit Wolf)
    39796, --Stoneclaw Totem
    48817, --Holy Wrath
    63529, --Silenced - Shield of the Templar
    853, --Hammer of Justice
    20066, --Repentance
    20170, --Seal of Justice stun
    10326, --Turn Evil
    49012, --Wyvern Sting
    53359, --Chimera Shot - Scorpid (Disarm)
    53543, --Snatch (Pet Disarm)
    60210, --Freezing Arrow Effect
    1513, --Scare Beast
    3355, --Freezing Trap
    19386,  --Wyvern Sting
    19503, --Scatter Shot
    34490, --Silencing Shot
    24394, --Intimidation
    49802, --Maim
    49803, --Pounce
    2637, --Hibernate
    9005, --Pounce Stun
    16922, --Starfire Stun
    5211, --Bash
    33786, --Cyclone
    42950, --Dragon's Breath
    44572, --Deep Freeze
    55021, --Improved Counterspell
    64346, --Fiery Payback (Fire Mage Disarm)
    18469, --Improved Counterspell
    118, --Polymorph
    12355, --Impact Stun
    31661, --Dragon's Breath
    18425, --Improved Kick
    1833, --Cheap Shot
    408, --Kidney Shot
    2070, --Sap
    2094, --Blind
    1776, --Gouge
    1330, --Garrote Silence
    46968, --Shockwave
    18498, --Improved Shield Bash
    20253, --Intercept Stun
    12798, --Revenge Stun
    12809, --Concussion Blow
    7922, --Charge Stun
    5530, --Mace Spec Stun (Warrior & Rogue)
    5246, --Intimidating Shout



}

local defaultSpells2 = {--2nd Highest prio spells :shrug: idk kev xd

	16188, --NS(shaman)
	17116, --NS(druid)
	18708, --Feldom
	1022, --Blessing of Protection
	6346, --Fear Ward
	30457, --eng belt backfire debuff
	30458, --eng belt absorb
	30456, --eng belt absorb
	3411, --intervene
	5024, --chicken (skull of impending doom)
}
fPB.defaultSpells1 = defaultSpells1
fPB.defaultSpells2 = defaultSpells2
