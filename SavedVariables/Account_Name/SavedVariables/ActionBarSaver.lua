
ActionBarSaverDB = {
	["restoreRank"] = true,
	["macro"] = false,
	["sets"] = {
		["DEATHKNIGHT"] = {
		},
		["WARRIOR"] = {
		},
		["PALADIN"] = {
		},
		["MAGE"] = {
			["mage"] = {
				"macro|1||FB|Interface\\Icons\\Spell_Frost_FrostBolt02|/cast [mod:shift,target=focus] Frostbolt; Frostbolt", -- [1]
				"macro|2||LANCE|Interface\\Icons\\Spell_Frost_FrostBlast|/cancelaura Ice Block/n/cast [mod:shift,target=focus] Ice Lance; Ice Lance", -- [2]
				"macro|3||NOVA|Interface\\Icons\\Spell_Frost_FrostNova|/cancelaura Ice Block/n/cast Frost Nova(Rank 1)", -- [3]
				"macro|4||COC|Interface\\Icons\\Spell_Frost_Glacier|/cancelaura Ice Block/n/cast Cone of Cold(Rank 1)", -- [4]
				"macro|5||BLAST|Interface\\Icons\\Spell_Fire_Fireball|/cancelaura Ice Block/n/cast Fire Blast", -- [5]
				"macro|6||SCHORCH|Interface\\Icons\\Spell_Fire_SoulBurn|/cancelaura Ice Block/n/cast Scorch", -- [6]
				"macro|7||Explosion FULL|Interface\\Icons\\Spell_Nature_WispSplode|/cancelaura Ice Block/n/cast Arcane Explosion", -- [7]
				"macro|8||Fireball|Interface\\Icons\\Spell_Fire_FlameBolt|/cancelaura Ice Block/n/cast [modifier:shift,target=focus] Fireball;Fireball", -- [8]
				"macro|9||FB ultimate r1|Interface\\Icons\\Spell_Frost_FrostBolt02|/cancelaura Ice Block/n/cast [modifier:shift,target=focus] Frostbolt(Rank 1);Frostbolt(Rank 1)", -- [9]
				"macro|10||Explosion r1|Interface\\Icons\\Spell_Nature_WispSplode|/cancelaura Ice Block/n/cast Arcane Explosion(Rank 1)", -- [10]
				"macro|11||Mana Shield|Interface\\Icons\\Spell_Shadow_DetectLesserInvisibility|/cancelaura Ice Block/n/cast Mana Shield", -- [11]
				"macro|12||Barrier|Interface\\Icons\\Spell_Ice_Lament|/cancelaura Ice Block/n/cast Ice Barrier", -- [12]
				nil, -- [13]
				nil, -- [14]
				nil, -- [15]
				nil, -- [16]
				nil, -- [17]
				nil, -- [18]
				nil, -- [19]
				nil, -- [20]
				nil, -- [21]
				nil, -- [22]
				nil, -- [23]
				nil, -- [24]
				nil, -- [25]
				nil, -- [26]
				nil, -- [27]
				nil, -- [28]
				"spell|71||Evocation||12051", -- [29]
				"spell|72||Invisibility||66", -- [30]
				"spell|77||Mana Shield|Rank 1|1463", -- [31]
				"macro|32||r1 amplify|Interface\\Icons\\Spell_Holy_FlashHeal|/cast [mod:shift,target=party1],[mod:ctrl,target=party2],[mod:alt,target=Player] Amplify Magic(Rank 1); Amplify Magic(Rank 1)", -- [32]
				"spell|94||Ritual of Refreshment|Rank 1|43987", -- [33]
				"spell|18||Arcane Brilliance|Rank 1|23028", -- [34]
				"spell|63||Conjure Water|Rank 8|37420", -- [35]
				"spell|50||Conjure Food|Rank 7|28612", -- [36]
				nil, -- [37]
				nil, -- [38]
				nil, -- [39]
				"spell|95||Slow Fall||130", -- [40]
				"macro|41||blizzard|Interface\\Icons\\Spell_Frost_IceStorm|/cast !Blizzard", -- [41]
				"spell|2||Cannibalize|Racial|20577", -- [42]
				"macro|43||r1 Fireball|Interface\\Icons\\Spell_Fire_FlameBolt|/cancelaura Ice Block/n/cast [modifier:shift,target=focus] Fireball(Rank 1);Fireball(Rank 1)", -- [43]
				"macro|44||r1 Dampen|Interface\\Icons\\Spell_Nature_AbolishMagic|/cast [mod:shift,target=party1],[mod:ctrl,target=party2],[mod:alt,target=Player] Dampen Magic(Rank 1); Dampen Magic(Rank 1)", -- [44]
				nil, -- [45]
				"macro|46||Wand|Interface\\Icons\\Ability_ShootWand|/cast !Shoot", -- [46]
				"spell|53||Conjure Mana Emerald||27101", -- [47]
				"spell|55||Conjure Mana Ruby||10054", -- [48]
				"macro|49||Blink|Interface\\Icons\\Spell_Arcane_Blink|#showtooltip Blink/n/cancelaura Ice Block/n/stopcasting/n/cast Blink", -- [49]
				nil, -- [50]
				"macro|51||MOUNT|Interface\\Icons\\Ability_Mount_Wyvern_01|/cast Swift Red Windrider/n/cast Swift Red Windrider", -- [51]
				"item|22044||Mana Emerald", -- [52]
				"item|8008||Mana Ruby", -- [53]
				"macro|54||FOOD|Interface\\Icons\\INV_Misc_QuestionMark|/use Conjured Mountain Spring Water/n/use Conjured Cinnamon Roll/n/use croisant", -- [54]
				"macro|55||Amplify|Interface\\Icons\\Spell_Holy_FlashHeal|/cast [mod:shift,target=party1],[mod:ctrl,target=party2],[mod:alt,target=Player] Amplify Magic; Amplify Magic", -- [55]
				"macro|56||Dampen|Interface\\Icons\\Spell_Nature_AbolishMagic|/cast [mod:shift,target=party1],[mod:ctrl,target=party2],[mod:alt,target=Player] Dampen Magic; Dampen Magic", -- [56]
				"macro|57||Intel|Interface\\Icons\\Spell_Holy_MagicalSentry|/cast [mod:shift,target=party1],[mod:ctrl,target=party2],[mod:alt,target=Player] Arcane Intellect; Arcane Intellect", -- [57]
				"spell|76||Mage Armor|Rank 4|27125", -- [58]
				"spell|137||Molten Armor|Rank 1|30482", -- [59]
				"spell|192||Ice Armor|Rank 5|27124", -- [60]
				"spell|10||Will of the Forsaken|Racial|7744", -- [61]
				"item|37865||Medallion of the Horde", -- [62]
				"spell|154||Cold Snap||11958", -- [63]
				"macro|64||Block|Interface\\Icons\\Spell_Frost_Frost|#showtooltip Ice Block/n/stopcasting/n/cast Ice Block", -- [64]
				"macro|65||HFS|Interface\\Icons\\Spell_Frost_ColdHearted|/cast Icy Veins/n/use Icon of the Silver Crescent", -- [65]
				"macro|66||CS|Interface\\Icons\\Spell_Frost_IceShock|#showtooltip Counterspell/n/cancelaura Ice Block/n/stopcasting/n/cast Counterspell", -- [66]
				"macro|67||SS|Interface\\Icons\\Spell_Arcane_Arcane02|#show Spellsteal/n/cancelaura Ice Block/n/cancelaura Invisibility/n/cast [mod:shift,target=focus] Spellsteal; Spellsteal/n/cancelaura Blessing of Sacrifice", -- [67]
				"macro|68||SS|Interface\\Icons\\Spell_Arcane_Arcane02|#show Spellsteal/n/cancelaura Ice Block/n/cancelaura Invisibility/n/cast [mod:shift,target=focus] Spellsteal; Spellsteal/n/cancelaura Blessing of Sacrifice", -- [68]
				"spell|174||Frost Ward|Rank 6|32796", -- [69]
				"spell|116||Fire Ward|Rank 6|27128", -- [70]
				"macro|71||Curse|Interface\\Icons\\Spell_Nature_RemoveCurse|#showtooltip Remove Lesser Curse/n/cast [modifier:alt,target=Player] Remove Lesser Curse/n/cast [modifier:shift,target=party1] Remove Lesser Curse/n/cast [modifier:ctrl,target=party2] Remove Lesser Curse", -- [71]
				"macro|72||Missiles|Interface\\Icons\\Spell_Nature_StarFall|/cancelaura Ice Block/n/cast Arcane Missiles(Rank 10)", -- [72]
			},
		},
		["PRIEST"] = {
		},
		["WARLOCK"] = {
		},
		["HUNTER"] = {
		},
		["DRUID"] = {
		},
		["SHAMAN"] = {
		},
		["ROGUE"] = {
		},
	},
	["spellSubs"] = {
	},
	["checkCount"] = false,
}
