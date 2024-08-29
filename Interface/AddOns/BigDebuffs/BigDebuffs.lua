-- BigDebuffs by Jordon
-- Backported and general improvements by Konjunktur and Friskes
-- Spell list and minor improvements by Apparent, Friskes, Asuri

BigDebuffs = LibStub("AceAddon-3.0"):NewAddon("BigDebuffs", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("BigDebuffs")
local SML = LibStub:GetLibrary("LibSharedMedia-3.0")

--Lua functions
local _G = _G
local select, unpack, pairs, type, ceil = select, unpack, pairs, type, ceil
local tinsert, gsub = table.insert, string.gsub

--WoW API / Variables
local CreateFrame = CreateFrame
local IsInInstance = IsInInstance
local UnitGUID = UnitGUID
local GetTime = GetTime
local UIParent = UIParent
local InCombatLockdown = InCombatLockdown
local LoadAddOn = LoadAddOn
local GetSpellInfo = GetSpellInfo
local SetPortraitToTexture = SetPortraitToTexture
local UnitDebuff, UnitBuff = UnitDebuff, UnitBuff
local UnitAura = UnitAura
local GetUnitName = GetUnitName

local InArena = function() return (select(2,IsInInstance() ) == "arena") end

local timeThreshold

-- Defaults
local defaults = {
	profile = {
		unitFrames = {
			enabled = true,
			circleCooldown = true,
			hideCDanimation = false,
			drawEdge = true,
			cooldownCount = true,
			customTimer = false,
			hideBorder = false,
			interruptIcon = true,
			timeThreshold = 2,
			customTimerSize = 1.9,
			font = "Friz Quadrata TT",
			outline = "OUTLINE",

			player = {
				enabled = true,
				inArena = false,
				duplicatePlayer = true,
				anchor = "manual",
				position = {
					"CENTER",
					nil,
					"CENTER",
					-0.3081255461148491,
					-23.50601161447843,
				},
				size = 44,
				alpha = 1,

				immunities = true,
				cc = true,
				silence = true,
				interrupts = true,
				roots = true,
				disarm = true,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
			playerFAKE = {
			},
			pet = {
				enabled = true,
				inArena = false,
				anchor = "manual",
				position = {
					"TOPLEFT",
					nil,
					"TOPLEFT",
					231.2065903962022,
					-188.9598644181945,
				},
				size = 55.5,
				alpha = 1,

				immunities = false,
				cc = true,
				silence = false,
				interrupts = false,
				roots = true,
				disarm = false,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
			target = {
				enabled = true,
				inArena = false,
				enabledtargettarget = true,
				anchor = "auto",
				size = 50,
				alpha = 1,

				immunities = true,
				cc = true,
				silence = true,
				interrupts = true,
				roots = true,
				disarm = true,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
			targettarget = {
			},
			focus = {
				enabled = true,
				inArena = false,
				enabledfocustarget = true,
				anchor = "auto",
				size = 50,
				alpha = 1,

				immunities = true,
				cc = true,
				silence = true,
				interrupts = true,
				roots = true,
				disarm = true,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
			focustarget = {
			},
			party = {
				enabled = true,
				inArena = true,
				anchor = "auto",
				size = 50,
				alpha = 1,

				immunities = true,
				cc = true,
				silence = true,
				interrupts = true,
				roots = true,
				disarm = true,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
			partypet = {
				enabled = false,
				inArena = true,
				anchor = "auto",
				size = 50,
				alpha = 1,

				immunities = true,
				cc = true,
				silence = true,
				interrupts = true,
				roots = true,
				disarm = true,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
			arena = {
				enabled = true,
				anchor = "auto",
				size = 50,
				alpha = 1,

				immunities = true,
				cc = true,
				silence = true,
				interrupts = true,
				roots = true,
				disarm = true,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
			arenapet = {
				enabled = false,
				anchor = "auto",
				size = 50,
				alpha = 1,

				immunities = true,
				cc = true,
				silence = true,
				interrupts = true,
				roots = true,
				disarm = true,
				buffs_defensive = false,
				buffs_offensive = false,
				buffs_other = false,
				snare = false,
			},
		},
		priority = {
			immunities = 65,
			cc = 70,
			silence = 60,
			interrupts = 55,
			roots = 50,
			disarm = 45,
			buffs_defensive = 40,
			buffs_offensive = 35,
			buffs_other = 30,
			snare = 25,
		},
		spells = {
			[33786] = {
				priority = 100,
				customPriority = true,
			},
		},
	},
}

BigDebuffs.Spells = {
	-- Death Knight
	[48707] = { type = "immunities", }, -- Anti-Magic Shell
	[49203] = { type = "cc", }, -- Hungering Cold
		[51209] = { parent = 49203, },
	[47476] = { type = "silence", }, -- Strangulate
	[47528] = { type = "interrupts", duration = 4, }, -- Mind Freeze
	[49039] = { type = "buffs_defensive", }, -- Lichborne
	[48792] = { type = "buffs_defensive", }, -- Icebound Fortitude
	[50461] = { type = "buffs_defensive", }, -- Anti-Magic Zone
	[49028] = { type = "buffs_offensive", }, -- Dancing Rune Weapon // might not work - spell id vs aura
	[45524] = { type = "snare", }, -- Chains of Ice
	[55666] = { type = "snare", }, -- Desecration (no duration, lasts as long as you stand in it)
		[68766] = { parent = 55666, },
		[55741] = { parent = 55666, },
	[58617] = { type = "snare", }, -- Glyph of Heart Strike
	[50436] = { type = "snare", }, -- Icy Clutch (Chilblains)
	
	-- Death Knight Pet
	[47481] = { type = "cc", }, -- Gnaw (Ghoul)
	[47484] = { type = "buffs_defensive", }, -- Huddle (Ghoul)
	
	-- Druid
	[33786] = { type = "cc", }, -- Cyclone
	[49802] = { type = "cc", }, -- Maim
		[22570] = { parent = 49802, },
	[8983] = { type = "cc", }, -- Bash
		[5211] = { parent = 8983, },
		[6798] = { parent = 8983, },
	[18658] = { type = "cc", }, -- Hibernate
		[2637] = { parent = 18658, },
		[18657] = { parent = 18658, },
	[49803] = { type = "cc", }, -- Pounce
		[9005] = { parent = 49803, },
		[9823] = { parent = 49803, },
		[9827] = { parent = 49803, },
		[27006] = { parent = 49803, },
	[16979] = { type = "interrupts", duration = 4, }, -- Feral Charge Effect (Interrupt)
	[45334] = { type = "roots", }, -- Feral Charge Effect (Immobilize)
	[53308] = { type = "roots", }, -- Entangling Roots
		[339] = { parent = 53308, },
		[1062] = { parent = 53308, },
		[5195] = { parent = 53308, },
		[5196] = { parent = 53308, },
		[9852] = { parent = 53308, },
		[9853] = { parent = 53308, },
		[26989] = { parent = 53308, },
		[53313] = { parent = 53308, },       -- Entangling Roots (From Nature's Grasp)
	[17116] = { type = "buffs_defensive", }, -- Nature's Swiftness
	[61336] = { type = "buffs_defensive", },  -- Survival Instincts
	[22812] = { type = "buffs_defensive", },  -- Barkskin
	[29166] = { type = "buffs_offensive", },  -- Innervate
		[54833] = { parent = 29166, },        -- Glyph Innervate
	[50334] = { type = "buffs_offensive", },  -- Berserk
	[69369] = { type = "buffs_offensive", },  -- Predator's Swiftness
	[53201] = { type = "buffs_offensive", },  -- Starfall
		[48505] = { parent = 53201, },
		[53199] = { parent = 53201, },
		[53200] = { parent = 53201, },
	[53312] = { type = "buffs_other", },      -- Nature's Grasp
	[33357] = { type = "buffs_other", },      -- Dash
	[768] = { type = "buffs_other", },        -- Cat Form
	[9634] = { type = "buffs_other", },       -- Dire Bear Form
	[783] = { type = "buffs_other", },        -- Travel Form
	[24858] = { type = "buffs_other", },      -- Moonkin Form
	[33891] = { type = "buffs_other", },      -- Tree of Life
	[58179] = { type = "snare", },            -- Infected Wounds
		[58181] = { parent = 58179, },
	[61391] = { type = "snare", },            -- Typhoon
		[61390] = { parent = 61391, },
		[61388] = { parent = 61391, },
		[61387] = { parent = 61391, },
		[53227] = { parent = 61391, },
	[50259] = { type = "snare", },            -- Typhoon, Moonkins Daze knockback
		[50411] = { parent = 50259, },
		
	-- Hunter
	[34471] = { type = "immunities", },       -- The Beast Within
		[34692] = { parent = 34471, },
	[19263] = { type = "immunities", },       -- Deterrence
	[24394] = { type = "cc", },               -- Intimidation (Stun)
	[49012] = { type = "cc", },               -- Wyvern Sting
		[19386] = { parent = 49012, },
		[24132] = { parent = 49012, },
		[24133] = { parent = 49012, },
		[27068] = { parent = 49012, },
		[49011] = { parent = 49012, },
	[19503] = { type = "cc", },               -- Scatter Shot
	[14309] = { type = "cc", },               -- Freezing Trap
		[3355] = { parent = 14309, },
		[14308] = { parent = 14309, },
	[60210] = { type = "cc", },               -- Freezing Arrow Effect
	[14327] = { type = "cc", },               -- Scare Beast
		[1513] = { parent = 14327, },
		[14326] = { parent = 14327, },
	[34490] = { type = "silence", },          -- Silencing Shot
	[48999] = { type = "roots", },            -- Counterattack
		[19306] = { parent = 48999, },
		[20909] = { parent = 48999, },
		[20910] = { parent = 48999, },
		[27067] = { parent = 48999, },
		[48998] = { parent = 48999, },
	[19185] = { type = "roots", },            -- Entrapment
		[64803] = { parent = 19185, },
		[19388] = { parent = 19185, },
		[19184] = { parent = 19185, },
		[19387] = { parent = 19185, },
		[64804] = { parent = 19185, },
	[53359] = { type = "disarm", },            -- Chimera Shot - Scorpid (Disarm)
	[5384] = { type = "buffs_defensive", },    -- Feign Death
	[54216] = { type = "buffs_defensive", },   -- Master's Call
		[62305] = { parent = 54216, },
	[3034] = { type = "buffs_other", },        -- Viper Sting
	[49050] = { type = "buffs_other", },       -- Aimed Shot
	[49065] = { type = "buffs_other", },       -- Explosive Trap AoE Aura
	[5118] = { type = "buffs_other", },        -- Aspect of the Cheetah
		[13159] = { parent = 5118, },          -- Aspect of the Pack
	[35101] = { type = "snare", },             -- Concussive Barrage
	[5116] = { type = "snare", },              -- Concussive Shot
	[13810] = { type = "snare", },             -- Frost Trap Aura (no duration, lasts as long as you stand inside)
	[61394] = { type = "snare", }, -- Glyph of Freezing Trap
	[2974] = { type = "snare", }, -- Wing Clip
	[15571] = { parent = 50259, }, -- Daze, Feral Charge (Cat Form)
	[30981] = { type = "snare", }, -- Crippling Poison (Slow 12s. Hunter's Snake Trap)

	-- Hunter Pets
	[19574] = { type = "immunities", }, -- Bestial Wrath (Pet)
	[53562] = { type = "cc", }, -- Ravage (Pet)
		[50518] = { parent = 53562, },
	[50519] = { type = "cc", }, -- Sonic Blast (Bat)
		[53568] = { parent = 50519, },
		[53564] = { parent = 50519, },
		[53565] = { parent = 50519, },
		[53566] = { parent = 50519, },
		[53567] = { parent = 50519, },
	[26090] = { type = "interrupts", duration = 2, }, -- Pummel (Pet)
	[53548] = { type = "roots", }, -- Pin (Pet)
		[50245] = { parent = 53548, },
		[53544] = { parent = 53548, },
		[53545] = { parent = 53548, },
		[53546] = { parent = 53548, },
		[53547] = { parent = 53548, },
	[4167] = { type = "roots", }, -- Web (Pet)
	[54706] = { type = "roots", }, -- Venom Web Spray (Silithid)
		[55509] = { parent = 54706, },
		[55505] = { parent = 54706, },
		[55506] = { parent = 54706, },
		[55507] = { parent = 54706, },
		[55508] = { parent = 54706, },
	[53148] = { type = "roots", }, -- Dash (Root 1s Hunter Pet)
	[53543] = { type = "disarm", }, -- Snatch (Pet Disarm)
		[50541] = { parent = 53543, },
		[53537] = { parent = 53543, },
		[53538] = { parent = 53543, },
		[53540] = { parent = 53543, },
		[53542] = { parent = 53543, },
	[53480] = { type = "buffs_defensive", },  -- Roar of Sacrifice (Hunter Pet Skill)
	[53476] = { type = "buffs_defensive", },  -- Intervene (Pet)
	[1742] = { type = "buffs_defensive", },   -- Cower (Pet)
	[26064] = { type = "buffs_defensive", },  -- Shell Shield (Pet)
	[54644] = { type = "snare", },            -- Froststorm Breath (Chimera)
	[50271] = { type = "snare", },            -- Tendon Rip (Hyena)
		[53575] = { parent = 50271, },
		
	-- Mage
	[45438] = { type = "immunities", },       -- Ice Block
	[1953] = { type = "immunities", },        -- Blink, 0.5s immunity to CC
	[118] = { type = "cc", },                 -- Polymorph
		[12824] = { parent = 118, },
		[12825] = { parent = 118, },
		[12826] = { parent = 118, },
		[61780] = { parent = 118, },
		[71319] = { parent = 118, },
		[61025] = { parent = 118, },
		[28271] = { parent = 118, },
		[28272] = { parent = 118, },
		[61305] = { parent = 118, },
		[61721] = { parent = 118, },
	[42950] = { type = "cc", }, -- Dragon's Breath
		[31661] = { parent = 42950, },
		[33041] = { parent = 42950, },
		[33042] = { parent = 42950, },
		[33043] = { parent = 42950, },
		[42949] = { parent = 42950, },
	[44572] = { type = "cc", }, -- Deep Freeze
	[12355] = { type = "cc", }, -- Impact
	[55021] = { type = "silence", }, -- Improved Counterspell
		[18469] = { parent = 55021, },
	[2139] = { type = "interrupts", duration = 8, }, -- Counterspell (Mage)
	[12494] = { type = "roots", }, -- Frostbite
		[11071] = { parent = 12494, },
	[122] = { type = "roots", }, -- Frost Nova
		[42917] = { parent = 122, },
		[865] = { parent = 122, },
		[6131] = { parent = 122, },
		[10230] = { parent = 122, },
		[27088] = { parent = 122, },
	[55080] = { type = "roots", }, -- Shattered Barrier
	[64346] = { type = "disarm", }, -- Fiery Payback (Fire Mage Disarm)
	[54748] = { type = "buffs_defensive", }, -- Burning Determination (Interrupt/Silence Immunity)
	[46989] = { type = "buffs_defensive", }, -- Improved Blink
	[11129] = { type = "buffs_offensive", }, -- Combustion
	[44448] = { type = "buffs_offensive", }, -- Hot Streak
	[12472] = { type = "buffs_offensive", }, -- Icy Veins
	[12042] = { type = "buffs_offensive", }, -- Arcane Power
	[12043] = { type = "buffs_offensive", }, -- Presence of Mind
	[12051] = { type = "buffs_offensive", }, -- Evocation
	[44544] = { type = "buffs_offensive", }, -- Fingers of Frost
	[66] = { type = "buffs_offensive", }, -- Invisibility
		[32612] = { parent = 66, },
	[43039] = { type = "buffs_other", }, -- Ice Barrier
		[11426] = { parent = 43039, },
		[13031] = { parent = 43039, },
		[13032] = { parent = 43039, },
		[13033] = { parent = 43039, },
		[27134] = { parent = 43039, },
		[33405] = { parent = 43039, },
		[43038] = { parent = 43039, },
	[43020] = { type = "buffs_other", }, -- Mana Shield
		[1463] = { parent = 43020, },
		[8494] = { parent = 43020, },
		[8495] = { parent = 43020, },
		[10191] = { parent = 43020, },
		[10192] = { parent = 43020, },
		[10193] = { parent = 43020, },
		[27131] = { parent = 43020, },
		[43019] = { parent = 43020, },
	[43012] = { type = "buffs_other", }, -- Frost Ward
		[6143] = { parent = 43012, },
		[8461] = { parent = 43012, },
		[8462] = { parent = 43012, },
		[10177] = { parent = 43012, },
		[28609] = { parent = 43012, },
		[32796] = { parent = 43012, },
	[43010] = { type = "buffs_other", }, -- Fire Ward
		[543] = { parent = 43010, },
		[8457] = { parent = 43010, },
		[8458] = { parent = 43010, },
		[10223] = { parent = 43010, },
		[10225] = { parent = 43010, },
		[27128] = { parent = 43010, },
	[11113] = { type = "snare", }, -- Blast Wave
		[42945] = { parent = 11113, },
		[71151] = { parent = 11113, },
	[6136] = { type = "snare", }, -- Chilled (generic effect, used by lots of spells [looks weird on Improved Blizzard, might want to comment out])
	[120] = { type = "snare", }, -- Cone of Cold
		[65023] = { parent = 120, },
		[42930] = { parent = 120, },
		[42931] = { parent = 120, },
		[27087] = { parent = 120, },
		[10161] = { parent = 120, },
		[10160] = { parent = 120, },
		[10159] = { parent = 120, },
		[8492] = { parent = 120, },
		
	[12488] = { type = "snare", }, -- Improved Blizzard
		[11185] = { parent = 12488, },
		[12487] = { parent = 12488, },

	[116] = { type = "snare", }, -- Frostbolt
	[47610] = { type = "snare", }, -- Frostfire Bolt
	[31589] = { type = "snare", }, -- Slow
	[20005] = { type = "snare", }, -- Окоченение (Замедление 5с. Маг)
		[7321] = { parent = 20005, },
		
	-- Mage Pet
	[33395] = { type = "roots", }, -- Freeze (Water Elemental)
	
	-- Paladin
	[642] = { type = "immunities", }, -- Divine Shield
	[19753] = { type = "immunities", }, -- Divine Intervention (Full invulnerability and immobility 3m. Paladin)
	[10278] = { type = "immunities", }, -- Hand of Protection
		[5599] = { parent = 10278, },
		[1022] = { parent = 10278, },
	[20066] = { type = "cc", }, -- Repentance
	[10308] = { type = "cc", }, -- Hammer of Justice
		[853] = { parent = 10308, },
		[5588] = { parent = 10308, },
		[5589] = { parent = 10308, },
	[10326] = { type = "cc", }, -- Turn Evil
	[48817] = { type = "cc", }, -- Holy Wrath
		[2812] = { parent = 48817, },
		[10318] = { parent = 48817, },
		[27139] = { parent = 48817, },
		[48816] = { parent = 48817, },
	[20170] = { type = "cc", }, -- Seal of Justice (Stun)
	[63529] = { type = "silence", }, -- Silenced - Shield of the Templar
	[31821] = { type = "buffs_defensive", }, -- Aura Mastery
	[54428] = { type = "buffs_defensive", }, -- Divine Plea
	[53563] = { type = "buffs_defensive", }, -- Beacon of Light
	[498] = { type = "buffs_defensive", }, -- Divine Protection
	[6940] = { type = "buffs_defensive", }, -- Hand of Sacrifice
	[1044] = { type = "buffs_defensive", }, -- Hand of Freedom
	[64205] = { type = "buffs_defensive", }, -- Divine Sacrifice
	[53659] = { type = "buffs_defensive", }, -- Sacred Cleansing
	[31884] = { type = "buffs_offensive", }, -- Avenging Wrath
	[58597] = { type = "buffs_other", }, -- Sacred Shield Proc
	[59578] = { type = "buffs_other", }, -- The Art of War
	[20184] = { type = "snare", }, -- Judgement of Justice (100% movement snare, druids and shamans might want this though)
	[48827] = { type = "snare", }, -- Avenger's Shield (10s Slow Paladin)
	
	-- Priest
	[64044] = { type = "cc", }, -- Psychic Horror (Horrify)
	[10890] = { type = "cc", }, -- Psychic Scream
		[8122] = { parent = 10890, },
		[8124] = { parent = 10890, },
		[10888] = { parent = 10890, },
	[605] = { type = "cc", }, -- Mind Control
	[10955] = { type = "cc", }, -- Shackle Undead
		[9484] = { parent = 10955, },
		[9485] = { parent = 10955, },
	[15487] = { type = "silence", }, -- Silence
	[64058] = { type = "disarm", }, -- Psychic Horror (Disarm)
	[47585] = { type = "buffs_defensive", }, -- Dispersion
	[20711] = { type = "buffs_defensive", }, -- Spirit of Redemption
	[47788] = { type = "buffs_defensive", }, -- Guardian Spirit
	[33206] = { type = "buffs_defensive", }, -- Pain Suppression
	[10060] = { type = "buffs_offensive", }, -- Power Infusion
	[6346] = { type = "buffs_other", }, -- Fear Ward
	[48066] = { type = "buffs_other", }, -- Power Word: Shield
		[17] = { parent = 48066, },
		[592] = { parent = 48066, },
		[600] = { parent = 48066, },
		[3747] = { parent = 48066, },
		[6065] = { parent = 48066, },
		[6066] = { parent = 48066, },
		[10898] = { parent = 48066, },
		[10899] = { parent = 48066, },
		[10900] = { parent = 48066, },
		[10901] = { parent = 48066, },
		[25217] = { parent = 48066, },
		[25218] = { parent = 48066, },
		[48065] = { parent = 48066, },
	[48156] = { type = "snare", }, -- Mind Flay
	
	-- Rogue
	[51690] = { type = "immunities", }, -- Killing Spree
	[31224] = { type = "immunities", }, -- Cloak of Shadows
	[1776] = { type = "cc", }, -- Gouge
	[2094] = { type = "cc", }, -- Blind
	[8643] = { type = "cc", }, -- Kidney Shot
		[408] = { parent = 8643, },
	[51724] = { type = "cc", }, -- Sap
		[6770] = { parent = 51724, },
		[2070] = { parent = 51724, },
		[11297] = { parent = 51724, },
	[1833] = { type = "cc", }, -- Cheap Shot
	[1330] = { type = "silence", }, -- Garrote - Silence
	[18425] = { type = "silence", }, -- Silence (Improved Kick)
	[1766] = { type = "interrupts", duration = 5, }, -- Kick
	[51722] = { type = "disarm", }, -- Dismantle
	[31230] = { type = "buffs_defensive", },  -- Cheat Death
	[26669] = { type = "buffs_defensive", }, -- Evasion
		[5277] = { parent = 26669, },
	[51713] = { type = "buffs_offensive", }, -- Shadow Dance
	[31665] = { type = "buffs_offensive", }, -- Master of Subtlety - 3 / 6 / 9% increased damage after exiting Stealth
    [14177] = { type = "buffs_offensive", }, -- Cold Blood - 100% crit
    [57933] = { type = "buffs_offensive", }, -- Tricks of the Trade - 15% increased damage
	[11305] = { type = "buffs_other", }, -- Sprint
	[51693] = { type = "snare", },  -- Waylay (From Ambush / Backstab)
	[31125] = { type = "snare", }, -- Blade Twisting
		[51585] = { parent = 31125, },
	[3409] = { parent = 30981, }, -- Crippling Poison
	[26679] = { type = "snare", }, -- Deadly Throw
	
	-- Shaman
	[8178] = { type = "immunities", }, -- Grounding Totem Effect
	[58861] = { parent = 8983, }, -- Bash (Spirit Wolf)
	[51514] = { type = "cc", }, -- Hex
	[39796] = { type = "cc", }, -- Stoneclaw Stun
	[57994] = { type = "interrupts", duration = 2, }, -- Wind Shear
	[63685] = { type = "roots", }, -- Freeze (Enhancement)
	[64695] = { type = "roots", }, -- Earthgrab (Elemental)
	[30823] = { type = "buffs_defensive", }, -- Shamanistic Rage
	[16188] = { parent = 17116, }, -- Nature's Swiftness
	[16166] = { type = "buffs_offensive", }, -- Elemental Mastery (Instant Cast)
	[2825] = { type = "buffs_offensive", }, -- Bloodlust
	[32182] = { type = "buffs_offensive", }, -- Heroism
	[58875] = { type = "buffs_other", }, -- Spirit Walk (Spirit Wolf)
	[55277] = { type = "buffs_other", }, -- Stoneclaw Totem (Absorb)
	[3600] = { type = "snare", }, -- Earthbind (5 second duration per pulse, but will keep re-applying the debuff as long as you stand within the pulse radius)
	[8056] = { type = "snare", }, -- Frost Shock
		[49235] = { parent = 8056, },
		[49236] = { parent = 8056, },
		[25464] = { parent = 8056, },
		[10473] = { parent = 8056, },
		[10472] = { parent = 8056, },
		[8058] = { parent = 8056, },
	[8034] = { type = "snare", }, -- Frostbrand Attack (Weapon Enchant)
		[58799] = { parent = 8034, },
		[58798] = { parent = 8034, },
		[58797] = { parent = 8034, },
		[25501] = { parent = 8034, },
		[16353] = { parent = 8034, },
		[16352] = { parent = 8034, },
		[10458] = { parent = 8034, },
		[8037] = { parent = 8034, },
		
	-- Warlock
	[60995] = { type = "cc", }, -- Demon Charge (Metamorphosis, Demonology)
	[47847] = { type = "cc", }, -- Shadowfury
		[30283] = { parent = 47847, },
		[30413] = { parent = 47847, },
		[30414] = { parent = 47847, },
		[47846] = { parent = 47847, },
	[18647] = { type = "cc", }, -- Banish
		[710] = { parent = 18647, },
	[47860] = { type = "cc", }, -- Death Coil
		[6789] = { parent = 47860, },
		[17925] = { parent = 47860, },
		[17926] = { parent = 47860, },
		[27223] = { parent = 47860, },
		[47859] = { parent = 47860, },
	[6358] = { type = "cc", }, -- Seduction (Warlock Pet)
	[6215] = { type = "cc", }, -- Fear
		[5782] = { parent = 6215, },
		[6213] = { parent = 6215, },
	[17928] = { type = "cc", }, -- Howl of Terror
		[5484] = { parent = 17928, },
	[47995] = { type = "cc", }, -- Intercept (Felguard)
		[25274] = { parent = 47995, },
		[30153] = { parent = 47995, },
		[30195] = { parent = 47995, },
		[30197] = { parent = 47995, },
	[22703] = { type = "cc", }, -- Infernal 2s Stun (Infernal Warlock Pet)
	[32752] = { type = "cc", }, -- Summoning Disorientations (stun for active pet while summoning new one)
	[31117] = { type = "silence", }, -- Unstable Affliction (Silence)
	[24259] = { type = "silence", }, -- Spell Lock (Silence)
	[19647] = { type = "interrupts", duration = 6, }, -- Spell Lock (Interrupt) Rank2
		[19244] = { parent = 19647, duration = 5, }, -- Rank1
	[18708] = { type = "buffs_defensive", }, -- Fel Domination
	[47241] = { type = "buffs_offensive", }, -- Metamorphosis
	[11719] = { type = "buffs_offensive", }, -- Curse of Tongues
	[17941] = { type = "buffs_offensive", }, -- Shadow Trance
    [47197] = { type = "buffs_offensive", }, -- Eradication
		[1714] = { parent = 11719, },
	[47986] = { type = "buffs_other", }, -- Sacrifice
	[18118] = { type = "snare", }, -- Aftermath
	[18223] = { type = "snare", }, -- Curse of Exhaustion
	[63311] = { type = "snare", }, -- Shadowflame (Warlock, Major Glyph)
	[60947] = { type = "snare", }, -- Nightmare (5s Warlock slow after Fear ends, Affliction talent)
		[60946] = { parent = 60947, },
		
	-- Warrior
	[46924] = { type = "immunities", }, -- Bladestorm
	[23920] = { type = "immunities", }, -- Spell Reflection
		[59725] = { parent = 23920, }, -- Mass Spell Reflection
	[12809] = { type = "cc", }, -- Concussion Blow
	[47486] = { type = "cc", }, -- Mortal Strike
	[12798] = { type = "cc", }, -- Revenge Stun
	[46968] = { type = "cc", }, -- Shockwave
	[5246] = { type = "cc", }, -- Intimidating Shout (Non - Target)
		[20511] = { parent = 5246, }, -- Intimidating Shout (Target)
	[7922] = { type = "cc", }, -- Charge
	[20253] = { parent = 47995, }, -- Intercept
	[18498] = { type = "silence", }, -- Silenced - Gag Order
	[6552] = { type = "interrupts", duration = 4, }, -- Pummel
	[72] = { type = "interrupts", duration = 6, }, -- Shield Bash
	[58373] = { type = "roots", }, -- Glyph of Hamstring
	[23694] = { type = "roots", }, -- Improved Hamstring
	[676] = { type = "disarm", }, -- Disarm
	[12975] = { type = "buffs_defensive", }, -- Last Stand
	[55694] = { type = "buffs_defensive", }, -- Enraged Regeneration
	[871] = { type = "buffs_defensive", }, -- Shield Wall
	[60503] = { type = "buffs_offensive", }, -- Taste for Blood
    [64849] = { type = "buffs_offensive", }, -- Unrelenting Assault (1/2)
    [65925] = { type = "buffs_offensive", }, -- Unrelenting Assault (2/2)
	[3411] = { type = "buffs_defensive", }, -- Intervene
	[2565] = { type = "buffs_defensive", }, -- Shield Block
	[20230] = { type = "buffs_defensive", }, -- Retaliation
	[18499] = { type = "buffs_defensive", }, -- Berserker Rage
	[1719] = { type = "buffs_offensive", }, -- Recklessness
	[2457] = { type = "buffs_other", }, -- Battle Stance
	[2458] = { type = "buffs_other", }, -- Berserker Stance
	[71] = { type = "buffs_other", }, -- Defensive Stance
	[1715] = { type = "snare", }, -- Hamstring
	[12323] = { type = "snare", }, -- Piercing Howl
	
	-- Misc
	[6615] = { type = "immunities", },   -- Free Action (Immunity to Stuns and Movement Impairments for 30s)
	[24364] = { type = "immunities", },  -- Living Free Action Potion (Immune to Stun and Impairment Effects 5s)
	[20549] = { type = "cc", },          -- War Stomp (Tauren Racial)
	[13181] = { type = "cc", },          -- Gnomish Mind Control Cap (Stun 30s. Engineering)
	[13327] = { type = "cc", },          -- Reckless Attack (Stun 30s. Engineering)
	[71988] = { type = "cc", },          -- Vile Spirits (Stun 30s. Evil Fumigator Mask)
	[42292] = { type = "immunities", },  -- PvP Trinket, 0.1s immunity to CC
	[30217] = { type = "cc", },          -- Adamantite Grenade
		[67890] = { parent = 30217, },
	[67769] = { type = "cc", },          -- Cobalt Frag Bomb
	[30216] = { type = "cc", },          -- Fel Iron Bomb
	[50396] = { type = "cc", },          -- Psychosis (PvE Stun)
	[20685] = { type = "cc", },          -- Hammer of Storms (PvE Stun)
	[34074] = { type = "cc", },          -- Aspect of the Viper, Hunter Mana Regen Aura ( -50% damage done by Hunter)
	[19821] = { type = "silence", },     -- Arcane Bomb (Silence 5s Engineering)
	[28730] = { type = "silence", },     -- Arcane Torrent (Mana)
		[25046] = { parent = 28730, },   -- Arcane Torrent (Energy)
		[50613] = { parent = 28730, },   -- Arcane Torrent (Runic Power)
	[39965] = { type = "roots", },       -- Frost Grenade
	[55536] = { type = "roots", },       -- Frostweave Net
	[13099] = { type = "roots", },       -- Net-o-Matic
	[14030] = { type = "roots", },       -- Hook Net (Root 6s PVE)
	[71638] = { type = "buffs_other", }, -- Sindragosa's Flawless Fang, Tank PvE trinket
    [71635] = { type = "buffs_other", }, -- Sindragosa's Flawless Fang, Tank PvE trinket
	[55379] = { type = "buffs_other", }, -- Skyflare Swiftness
	[20594] = { type = "buffs_other", }, -- Stoneform
    [58984] = { type = "buffs_other", }, -- Shadowmeld
	[48263] = { type = "buffs_other", }, -- Frost Presence
	[1543] = { type = "buffs_other", },  -- Flare (Debuff)
	[43183] = { type = "buffs_other", }, -- Drink (Arena/Lvl 80 Water)
		[57073] = { parent = 43183, },   -- (Mage Water)
	[71586] = { type = "buffs_other", }, -- Hardened Skin by Corroded Skeleton Key (6400 Damage Absorb, lasts 10s.)
	[29703] = { parent = 50259, },       -- Shield Bash Daze effect (Warrior Interrupt)
	[54758] = { type = "buffs_other", }, -- Hyperspeed Accelerators (340 Haste, 10s duration Engineering Enchant)
	[59626] = { type = "buffs_other", }, -- Black Magic 250 Haste, Weapon Enchant
	
	--28169 -- Mutating Injection (Grobbulus)
	--28059 -- Positive Charge (Thaddius)
	--28084 -- Negative Charge (Thaddius)
	--27819 -- Detonate Mana (Kel'Thuzad)
	--63024 -- Gravity Bomb (XT-002 Deconstructor)
	--63018 -- Light Bomb (XT-002 Deconstructor)
	--62589 -- Nature's Fury (Freya, via Ancient Conservator)
	--63276 -- Mark of the Faceless (General Vezax)
	--66770 -- Ferocious Butt (Icehowl)
}

local units = {
	"player",
	"playerFAKE",
	"pet",
	"target",
	"targettarget",
	"focus",
	"focustarget",
	"party1",
	"party2",
	"party3",
	"party4",
	"partypet1",
	"partypet2",
	"partypet3",
	"partypet4",
	"arena1",
	"arena2",
	"arena3",
	"arena4",
	"arena5",
	"arenapet1",
	"arenapet2",
	"arenapet3",
	"arenapet4",
	"arenapet5",
}

local GetAnchor = {
    ElvUIFrames = function(anchor)
        local anchors, unit = BigDebuffs.anchors
        for u,configAnchor in pairs(anchors.ElvUI.units) do
            if anchor == configAnchor then
                unit = u
                break
            end
        end
        if unit and unit:match("party") then
            local unitGUID = UnitGUID(unit)
            for i = 1,5,1 do
                local elvUIFrame = _G["ElvUF_PartyGroup1UnitButton"..i]
                if elvUIFrame and elvUIFrame:IsVisible() and elvUIFrame.unit then
                    if unitGUID == UnitGUID(elvUIFrame.unit) then
                        return elvUIFrame
                    end
                end
            end
            return
        end
        return _G[anchor]
    end,
	ShadowedUnitFrames = function(anchor)
		local frame = _G[anchor]
		if not frame then return end
		if frame.portrait and frame.portrait:IsShown() then
			return frame.portrait, frame
		else
			return frame, frame, true
		end
	end,
	XPerl = function(anchor)
		local frame = _G[anchor]
		if not frame then return end
		if frame:IsShown() then
			return frame, frame
		else
			frame = frame:GetParent()
			return frame, frame, true
		end
	end,
}

local anchors = {
	["ElvUI"] = {
		func = GetAnchor.ElvUIFrames,
		noPortrait = true,
		alignLeft = true,
		units = {
			player       = "ElvUF_Player",
			playerFAKE   = "ElvUF_Player",
			pet          = "ElvUF_Pet",
			target       = "ElvUF_Target",
			targettarget = "ElvUF_TargetTarget",
			focus        = "ElvUF_Focus",
			focustarget  = "ElvUF_FocusTarget",
			party1       = "ElvUF_PartyGroup1UnitButton1",
			party2       = "ElvUF_PartyGroup1UnitButton2",
			party3       = "ElvUF_PartyGroup1UnitButton3",
			party4       = "ElvUF_PartyGroup1UnitButton4",
			arena1       = "ElvUF_Arena1",
			arena2       = "ElvUF_Arena2",
			arena3       = "ElvUF_Arena3",
			arena4       = "ElvUF_Arena4",
			arena5       = "ElvUF_Arena5",
		},
	},
	["Shadowed Unit Frames"] = {
		func = GetAnchor.ShadowedUnitFrames,
		alignLeft = true,
		units = {
			player       = "SUFUnitplayer",
			playerFAKE   = "SUFUnitplayer",
			pet          = "SUFUnitpet",
			target       = "SUFUnittarget",
			targettarget = "SUFUnittargettarget",
			focus        = "SUFUnitfocus",
			focustarget  = "SUFUnitfocustarget",
			party1       = "SUFHeaderpartyUnitButton1",
			party2       = "SUFHeaderpartyUnitButton2",
			party3       = "SUFHeaderpartyUnitButton3",
			party4       = "SUFHeaderpartyUnitButton4",
			partypet1    = "SUFChildpartypet1",
			partypet2    = "SUFChildpartypet2",
			partypet3    = "SUFChildpartypet3",
			partypet4    = "SUFChildpartypet4",
			arena1       = "SUFHeaderarenaUnitButton1",
			arena2       = "SUFHeaderarenaUnitButton2",
			arena3       = "SUFHeaderarenaUnitButton3",
			arena4       = "SUFHeaderarenaUnitButton4",
			arena5       = "SUFHeaderarenaUnitButton5",
			arenapet1    = "SUFChildarenapet1",
			arenapet2    = "SUFChildarenapet2",
			arenapet3    = "SUFChildarenapet3",
			arenapet4    = "SUFChildarenapet4",
			arenapet5    = "SUFChildarenapet5",
		},
	},
	["XPerl"] = {
		func = GetAnchor.XPerl,
		alignLeft = true,
		units = {
			player       = "XPerl_PlayerportraitFrame",
			playerFAKE   = "XPerl_PlayerportraitFrame",
			pet          = "XPerl_Player_PetportraitFrame",
			target       = "XPerl_TargetportraitFrame",
			targettarget = "Xperl_TargetTarget", -- Не имеет портрета
			focus        = "XPerl_FocusportraitFrame",
			focustarget  = "Xperl_FocusTarget", -- Не имеет портрета
			party1       = "XPerl_party1portraitFrame",
			party2       = "XPerl_party2portraitFrame",
			party3       = "XPerl_party3portraitFrame",
			party4       = "XPerl_party4portraitFrame",
		},
	},
	["Gladius"] = { -- просто так прицепиться не выйдет, необходимо создать фрейм в самом гладиусе.
		units = {
			arena1 = "GladiusButtonFrame1ClassIcon",
			arena2 = "GladiusButtonFrame2ClassIcon",
			arena3 = "GladiusButtonFrame3ClassIcon",
			arena4 = "GladiusButtonFrame4ClassIcon",
			arena5 = "GladiusButtonFrame5ClassIcon",
		},
	},
	["Blizzard"] = {
		units = {
			player       = "PlayerPortrait",
			playerFAKE   = "PlayerPortrait",
			pet          = "PetPortrait",
			target       = "TargetFramePortrait",
			targettarget = "TargetFrameToTPortrait",
			focus        = "FocusFramePortrait",
			focustarget  = "FocusFrameToTPortrait",
			party1       = "PartyMemberFrame1Portrait",
			party2       = "PartyMemberFrame2Portrait",
			party3       = "PartyMemberFrame3Portrait",
			party4       = "PartyMemberFrame4Portrait",
			partypet1    = "PartyMemberFrame1PetFramePortrait",
			partypet2    = "PartyMemberFrame2PetFramePortrait",
			partypet3    = "PartyMemberFrame3PetFramePortrait",
			partypet4    = "PartyMemberFrame4PetFramePortrait",
			arena1       = "ArenaEnemyFrame1ClassPortrait",
			arena2       = "ArenaEnemyFrame2ClassPortrait",
			arena3       = "ArenaEnemyFrame3ClassPortrait",
			arena4       = "ArenaEnemyFrame4ClassPortrait",
			arena5       = "ArenaEnemyFrame5ClassPortrait",
			arenapet1    = "ArenaEnemyFrame1PetFramePortrait",
			arenapet2    = "ArenaEnemyFrame2PetFramePortrait",
			arenapet3    = "ArenaEnemyFrame3PetFramePortrait",
			arenapet4    = "ArenaEnemyFrame4PetFramePortrait",
			arenapet5    = "ArenaEnemyFrame5PetFramePortrait",
		},
	},
}
BigDebuffs.anchors = anchors

function BigDebuffs:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("BigDebuffsDB", defaults, true)

	self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.db.RegisterCallback(self, "OnProfileReset", "Refresh")

	self.frames = {}
	self.UnitFrames = {}
	self:SetupOptions()
end

function BigDebuffs:Refresh()
	for unit, frame in pairs(self.UnitFrames) do
		frame:Hide()
		frame.current = nil
		self:AttachUnitFrame(unit)
		self:UNIT_AURA(nil, unit)
	end
end

--[[local unitsToUpdate = {}
function BigDebuffs:PLAYER_REGEN_ENABLED()
	for unit, _ in pairs(unitsToUpdate) do
		self:AttachUnitFrame(unit)
	end
	self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	unitsToUpdate = {}
end]]

function BigDebuffs:AttachUnitFrame(unit)

	if InCombatLockdown() then return end

	--[[if InCombatLockdown() then
		unitsToUpdate[unit] = true
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end]]

	local frame = self.UnitFrames[unit]
	local frameName = "BigDebuffs" .. unit .. "UnitFrame"

	if not frame then
		frame = CreateFrame("Button", frameName, UIParent, "BigDebuffsUnitFrameTemplate")
		frame.icon = _G[frameName .. "Icon"]

		frame.cooldownContainer = CreateFrame("Button", frameName .. "CooldownContainer", frame)
		self.UnitFrames[unit] = frame

		frame.CircleCooldown = CreateFrame("Frame", frameName .. "CircleCooldown", frame, "CircleCooldownFrameTemplate")
		frame.CircleCooldown:SetParent(frame.cooldownContainer)
		frame.CircleCooldown:SetFrameLevel(frame.cooldownContainer:GetParent():GetFrameLevel() + 1)
		frame.CircleCooldown:SetDrawBling(false) -- отключение анимации вспышки после завершения кд
		frame.CircleCooldown:SetAllPoints()

		frame.icon:SetDrawLayer("BORDER")
		frame.cooldownContainer:SetPoint("CENTER")

		frame.cooldown:SetParent(frame.cooldownContainer)
		frame.cooldown:SetFrameLevel(frame.cooldownContainer:GetParent():GetFrameLevel() + 1)
		frame.cooldown:SetAllPoints()

		frame.timer = frame:CreateFontString(nil, "OVERLAY")
		frame.timer:SetPoint("CENTER")
		frame:SetScript("OnUpdate", self.OnUpdate)

		frame:RegisterForDrag("LeftButton")
		frame:SetMovable(true)

		frame.unit = unit
	end

	local config = self.db.profile.unitFrames
	local configUnit = self.db.profile.unitFrames[unit:gsub("%d", "")]

	config["playerFAKE"].enabled = config["player"].duplicatePlayer
	if config["player"].anchor == "auto" then
		config["playerFAKE"].enabled = false
	end
	config["playerFAKE"].inArena = config["player"].inArena
	config["playerFAKE"].anchor = "auto"
	config["playerFAKE"].size = config["player"].size
	config["playerFAKE"].alpha = config["player"].alpha
	config["playerFAKE"].immunities = config["player"].immunities
	config["playerFAKE"].cc = config["player"].cc
	config["playerFAKE"].silence = config["player"].silence
	config["playerFAKE"].interrupts = config["player"].interrupts
	config["playerFAKE"].roots = config["player"].roots
	config["playerFAKE"].disarm = config["player"].disarm
	config["playerFAKE"].buffs_defensive = config["player"].buffs_defensive
	config["playerFAKE"].buffs_offensive = config["player"].buffs_offensive
	config["playerFAKE"].buffs_other = config["player"].buffs_other
	config["playerFAKE"].snare = config["player"].snare

	config["targettarget"].enabled = config["target"].enabledtargettarget
	if not config["target"].enabled then
		config["targettarget"].enabled = false
	end
	config["targettarget"].inArena = config["target"].inArena
	config["targettarget"].anchor = "auto"
	config["targettarget"].size = config["target"].size
	config["targettarget"].alpha = config["target"].alpha
	config["targettarget"].immunities = config["target"].immunities
	config["targettarget"].cc = config["target"].cc
	config["targettarget"].silence = config["target"].silence
	config["targettarget"].interrupts = config["target"].interrupts
	config["targettarget"].roots = config["target"].roots
	config["targettarget"].disarm = config["target"].disarm
	config["targettarget"].buffs_defensive = config["target"].buffs_defensive
	config["targettarget"].buffs_offensive = config["target"].buffs_offensive
	config["targettarget"].buffs_other = config["target"].buffs_other
	config["targettarget"].snare = config["target"].snare

	config["focustarget"].enabled = config["focus"].enabledfocustarget
	if not config["focus"].enabled then
		config["focustarget"].enabled = false
	end
	config["focustarget"].inArena = config["focus"].inArena
	config["focustarget"].anchor = "auto"
	config["focustarget"].size = config["focus"].size
	config["focustarget"].alpha = config["focus"].alpha
	config["focustarget"].immunities = config["focus"].immunities
	config["focustarget"].cc = config["focus"].cc
	config["focustarget"].silence = config["focus"].silence
	config["focustarget"].interrupts = config["focus"].interrupts
	config["focustarget"].roots = config["focus"].roots
	config["focustarget"].disarm = config["focus"].disarm
	config["focustarget"].buffs_defensive = config["focus"].buffs_defensive
	config["focustarget"].buffs_offensive = config["focus"].buffs_offensive
	config["focustarget"].buffs_other = config["focus"].buffs_other
	config["focustarget"].snare = config["focus"].snare

	if config.drawEdge then
		frame.cooldown:SetDrawEdge(true)
	else
		frame.cooldown:SetDrawEdge(false)
	end

	frame.cooldown.noCooldownCount = not config.cooldownCount
	frame.CircleCooldown.noCooldownCount = not config.cooldownCount

	frame:EnableMouse(self.test)
	frame.cooldownContainer:EnableMouse(self.test)

	_G[frameName .. "Name"]:SetFont("Fonts\\FRIZQT__.ttf", 11, "OUTLINE")
	_G[frameName .. "Name"]:SetText(self.test and not frame.anchor and unit)
	_G[frameName .. "Name"]:SetPoint("BOTTOM", 0, 4)
	_G[frameName .. "Name"]:SetWidth(frame:GetWidth() )

	frame.anchor = nil
	frame.blizzard = nil
	frame.elvui = nil
	frame.suf = nil
	frame.xperl = nil

	if config.outline == "" then
		frame.timer:SetShadowOffset(0.8, -0.8)
	else
		frame.timer:SetShadowOffset(0, 0)
	end

	timeThreshold = config.timeThreshold

	frame:SetAlpha(configUnit.alpha)

	if configUnit.anchor == "auto" then
		-- Find a frame to attach to
		for k,v in pairs(anchors) do
			local anchor, parent, noPortrait
			if v.units[unit] then
				if v.func then
					anchor, parent, noPortrait = v.func(v.units[unit])
				else
					anchor = _G[v.units[unit]]
				end

				if anchor then
					frame.anchor, frame.parent, frame.noPortrait = anchor, parent, noPortrait
					if v.noPortrait then frame.noPortrait = true end
					frame.alignLeft = v.alignLeft
					frame.blizzard = k == "Blizzard"
					frame.elvui = k == "ElvUI"
					frame.suf = k == "Shadowed Unit Frames"
					frame.xperl = k == "XPerl"
					if not frame.blizzard or not frame.elvui or not frame.suf or not frame.xperl then break end
				end
			end
		end
	end

	if frame.anchor then

		frame.timer:SetFont(SML:Fetch(SML.MediaType.FONT, config.font), frame.anchor:GetHeight() / config.customTimerSize, config.outline)

		if frame.blizzard then
			-- Blizzard Frame
			frame.icon:SetTexCoord(0, 1, 0, 1)

			-- Отключает цифры хила/урона на портретах игрока и питомца при закреплении на фрейме
			if unit == "player" or config["playerFAKE"].enabled == true then
				PlayerHitIndicator.Show = function() end
			elseif unit == "pet" then
				PetHitIndicator.Show = function() end
			end

			frame:SetParent(frame.anchor:GetParent() )
			frame:SetFrameLevel(frame.anchor:GetParent():GetFrameLevel() )

			frame.cooldownContainer:SetFrameLevel(frame.anchor:GetParent():GetFrameLevel() )
			frame.cooldownContainer:SetSize(frame.anchor:GetWidth(), frame.anchor:GetHeight() )

			frame.anchor:SetDrawLayer("BACKGROUND")
		else
			if config.hideBorder then
				frame.icon:SetTexCoord(0.075, 0.925, 0.075, 0.925)
			else
				frame.icon:SetTexCoord(0, 1, 0, 1)
			end

			frame:SetParent(frame.parent and frame.parent or frame.anchor)
			frame:SetFrameLevel(45)

			frame.cooldownContainer:SetFrameLevel(frame:GetFrameLevel() )

			if frame.noPortrait then
				frame.cooldownContainer:SetSize(frame.anchor:GetHeight(), frame.anchor:GetHeight() )
			else
				frame.cooldownContainer:SetSize(frame.anchor:GetWidth(), frame.anchor:GetHeight() )
			end
		end

		frame:ClearAllPoints()

		if frame.noPortrait then
			-- No portrait, so attach to the side
			if frame.alignLeft then
				frame:SetPoint("TOPRIGHT", frame.anchor, "TOPLEFT")
			else
				frame:SetPoint("TOPLEFT", frame.anchor, "TOPRIGHT")
			end

			local height = frame.anchor:GetHeight()

			if frame.elvui and unit == "target" or unit == "targettarget"
			or unit == "focus" or unit == "focustarget" then
				frame:SetPoint("TOPRIGHT", frame.anchor, "TOPRIGHT", height, 0)
			end

			if frame.suf and unit == "target" or unit == "targettarget"
			or unit == "focus" or unit == "focustarget" then
				frame:SetPoint("TOPRIGHT", frame.anchor, "TOPRIGHT", height, 0)
			end

			if frame.xperl and unit == "target" or unit == "targettarget"
			or unit == "focus" or unit == "focustarget" then
				frame:SetPoint("TOPRIGHT", frame.anchor, "TOPRIGHT", height, 0)
			end

			frame:SetSize(height, height)
		else
			frame:SetAllPoints(frame.anchor)
		end

	else
		-- Manual
		if config.hideBorder then
			frame.icon:SetTexCoord(0.075, 0.925, 0.075, 0.925)
		else
			frame.icon:SetTexCoord(0, 1, 0, 1)
		end

		frame:SetParent(UIParent)
		frame:ClearAllPoints()

		frame:SetFrameLevel(45)
		frame:SetSize(configUnit.size, configUnit.size)

		frame.cooldownContainer:SetFrameLevel(45)
		frame.cooldownContainer:SetSize(frame:GetWidth(), frame:GetHeight() )

		frame.timer:SetFont(SML:Fetch(SML.MediaType.FONT, config.font), frame:GetHeight() / config.customTimerSize, config.outline)

		if not config[unit] then config[unit] = {} end

		if config[unit].position then
			frame:SetPoint(unpack(config[unit].position))
		else
			-- No saved position, anchor to the blizzard position
			LoadAddOn("Blizzard_ArenaUI")
			local relativeFrame = _G[anchors.Blizzard.units[unit]] or UIParent
			frame:SetPoint("CENTER", relativeFrame, "CENTER")
		end
	end
end

function BigDebuffs:SaveUnitFramePosition(frame)
	self.db.profile.unitFrames[frame.unit].position = { frame:GetPoint() }
end

function BigDebuffs:Test()
	self.test = not self.test
	self:Refresh()
end

local TestDebuffs = {}

function BigDebuffs:InsertTestDebuff(spellID)
	local texture = select(3, GetSpellInfo(spellID))
	tinsert(TestDebuffs, {spellID, texture})
end

local function UnitDebuffTest(unit, index)
	local debuff = TestDebuffs[index]
	if not debuff then return end
	return GetSpellInfo(debuff[1]), nil, debuff[2], 0, "Magic", 30, GetTime() + 30, nil, nil, nil, debuff[1]
end

function BigDebuffs:OnEnable()
	self:RegisterEvent("PLAYER_FOCUS_CHANGED")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("UNIT_TARGET")
	self:RegisterEvent("UNIT_PET")
	self:RegisterEvent("PARTY_MEMBERS_CHANGED")
	self:RegisterEvent("ARENA_OPPONENT_UPDATE")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("UNIT_SPELLCAST_FAILED")

	self.interrupts = {}

	-- Prevent OmniCC finish animations
	if OmniCC then
		self:RawHook(OmniCC, "TriggerEffect", function(object, cooldown)
			local name = cooldown:GetName()
			if name and name:find("BigDebuffs") then return end
			self.hooks[OmniCC].TriggerEffect(object, cooldown)
		end, true)
	end

	self:InsertTestDebuff(10890) -- Icon for Test Mode.
end

local CreateStancesTable = true
function BigDebuffs:PLAYER_ENTERING_WORLD()
	for i = 1, #units do
		self:AttachUnitFrame(units[i])
	end

	if CreateStancesTable then
		self.stances = {}
	end
	CreateStancesTable = false
end

-- For unit frames
function BigDebuffs:GetAuraPriority(name, id, unit)
	if not self.Spells[id] and not self.Spells[name] then return end

	id = self.Spells[id].parent or id or name -- Check for parent spellID

	-- Make sure category is enabled
	if not self.db.profile.unitFrames[unit:gsub("%d", "")][self.Spells[id].type] then return end

	-- Check for user set
	if self.db.profile.spells[id] then
		if self.db.profile.spells[id].unitFrames and self.db.profile.spells[id].unitFrames == 0 then return end
		if self.db.profile.spells[id].priority then return self.db.profile.spells[id].priority end
	end

	if self.Spells[id].nounitFrames and (not self.db.profile.spells[id] or not self.db.profile.spells[id].unitFrames) then
		return
	end

	return self.db.profile.priority[self.Spells[id].type] or 0
end

function BigDebuffs:GetUnitFromGUID(guid)
	for _, unit in pairs(units) do
		if UnitGUID(unit) == guid then
			return unit
		end
	end
	return nil
end

function BigDebuffs:UNIT_SPELLCAST_FAILED(_, unit, spellName, _, _)
	self.spellName = spellName
	local guid = UnitGUID(unit)
	if self.interrupts[guid] == nil then
		self.interrupts[guid] = {}
		BigDebuffs:CancelTimer(self.interrupts[guid].timer)
		self.interrupts[guid].timer = BigDebuffs:ScheduleTimer(self.ClearInterruptGUID, 30, self, guid)
	end
	self.interrupts[guid].failed = GetTime()
end

local hpally = {} -- List of Holy Paladins found
local rshaman = {} -- List of Resto Shamans found

local Penance, _, PenanceIcon = GetSpellInfo(53007) -- Исповедь
local ArcaneMissiles, _, ArcaneMissilesIcon = GetSpellInfo(42846) -- Чародейские стрелы

function BigDebuffs:COMBAT_LOG_EVENT_UNFILTERED(_, ...)
	local _, subEvent, sourceGUID, _, _, destGUID, _, _, spellid, _ = ...

	local spelldata = self.Spells[spellid]

	if subEvent ~= "SPELL_CAST_SUCCESS" and subEvent ~= "SPELL_INTERRUPT"
	and subEvent ~= "SPELL_AURA_APPLIED" and subEvent ~= "SPELL_AURA_REMOVED" then
		return
	end

	if subEvent == "SPELL_CAST_SUCCESS" and spelldata then
		if spellid == 2457 or spellid == 2458 or spellid == 71 then
			self:UpdateStance(sourceGUID, spellid)
		end
	end

	if subEvent == "SPELL_AURA_APPLIED" and spelldata
	or subEvent == "SPELL_AURA_REMOVED" and spelldata then
		self:UNIT_AURA(nil, "targettarget")
		self:UNIT_AURA(nil, "focustarget")
	end

	if subEvent == "SPELL_CAST_SUCCESS" then
		local _, _, _, Name, _, _, _, _, spellId, _, _ = ...

		-- Detect Restoration Shaman according to used Spells (Riptide & Earth Shield)
		if spellId == 61295 or spellId == 61299 or spellId == 61300 or spellId == 61301 or spellId == 974
		or spellId == 32593 or spellId == 32594 or spellId == 49283 or spellId == 49284 then
			for i = 0, 1000 do
				if rshaman[i] == Name then -- Check whether Shaman has already been detected
					break
				elseif rshaman[i] == nil then -- Reached end of the List, adding Shaman
					rshaman[i] = Name
					break
				end
			end

		-- Detect Holy Paladin according to used Spells (Holy Shock & Beacon of Light)
		elseif spellId == 20473 or spellId == 48825 or spellId == 48824 or spellId == 33072
		or spellId == 27174 or spellId == 20930 or spellId == 20929 or spellId == 53563 then
			for i = 0, 1000 do
				if hpally[i] == Name then -- Check whether Paladin has already been detected
					break
				elseif hpally[i] == nil then -- Reached end of the List, adding Paladin
					hpally[i] = Name
					break
				end
			end
		end
	end

	if spelldata == nil or spelldata.parent or spelldata.type ~= "interrupts" then return end

	local duration = spelldata.duration
	if not duration then return end

	-- SPELL_INTERRUPT doesn't fire for some channeled spells
	if subEvent == "SPELL_INTERRUPT" then
		--                 кого кикнули        чем кикнули              что кикнули
		local _, _, _, _, _, unitGUID, _, _, InterruptSpellID, _, _, InterruptedSpellID, _, _ = ...

		local _, _, InterruptedIcon = GetSpellInfo(InterruptedSpellID)

		local changedDuration = BigDebuffs.GetDuration(unitGUID, duration)

		self:UpdateInterrupt(nil, unitGUID, InterruptSpellID, changedDuration, InterruptedIcon)
	end

	-- UnitChannelingInfo and event orders are not the same in WotLK as later expansions, UnitChannelingInfo will always return
	-- nil @ the time of this event (independent of whether something was kicked or not).
	-- We have to track UNIT_SPELLCAST_FAILED for spell failure of the target at the (approx.) same time as we interrupted
	-- this "could" be wrong if the interrupt misses with a <0.01 sec failure window (which depending on server tickrate might
	-- not even be possible)
	if subEvent == "SPELL_CAST_SUCCESS" and not (self.interrupts[destGUID] and self.interrupts[destGUID].failed
	and GetTime() - self.interrupts[destGUID].failed < 0.001) then return end -- если будет отображать фейк кик то необходимо уменьшить число
																			  -- если не будет отображать кик впринципе то необходимо увеличить число
	if self.spellName ~= Penance and self.spellName ~= ArcaneMissiles then return end

	local InterruptedIcon
	if self.spellName == Penance then
		InterruptedIcon = PenanceIcon
	elseif self.spellName == ArcaneMissiles then
		InterruptedIcon = ArcaneMissilesIcon
	end

	local changedDuration = BigDebuffs.GetDuration(destGUID, duration)

	self:UpdateInterrupt(nil, destGUID, spellid, changedDuration, InterruptedIcon)
end

function BigDebuffs.GetDuration(GUID, duration)
	local changedDuration

	if GUID == UnitGUID("player") then
		changedDuration = duration * BigDebuffs.GetModifier("player")
	end
	if GUID == UnitGUID("pet") then
		changedDuration = duration * BigDebuffs.GetModifier("pet")
	end
	if GUID == UnitGUID("target") then
		changedDuration = duration * BigDebuffs.GetModifier("target")
	end
	if GUID == UnitGUID("focus") then
		changedDuration = duration * BigDebuffs.GetModifier("focus")
	end
	if GUID == UnitGUID("party1") then
		changedDuration = duration * BigDebuffs.GetModifier("party1")
	end
	if GUID == UnitGUID("partypet1") then
		changedDuration = duration * BigDebuffs.GetModifier("partypet1")
	end
	if GUID == UnitGUID("party2") then
		changedDuration = duration * BigDebuffs.GetModifier("party2")
	end
	if GUID == UnitGUID("partypet2") then
		changedDuration = duration * BigDebuffs.GetModifier("partypet2")
	end
	if GUID == UnitGUID("party3") then
		changedDuration = duration * BigDebuffs.GetModifier("party3")
	end
	if GUID == UnitGUID("partypet3") then
		changedDuration = duration * BigDebuffs.GetModifier("partypet3")
	end
	if GUID == UnitGUID("party4") then
		changedDuration = duration * BigDebuffs.GetModifier("party4")
	end
	if GUID == UnitGUID("partypet4") then
		changedDuration = duration * BigDebuffs.GetModifier("partypet4")
	end
	if GUID == UnitGUID("arena1") then
		changedDuration = duration * BigDebuffs.GetModifier("arena1")
	end
	if GUID == UnitGUID("arenapet1") then
		changedDuration = duration * BigDebuffs.GetModifier("arenapet1")
	end
	if GUID == UnitGUID("arena2") then
		changedDuration = duration * BigDebuffs.GetModifier("arena2")
	end
	if GUID == UnitGUID("arenapet2") then
		changedDuration = duration * BigDebuffs.GetModifier("arenapet2")
	end
	if GUID == UnitGUID("arena3") then
		changedDuration = duration * BigDebuffs.GetModifier("arena3")
	end
	if GUID == UnitGUID("arenapet3") then
		changedDuration = duration * BigDebuffs.GetModifier("arenapet3")
	end
	if GUID == UnitGUID("arena4") then
		changedDuration = duration * BigDebuffs.GetModifier("arena4")
	end
	if GUID == UnitGUID("arenapet4") then
		changedDuration = duration * BigDebuffs.GetModifier("arenapet4")
	end
	if GUID == UnitGUID("arena5") then
		changedDuration = duration * BigDebuffs.GetModifier("arena5")
	end
	if GUID == UnitGUID("arenapet5") then
		changedDuration = duration * BigDebuffs.GetModifier("arenapet5")
	end

	return changedDuration
end

function BigDebuffs.GetModifier(unitid)
	local modifier = 1

	for i = 1, 40 do
		local _, _, _, _, _, _, _, unitCaster, _, _, spellId = UnitAura(unitid, i)

		-- all Paladin Auras max Rank
		if spellId == 19746 or spellId == 48942 or spellId == 48947 or spellId == 48945
		or spellId == 48943 or spellId == 54043 or spellId == 32223 then

			for index = 0, 1000 do
				if unitCaster ~= nil then -- игнорим nil
					if hpally[index] == GetUnitName(unitCaster) then -- Probably imp. Concentration Aura
						if modifier > 0.7 then
							modifier = 0.7
						end
						break
					-- The Paladin casting the Aura hasn't been detected as a Holy Paladin, so probably no imp. Concentration Aura
					elseif hpally[index] == nil then
						break
					end
				end
			end

		elseif spellId == 14743 then -- Matyrdom Rank1
			if modifier > 0.9 then
				modifier = 0.9
			end

		elseif spellId == 27828 then -- Matyrdom Rank2
			if modifier > 0.8 then
				modifier = 0.8
			end
		end
	end

	for index = 0, 1000 do
		if GetUnitName(unitid) == rshaman[index] then -- Interrupted Target is a Resto Shaman, so probably has 3/3 Focused Mind
			if modifier > 0.7 then
				modifier = 0.7
			end
		end
	end

	return modifier
end

function BigDebuffs:UpdateStance(guid, spellid)
	if self.stances[guid] == nil then
		self.stances[guid] = {}
	else
		self:CancelTimer(self.stances[guid].timer)
	end

	self.stances[guid].stance = spellid
	self.stances[guid].timer = self:ScheduleTimer(self.ClearStanceGUID, 180, self, guid)

	local unit = self:GetUnitFromGUID(guid)
	if unit then
		self:UNIT_AURA(nil, unit)
	end
end

function BigDebuffs:ClearStanceGUID(guid)
	local unit = self:GetUnitFromGUID(guid)
	if unit == nil then
		self.stances[guid] = nil
	else
		self.stances[guid].timer = BigDebuffs:ScheduleTimer(self.ClearStanceGUID, 180, self, guid)
	end
end

function BigDebuffs:UpdateInterrupt(unit, guid, spellid, duration, InterruptedIcon)
	local t = GetTime()
	-- new interrupt
	if spellid and duration ~= nil then
		if self.interrupts[guid] == nil then self.interrupts[guid] = {} end
		BigDebuffs:CancelTimer(self.interrupts[guid].timer)
		self.interrupts[guid].timer = BigDebuffs:ScheduleTimer(self.ClearInterruptGUID, 30, self, guid)
		self.interrupts[guid][spellid] = { started = t, duration = duration, icon = InterruptedIcon }
	-- old interrupt expiring
	elseif spellid and duration == nil then
		if self.interrupts[guid] and self.interrupts[guid][spellid] and
				t > self.interrupts[guid][spellid].started + self.interrupts[guid][spellid].duration then
			self.interrupts[guid][spellid] = nil
		end
	end

	if unit == nil then
		unit = self:GetUnitFromGUID(guid)
	end

	if unit then
		for i = 1, #units do
			self:UNIT_AURA(nil, units[i])
		end
	end
	-- clears the interrupt after end of duration
	if duration then
		-- если иконка кика не будет исчезать тогда необходимо добавить ещё времени к duration
		BigDebuffs:ScheduleTimer(self.UpdateInterrupt, duration + 0.04, self, unit, guid, spellid)
	end
end

function BigDebuffs:ClearInterruptGUID(guid)
	self.interrupts[guid] = nil
end

function BigDebuffs:GetInterruptFor(unit)
	local guid = UnitGUID(unit)
	local interrupts = self.interrupts[guid]

	if interrupts == nil then return end

	local name, spellid, InterruptIcon, duration, endsAt, InterruptedIcon

	-- iterate over all interrupt spellids to find the one of highest duration
	for ispellid, intdata in pairs(interrupts) do
		if type(ispellid) == "number" then
			local tmpstartedAt = intdata.started
			local dur = intdata.duration
			local intdataicon = intdata.icon
			local tmpendsAt = tmpstartedAt + dur
			if GetTime() > tmpendsAt then
				self.interrupts[guid][ispellid] = nil
			elseif endsAt == nil or tmpendsAt > endsAt then
				endsAt = tmpendsAt
				duration = dur
				InterruptedIcon = intdataicon
				name, _, InterruptIcon = GetSpellInfo(ispellid)
				spellid = ispellid
			end
		end
	end

	if name then
		if self.db.profile.unitFrames.interruptIcon then
			return name, spellid, InterruptedIcon, duration, endsAt
		else
			return name, spellid, InterruptIcon, duration, endsAt
		end
	end
end

function BigDebuffs:UNIT_AURA(event, unit)

	if not self.db.profile.unitFrames.enabled
	or not unit -- игнорим nil
	or not self.db.profile.unitFrames[unit:gsub("%d", "")] -- игнорим юнитов которых нет в нашей таблице
	or not self.db.profile.unitFrames[unit:gsub("%d", "")].enabled
	or not self.test and self.db.profile.unitFrames[unit:gsub("%d", "")].inArena and not InArena()
	then return end

	if unit == "player" then
		self:UNIT_AURA(nil, "playerFAKE")
	end

	self:AttachUnitFrame(unit)

	local frame = self.UnitFrames[unit]
	if not frame then return end

	if unit == "playerFAKE" then
		unit = gsub(unit, "%u", "")
	end

	local UnitDebuff = BigDebuffs.test and UnitDebuffTest or UnitDebuff

	local now = GetTime()
	local left, priority, duration, expires, icon, isAura, interrupt = 0, 0

	for i = 1, 40 do
		-- Check debuffs
		local n,_, ico, _,_, d, e, caster, _,_, id = UnitDebuff(unit, i)
		if id then
			--if id == 605 and unit == "pet" then return end -- дебафф от МК на питомце не нужен

			if self.Spells[n] or self.Spells[id] then
				local p = self:GetAuraPriority(n, id, unit)
				if p and p > priority or p == priority and e - now > left then
					left = e - now
					duration = d
					isAura = true
					priority = p
					expires = e
					icon = ico
				end
			end
		else
			break
		end
	end

	for i = 1, 40 do
		-- Check buffs
		local n,_, ico, _,_, d, e, _,_,_, id = UnitBuff(unit, i)
		if id then
			if id == 605 then return end -- бафф от МК не нужен

			if self.Spells[id] then
				local p = self:GetAuraPriority(n, id, unit)
				if p and p >= priority then
					if p and p > priority or p == priority and e - now > left then
						left = e - now
						duration = d
						isAura = true
						priority = p
						expires = e
						icon = ico
					end
				end
			end
		else
			break
		end
	end

	local n, id, ico, d, e = self:GetInterruptFor(unit)
	if n then
		local p = self:GetAuraPriority(n, id, unit)
		if p and p > priority or p == priority and e - now > left then
			left = e - now
			duration = d
			isAura = true
			priority = p
			expires = e
			icon = ico
		end
	end

	-- need to always look for a stance (if we only look for it once a player
	-- changes stance we will never get back to it again once other auras fade)
	local guid = UnitGUID(unit)
	if self.stances[guid] then
		local stanceId = self.stances[guid].stance
		if stanceId and self.Spells[stanceId] then
			n, _, ico = GetSpellInfo(stanceId)
			local p = self:GetAuraPriority(n, stanceId, unit)
			if p and p >= priority then
				left = 0
				duration = 0
				isAura = true
				priority = p
				expires = 0
				icon = ico
			end
		end
	end

	if isAura then

		--if frame.current ~= icon then

			if frame.blizzard then
				-- Blizzard Frame

				-- фикс кривых рук близзов
				if BigDebuffsplayerUnitFrame.blizzard then
					BigDebuffsplayerUnitFrame:ClearAllPoints()
					BigDebuffsplayerUnitFrame:SetPoint("CENTER", PlayerPortrait, "CENTER", 0.5, -0.7)
					BigDebuffsplayerUnitFrame:SetSize(PlayerPortrait:GetHeight(), PlayerPortrait:GetWidth() )
				end
				if BigDebuffsplayerFAKEUnitFrame.blizzard then
					BigDebuffsplayerFAKEUnitFrame:ClearAllPoints()
					BigDebuffsplayerFAKEUnitFrame:SetPoint("CENTER", PlayerPortrait, "CENTER", 0.5, -0.7)
					BigDebuffsplayerFAKEUnitFrame:SetSize(PlayerPortrait:GetHeight(), PlayerPortrait:GetWidth() )
				end
				if BigDebuffspetUnitFrame.blizzard then
					BigDebuffspetUnitFrame:ClearAllPoints()
					BigDebuffspetUnitFrame:SetPoint("CENTER", PetPortrait, "CENTER", -1.4, -0.5)
					BigDebuffspetUnitFrame:SetSize(PetPortrait:GetHeight() + 1.5, PetPortrait:GetWidth() + 1.5)
				end
				if BigDebuffstargetUnitFrame.blizzard then
					BigDebuffstargetUnitFrame:ClearAllPoints()
					BigDebuffstargetUnitFrame:SetPoint("CENTER", TargetFramePortrait, "CENTER", -0.4, -0.7)
					BigDebuffstargetUnitFrame:SetSize(TargetFramePortrait:GetHeight(), TargetFramePortrait:GetWidth() )
				end
				if BigDebuffstargettargetUnitFrame.blizzard then
					BigDebuffstargettargetUnitFrame:ClearAllPoints()
					BigDebuffstargettargetUnitFrame:SetPoint("CENTER", TargetFrameToTPortrait, "CENTER", -0.1, -0.5)
					BigDebuffstargettargetUnitFrame:SetSize(TargetFrameToTPortrait:GetHeight() + 4.2, TargetFrameToTPortrait:GetWidth() + 4.2)
				end
				if BigDebuffsfocusUnitFrame.blizzard then
					BigDebuffsfocusUnitFrame:ClearAllPoints()
					BigDebuffsfocusUnitFrame:SetPoint("CENTER", FocusFramePortrait, "CENTER", -0.4, -0.7)
					BigDebuffsfocusUnitFrame:SetSize(FocusFramePortrait:GetHeight(), FocusFramePortrait:GetWidth() )
				end
				if BigDebuffsfocustargetUnitFrame.blizzard then
					BigDebuffsfocustargetUnitFrame:ClearAllPoints()
					BigDebuffsfocustargetUnitFrame:SetPoint("CENTER", FocusFrameToTPortrait, "CENTER", -0.1, -0.5)
					BigDebuffsfocustargetUnitFrame:SetSize(FocusFrameToTPortrait:GetHeight() + 4.2, FocusFrameToTPortrait:GetWidth() + 4.2)
				end
				if BigDebuffsparty1UnitFrame.blizzard then
					BigDebuffsparty1UnitFrame:ClearAllPoints()
					BigDebuffsparty1UnitFrame:SetPoint("CENTER", PartyMemberFrame1Portrait, "CENTER", -0.7, -1.3)
					BigDebuffsparty1UnitFrame:SetSize(PartyMemberFrame1Portrait:GetHeight() + 1.5, PartyMemberFrame1Portrait:GetWidth() + 1.5)
				end
				if BigDebuffspartypet1UnitFrame.blizzard then
					BigDebuffspartypet1UnitFrame:ClearAllPoints()
					BigDebuffspartypet1UnitFrame:SetPoint("CENTER", PartyMemberFrame1PetFramePortrait, "CENTER", 0.5, -1.1)
					BigDebuffspartypet1UnitFrame:SetSize(PartyMemberFrame1PetFramePortrait:GetHeight() + 1, PartyMemberFrame1PetFramePortrait:GetWidth() + 1)
				end
				if BigDebuffsparty2UnitFrame.blizzard then
					BigDebuffsparty2UnitFrame:ClearAllPoints()
					BigDebuffsparty2UnitFrame:SetPoint("CENTER", PartyMemberFrame2Portrait, "CENTER", -0.7, -1.3)
					BigDebuffsparty2UnitFrame:SetSize(PartyMemberFrame2Portrait:GetHeight() + 1.5, PartyMemberFrame2Portrait:GetWidth() + 1.5)
				end
				if BigDebuffspartypet2UnitFrame.blizzard then
					BigDebuffspartypet2UnitFrame:ClearAllPoints()
					BigDebuffspartypet2UnitFrame:SetPoint("CENTER", PartyMemberFrame2PetFramePortrait, "CENTER", 0.5, -1.1)
					BigDebuffspartypet2UnitFrame:SetSize(PartyMemberFrame2PetFramePortrait:GetHeight() + 1, PartyMemberFrame2PetFramePortrait:GetWidth() + 1)
				end
				if BigDebuffsparty3UnitFrame.blizzard then
					BigDebuffsparty3UnitFrame:ClearAllPoints()
					BigDebuffsparty3UnitFrame:SetPoint("CENTER", PartyMemberFrame3Portrait, "CENTER", -0.7, -1.3)
					BigDebuffsparty3UnitFrame:SetSize(PartyMemberFrame3Portrait:GetHeight() + 1.5, PartyMemberFrame3Portrait:GetWidth() + 1.5)
				end
				if BigDebuffspartypet3UnitFrame.blizzard then
					BigDebuffspartypet3UnitFrame:ClearAllPoints()
					BigDebuffspartypet3UnitFrame:SetPoint("CENTER", PartyMemberFrame3PetFramePortrait, "CENTER", 0.5, -1.1)
					BigDebuffspartypet3UnitFrame:SetSize(PartyMemberFrame3PetFramePortrait:GetHeight() + 1, PartyMemberFrame3PetFramePortrait:GetWidth() + 1)
				end
				if BigDebuffsparty4UnitFrame.blizzard then
					BigDebuffsparty4UnitFrame:ClearAllPoints()
					BigDebuffsparty4UnitFrame:SetPoint("CENTER", PartyMemberFrame4Portrait, "CENTER", -0.7, -1.3)
					BigDebuffsparty4UnitFrame:SetSize(PartyMemberFrame4Portrait:GetHeight() + 1.5, PartyMemberFrame4Portrait:GetWidth() + 1.5)
				end
				if BigDebuffspartypet4UnitFrame.blizzard then
					BigDebuffspartypet4UnitFrame:ClearAllPoints()
					BigDebuffspartypet4UnitFrame:SetPoint("CENTER", PartyMemberFrame4PetFramePortrait, "CENTER", 0.5, -1.1)
					BigDebuffspartypet4UnitFrame:SetSize(PartyMemberFrame4PetFramePortrait:GetHeight() + 1, PartyMemberFrame4PetFramePortrait:GetWidth() + 1)
				end
				if BigDebuffsarena1UnitFrame.blizzard then
					BigDebuffsarena1UnitFrame:ClearAllPoints()
					BigDebuffsarena1UnitFrame:SetPoint("CENTER", ArenaEnemyFrame1ClassPortrait, "CENTER", 0.4, 1.3)
					BigDebuffsarena1UnitFrame:SetSize(ArenaEnemyFrame1ClassPortrait:GetHeight() - 4, ArenaEnemyFrame1ClassPortrait:GetWidth() - 4)
				end
				if BigDebuffsarenapet1UnitFrame.blizzard then
					BigDebuffsarenapet1UnitFrame:ClearAllPoints()
					BigDebuffsarenapet1UnitFrame:SetPoint("CENTER", ArenaEnemyFrame1PetFramePortrait, "CENTER", -1, -1.3)
					BigDebuffsarenapet1UnitFrame:SetSize(ArenaEnemyFrame1PetFramePortrait:GetHeight() + 1.5, ArenaEnemyFrame1PetFramePortrait:GetWidth() + 1.5)
				end
				if BigDebuffsarena2UnitFrame.blizzard then
					BigDebuffsarena2UnitFrame:ClearAllPoints()
					BigDebuffsarena2UnitFrame:SetPoint("CENTER", ArenaEnemyFrame2ClassPortrait, "CENTER", 0.4, 1.3)
					BigDebuffsarena2UnitFrame:SetSize(ArenaEnemyFrame2ClassPortrait:GetHeight() - 4, ArenaEnemyFrame2ClassPortrait:GetWidth() - 4)
				end
				if BigDebuffsarenapet2UnitFrame.blizzard then
					BigDebuffsarenapet2UnitFrame:ClearAllPoints()
					BigDebuffsarenapet2UnitFrame:SetPoint("CENTER", ArenaEnemyFrame2PetFramePortrait, "CENTER", -1, -1.3)
					BigDebuffsarenapet2UnitFrame:SetSize(ArenaEnemyFrame2PetFramePortrait:GetHeight() + 1.5, ArenaEnemyFrame2PetFramePortrait:GetWidth() + 1.5)
				end
				if BigDebuffsarena3UnitFrame.blizzard then
					BigDebuffsarena3UnitFrame:ClearAllPoints()
					BigDebuffsarena3UnitFrame:SetPoint("CENTER", ArenaEnemyFrame3ClassPortrait, "CENTER", 0.4, 1.3)
					BigDebuffsarena3UnitFrame:SetSize(ArenaEnemyFrame3ClassPortrait:GetHeight() - 4, ArenaEnemyFrame3ClassPortrait:GetWidth() - 4)
				end
				if BigDebuffsarenapet3UnitFrame.blizzard then
					BigDebuffsarenapet3UnitFrame:ClearAllPoints()
					BigDebuffsarenapet3UnitFrame:SetPoint("CENTER", ArenaEnemyFrame3PetFramePortrait, "CENTER", -1, -1.3)
					BigDebuffsarenapet3UnitFrame:SetSize(ArenaEnemyFrame3PetFramePortrait:GetHeight() + 1.5, ArenaEnemyFrame3PetFramePortrait:GetWidth() + 1.5)
				end
				if BigDebuffsarena4UnitFrame.blizzard then
					BigDebuffsarena4UnitFrame:ClearAllPoints()
					BigDebuffsarena4UnitFrame:SetPoint("CENTER", ArenaEnemyFrame4ClassPortrait, "CENTER", 0.4, 1.3)
					BigDebuffsarena4UnitFrame:SetSize(ArenaEnemyFrame4ClassPortrait:GetHeight() - 4, ArenaEnemyFrame4ClassPortrait:GetWidth() - 4)
				end
				if BigDebuffsarenapet4UnitFrame.blizzard then
					BigDebuffsarenapet4UnitFrame:ClearAllPoints()
					BigDebuffsarenapet4UnitFrame:SetPoint("CENTER", ArenaEnemyFrame4PetFramePortrait, "CENTER", -1, -1.3)
					BigDebuffsarenapet4UnitFrame:SetSize(ArenaEnemyFrame4PetFramePortrait:GetHeight() + 1.5, ArenaEnemyFrame4PetFramePortrait:GetWidth() + 1.5)
				end
				if BigDebuffsarena5UnitFrame.blizzard then
					BigDebuffsarena5UnitFrame:ClearAllPoints()
					BigDebuffsarena5UnitFrame:SetPoint("CENTER", ArenaEnemyFrame5ClassPortrait, "CENTER", 0.4, 1.3)
					BigDebuffsarena5UnitFrame:SetSize(ArenaEnemyFrame5ClassPortrait:GetHeight() - 4, ArenaEnemyFrame5ClassPortrait:GetWidth() - 4)
				end
				if BigDebuffsarenapet5UnitFrame.blizzard then
					BigDebuffsarenapet5UnitFrame:ClearAllPoints()
					BigDebuffsarenapet5UnitFrame:SetPoint("CENTER", ArenaEnemyFrame5PetFramePortrait, "CENTER", -1, -1.3)
					BigDebuffsarenapet5UnitFrame:SetSize(ArenaEnemyFrame5PetFramePortrait:GetHeight() + 1.5, ArenaEnemyFrame5PetFramePortrait:GetWidth() + 1.5)
				end

				SetPortraitToTexture(frame.icon, icon)

				-- Adapt
				if frame.anchor and Adapt and Adapt.portraits[frame.anchor] then
					Adapt.portraits[frame.anchor].modelLayer:SetFrameStrata("BACKGROUND")
				end
			else
				frame.icon:SetTexture(icon)
			end
		--end

		if duration > 0.2 then

			if self.db.profile.unitFrames.circleCooldown and frame.blizzard then
				frame.CircleCooldown:SetCooldown(expires - duration, duration)
				frame.cooldown:Hide()
			else
				frame.cooldown:SetCooldown(expires - duration, duration)
				frame.CircleCooldown:Hide()
			end

			-- Скрываем анимацию кд, что бы альфа применилась сетаем её после сеткулдаун
			if self.db.profile.unitFrames.hideCDanimation then
				frame.cooldown:SetAlpha(0)
				frame.CircleCooldown:SetAlpha(0)
			else
				frame.cooldown:SetAlpha(0.85)
				frame.CircleCooldown:SetAlpha(1)
			end

			if self.db.profile.unitFrames.customTimer then
				frame.timeEnd = (expires - duration) + duration
			else
				frame.timeEnd = GetTime()
			end

			frame.cooldownContainer:Show()
		else
			frame.timeEnd = GetTime()
			frame.cooldownContainer:Hide()
		end

		frame:Show()
		frame.current = icon
	else
		-- Adapt
		if frame.anchor and frame.blizzard and Adapt and Adapt.portraits[frame.anchor] then
			Adapt.portraits[frame.anchor].modelLayer:SetFrameStrata("LOW")
		else
			frame:Hide()
			frame.current = nil
		end
	end
end

function BigDebuffs:OnUpdate()
	-- Создаём кастомный таймер
	local remain = self.timeEnd - GetTime()
	if remain > 0 then
		if remain <= timeThreshold then
			--self.timer:SetTextColor(1, 0, 0)
			self.timer:SetTextColor(1, 1, 1)
			self.timer:SetFormattedText("%.01f", remain)
		elseif remain <= 60 then
			--self.timer:SetTextColor(1, 1, 0)
			self.timer:SetTextColor(1, 1, 1)
			self.timer:SetText(ceil(remain))
		elseif remain <= 3600 then
			self.timer:SetText(ceil(remain / 60) .. L["m"])
			self.timer:SetTextColor(1, 1, 1)
		else
			self.timer:SetText(ceil(remain / 3600) .. L["h"])
			self.timer:SetTextColor(1, 1, 1)
		end
	else
		self.timer:SetText("")
	end
end

function BigDebuffs:PLAYER_FOCUS_CHANGED()
	self:UNIT_AURA(nil, "focus")
	self:UNIT_AURA(nil, "focustarget")
end

function BigDebuffs:PLAYER_TARGET_CHANGED()
	self:UNIT_AURA(nil, "target")
	self:UNIT_AURA(nil, "targettarget")
end

function BigDebuffs:UNIT_TARGET()
	self:UNIT_AURA(nil, "targettarget")
	self:UNIT_AURA(nil, "focustarget")
end

function BigDebuffs:UNIT_PET()
	self:UNIT_AURA(nil, "pet")
end

function BigDebuffs:PARTY_MEMBERS_CHANGED()
	for i = 1, #units do
		self:UNIT_AURA(nil, units[i])
	end
end
BigDebuffs.ARENA_OPPONENT_UPDATE = BigDebuffs.PARTY_MEMBERS_CHANGED

SLASH_BigDebuffs1 = "/bd"
SLASH_BigDebuffs2 = "/big"
SLASH_BigDebuffs3 = "/bigdebuff"
SLASH_BigDebuffs4 = "/bigdebuffs"
SlashCmdList.BigDebuffs = function(msg)
	LibStub("AceConfigDialog-3.0"):Open("BigDebuffs")
end
