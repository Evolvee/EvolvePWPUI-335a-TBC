
SBFDB = {
	["global"] = {
		["message"] = false,
		["fixspells"] = true,
		["version"] = 3.1,
		["combatUpdate"] = 0.2,
		["spells"] = {
			["Dampen Magic"] = {
				600, -- [1]
				false, -- [2]
				20, -- [3]
				"MAGE", -- [4]
				1725207946, -- [5]
			},
			["Arcane Intellect"] = {
				1800, -- [1]
				false, -- [2]
				20, -- [3]
				"MAGE", -- [4]
				1725207946, -- [5]
			},
			["Ice Armor"] = {
				1800, -- [1]
				false, -- [2]
				20, -- [3]
				"MAGE", -- [4]
				1725207946, -- [5]
			},
		},
		["minor"] = 20,
		["spellTTL"] = 30,
	},
	["profileKeys"] = {
		["Evolvepwp - The Burning Crusade PTR"] = "Evolvepwp - The Burning Crusade PTR",
	},
	["profiles"] = {
		["Evolvepwp - The Burning Crusade PTR"] = {
			["flow"] = {
			},
			["frames"] = {
				{
					["general"] = {
						["debuffs"] = false,
						["frameName"] = "Buffs",
						["buffs"] = true,
						["blacklist"] = true,
						["unit"] = "player",
					},
					["alwaysWarn"] = {
					},
					["layout"] = {
						["point"] = {
							"TOPRIGHT", -- [1]
							-65, -- [2]
							-250, -- [3]
						},
						["scale"] = 1,
						["opacity"] = 1,
						["growth"] = 3,
						["y"] = 0,
						["x"] = 0,
						["count"] = 20,
						["anchor"] = 1,
						["sort"] = 1,
						["visibility"] = 1,
						["rowCount"] = 20,
					},
					["expiry"] = {
						["minimumDuration"] = 0,
						["sctColour"] = {
							["b"] = 0.1,
							["g"] = 1,
							["r"] = 0.1,
						},
						["warnAtTime"] = 30,
						["frame"] = "ChatFrame1",
						["sound"] = "None",
					},
					["count"] = {
						["y"] = -4,
						["x"] = 0,
						["justify"] = "CENTER",
						["frameLevel"] = 4,
						["fontSize"] = 10,
						["font"] = "Friz Quadrata TT",
						["colour"] = {
							["b"] = 1,
							["g"] = 1,
							["r"] = 1,
						},
					},
					["list"] = {
					},
					["timer"] = {
						["fontSize"] = 10,
						["justify"] = "CENTER",
						["scale"] = 1,
						["y"] = -15,
						["font"] = "Friz Quadrata TT",
						["regularColour"] = {
							["b"] = 0,
							["g"] = 0.82,
							["r"] = 1,
						},
						["frameLevel"] = 4,
						["format"] = 2,
						["expiringColour"] = {
							["b"] = 0,
							["g"] = 0.82,
							["r"] = 1,
						},
						["x"] = 0,
					},
					["icon"] = {
						["y"] = 0,
						["x"] = 0,
						["frameLevel"] = 3,
						["opacity"] = 1,
						["size"] = 20,
					},
					["filters"] = {
					},
				}, -- [1]
				{
					["general"] = {
						["blacklist"] = true,
						["debuffs"] = true,
						["frameName"] = "Debuffs",
						["unit"] = "player",
					},
					["alwaysWarn"] = {
					},
					["layout"] = {
						["point"] = {
							"TOPRIGHT", -- [1]
							-110, -- [2]
							-250, -- [3]
						},
						["scale"] = 1,
						["opacity"] = 1,
						["growth"] = 3,
						["y"] = 0,
						["x"] = 0,
						["count"] = 16,
						["anchor"] = 1,
						["sort"] = 1,
						["visibility"] = 1,
						["rowCount"] = 16,
					},
					["expiry"] = {
						["minimumDuration"] = 0,
						["sctColour"] = {
							["b"] = 0.1,
							["g"] = 1,
							["r"] = 0.1,
						},
						["warnAtTime"] = 30,
						["frame"] = "ChatFrame1",
						["sound"] = "None",
					},
					["count"] = {
						["y"] = -4,
						["x"] = 0,
						["justify"] = "CENTER",
						["frameLevel"] = 4,
						["fontSize"] = 10,
						["font"] = "Friz Quadrata TT",
						["colour"] = {
							["b"] = 1,
							["g"] = 1,
							["r"] = 1,
						},
					},
					["list"] = {
					},
					["timer"] = {
						["fontSize"] = 10,
						["justify"] = "CENTER",
						["scale"] = 1,
						["y"] = -15,
						["font"] = "Friz Quadrata TT",
						["regularColour"] = {
							["b"] = 0,
							["g"] = 0.82,
							["r"] = 1,
						},
						["frameLevel"] = 4,
						["format"] = 2,
						["expiringColour"] = {
							["b"] = 0,
							["g"] = 0.82,
							["r"] = 1,
						},
						["x"] = 0,
					},
					["icon"] = {
						["y"] = 0,
						["x"] = 0,
						["frameLevel"] = 3,
						["opacity"] = 1,
						["size"] = 20,
					},
					["filters"] = {
					},
				}, -- [2]
			},
			["settings"] = {
			},
		},
	},
}
