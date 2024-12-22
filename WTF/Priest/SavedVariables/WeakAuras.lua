
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["displays"] = {
		["Circle Class Frames (TARGET)"] = {
			["controlledChildren"] = {
				"Circle Class Frame [WARLOCK]", -- [1]
				"Circle Class Frame [MAGE]", -- [2]
				"Circle Class Frame [DRUID]", -- [3]
				"Circle Class Frame [WARRIOR]", -- [4]
				"Circle Class Frame [ROGUE]", -- [5]
				"Circle Class Frame [HUNTER]", -- [6]
				"Circle Class Frame [PRIEST]", -- [7]
				"Circle Class Frame [PALADIN]", -- [8]
				"Circle Class Frame [SHAMAN]", -- [9]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frames (TARGET)",
			["uid"] = "qZaXlWpR3as",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["borderInset"] = 1,
			["groupIcon"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Mage",
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["IMMUNE target visual"] = {
			["color"] = {
				1, -- [1]
				0, -- [2]
				0.07058823529411765, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["yOffset"] = -15,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useRem"] = false,
						["type"] = "aura2",
						["useStacks"] = false,
						["auranames"] = {
							"Ice Block", -- [1]
						},
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "target",
						["unitExists"] = false,
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["subeventPrefix"] = "SPELL",
						["useExactSpellId"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["useRem"] = false,
						["type"] = "aura2",
						["useStacks"] = false,
						["auranames"] = {
							"Divine Shield", -- [1]
						},
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["names"] = {
						},
						["unitExists"] = false,
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["useExactSpellId"] = false,
						["useName"] = true,
						["unit"] = "target",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["useRem"] = false,
						["type"] = "aura2",
						["useStacks"] = false,
						["auranames"] = {
							"Cloak of Shadows", -- [1]
						},
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "target",
						["unitExists"] = false,
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["useExactSpellId"] = false,
						["useName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 75,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 130,
			["rotate"] = false,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
						[103] = true,
					},
				},
				["use_ignoreNameRealm"] = false,
				["class"] = {
					["single"] = "PRIEST",
					["multi"] = {
						["PRIEST"] = true,
						["PALADIN"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["selfPoint"] = "CENTER",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-FOCUSFRAME-LARGE-FLASH",
			["authorOptions"] = {
			},
			["xOffset"] = -11,
			["discrete_rotation"] = 0,
			["tocversion"] = 40400,
			["id"] = "IMMUNE target visual",
			["width"] = 256,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["uid"] = "25IZogHGlrc",
			["inverse"] = false,
			["alpha"] = 1,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["desc"] = "IMMUNE target highlight texture... (Bubble, Block, Cloak)",
		},
		["HEAL"] = {
			["iconSource"] = 0,
			["color"] = {
				0.01176470588235294, -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["yOffset"] = -361.4005842732191,
			["anchorPoint"] = "CENTER",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "item",
						["use_inverse"] = false,
						["subeventSuffix"] = "_CAST_START",
						["genericShowOn"] = "showOnCooldown",
						["use_genericShowOn"] = true,
						["event"] = "Item Equipped",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["use_itemSetName"] = false,
						["spellIds"] = {
						},
						["use_itemName"] = true,
						["itemName"] = 28522,
						["names"] = {
						},
						["itemSetName"] = "",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subborder",
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						1, -- [2]
						0.06666666666666667, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Gladdy Tooltip round",
					["border_size"] = 13,
				}, -- [2]
			},
			["height"] = 39.5,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
			},
			["cooldown"] = false,
			["displayIcon"] = "Interface\\Icons\\Spell_Holy_GreaterHeal",
			["zoom"] = 0,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["frameStrata"] = 1,
			["id"] = "HEAL",
			["config"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 39.5,
			["uid"] = "3sMuxA7zFAr",
			["inverse"] = false,
			["xOffset"] = -560.355630058134,
			["conditions"] = {
			},
			["information"] = {
			},
			["parent"] = "Weapon Switches",
		},
		["castbar player casttime"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "Yjx7bHW6u",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "%p / %t",
			["yOffset"] = 5,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["spellName"] = 0,
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cast",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["use_absorbMode"] = true,
						["names"] = {
						},
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_legacy_floor"] = false,
			["selfPoint"] = "BOTTOM",
			["displayText_format_t_time_format"] = 0,
			["automaticWidth"] = "Auto",
			["font"] = "Friz Quadrata TT",
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["parent"] = "player",
			["fixedWidth"] = 200,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["internalVersion"] = 66,
			["displayText_format_p_time_mod_rate"] = true,
			["fontSize"] = 12,
			["source"] = "import",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["shadowXOffset"] = 1,
			["config"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
			},
			["anchorFrameFrame"] = "WeakAuras:castbar player group",
			["regionType"] = "text",
			["wordWrap"] = "WordWrap",
			["displayText_format_t_time_dynamic_threshold"] = 60,
			["displayText_format_p_time_precision"] = 1,
			["id"] = "castbar player casttime",
			["displayText_format_t_time_precision"] = 1,
			["semver"] = "1.0.13",
			["shadowYOffset"] = -1,
			["authorOptions"] = {
			},
			["justify"] = "LEFT",
			["tocversion"] = 30402,
			["displayText_format_t_time_legacy_floor"] = false,
			["preferToUpdate"] = true,
			["frameStrata"] = 3,
			["anchorFrameType"] = "SELECTFRAME",
			["xOffset"] = 3,
			["uid"] = "1T4ymU17Hz7",
			["displayText_format_t_time_mod_rate"] = true,
			["displayText_format_1.destName_format"] = "none",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["displayText_format_t_format"] = "timed",
		},
		["HordeProgressBar"] = {
			["user_y"] = 0,
			["iconSource"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.80000001192093, -- [4]
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.54901960784314, -- [1]
				0.086274509803922, -- [2]
				0.086274509803922, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["sparkOffsetY"] = 0,
			["crop_y"] = 0.41,
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\SpellActivationOverlays\\Eclipse_Sun",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["blendMode"] = "BLEND",
			["texture"] = "Smooth",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = false,
			["tocversion"] = 30300,
			["alpha"] = 1,
			["sparkColor"] = {
				1, -- [1]
				0, -- [2]
				0.68627450980392, -- [3]
				1, -- [4]
			},
			["backgroundOffset"] = 2,
			["sparkOffsetX"] = 0,
			["parent"] = "Battleground Widget",
			["customText"] = "function(total, value)    \n    \n    if ( ( aura_env.zone == \"IsleofConquest\" ) \n        or ( aura_env.zone == \"AlteracValley\" ) ) then\n        return value\n    end\n    \n    return (\"%.f / %.f\"):format(value, total)\nend",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "AUTO",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_hide"] = "timed",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["customDuration"] = "function()\n    return aura_env.value, aura_env.total, true      \nend",
						["spellIds"] = {
						},
						["custom"] = "function(event, ...)\n    return aura_env:OnEvent(event, ...)\nend",
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["check"] = "event",
						["event"] = "Health",
						["custom_type"] = "status",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    return true\nend\n\n\n\n\n\n",
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 52,
			["useAdjustedMin"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n  return start + (progress * delta)\nend",
					["use_translate"] = false,
					["use_alpha"] = false,
					["colorB"] = 1,
					["scaleType"] = "straightScale",
					["scalex"] = 1,
					["easeType"] = "none",
					["translateFunc"] = "",
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["use_scale"] = false,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["translateType"] = "custom",
					["rotate"] = 0,
					["duration"] = "1",
					["type"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = true,
			["version"] = 39,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "PT Sans Narrow",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_text_format_c_format"] = "none",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [3]
				{
					["border_offset"] = 5,
					["border_size"] = 20,
					["border_anchor"] = "bg",
					["text_color"] = {
					},
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 25,
			["customTextUpdate"] = "event",
			["zoom"] = 0,
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				[4] = 0,
			},
			["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\SpellActivationOverlays\\Eclipse_Sun",
			["source"] = "import",
			["conditions"] = {
			},
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
			["useAdjustedMax"] = false,
			["mirror"] = false,
			["config"] = {
			},
			["actions"] = {
				["start"] = {
					["do_custom"] = false,
					["custom"] = "",
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\567474.ogg",
					["do_sound"] = false,
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nlocal C_Map = {};\nlocal C_PvP = {};\n\nC_Map[\"ArathiBasin\"] = {\n    progress = 3,\n    index = 2,\n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"AlteracValley\"] = {\n    progress = 3,\n    index = 2,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 600\n};\n\nC_Map[\"IsleofConquest\"] = {\n    progress = 3,\n    index = 2,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 300\n};\n\nC_Map[\"NetherstormArena\"] = {\n    progress = 3,\n    index = 3,\n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"WarsongGulch\"] = {\n    progress = 3,\n    index = 3,\n    curr = 3,\n    find = \"(%d+)[^%d]+(%d+)\",\n    total = 3\n};\n\nfunction C_PvP.IsPvPMap()\n    local inInstance, instanceType = IsInInstance()\n    if ( not inInstance ) then\n        return;\n    end\n    \n    return instanceType == \"pvp\" or instanceType == \"arena\";\nend\n\nfunction aura_env:OnEvent(event, ...)\n    \n    if not C_PvP.IsPvPMap() then\n        return false;\n    end\n    \n    local mapFileName = GetMapInfo();\n    \n    if ( C_Map[mapFileName] ) then\n        RequestBattlefieldScoreData()\n        \n        local number = C_Map[mapFileName]\n        local progress = select(number.progress,GetWorldStateUIInfo(number.index))\n        local curr  = select(number.curr, progress:find(number.find)) \n        \n        aura_env.zone  = mapFileName\n        aura_env.value = tonumber(curr)\n        aura_env.total = number.total\n        \n        return true\n    end\n    \nend\n-----------------------------------------------------------------------------------------------------\n\nlocal frame = WeakAuras.regions[aura_env.id].region;\n\nif ( not frame.texture ) then\n    local texture = CreateFrame(\"Frame\", nil, frame);\n    texture:SetFrameStrata(\"MEDIUM\") ;\n    frame.texture = texture;\n    frame.texture = frame.texture:CreateTexture(nil, \"Texture\");\n    frame.texture:SetTexture([[Interface\\Timer\\Horde-Logo]]);\nend \n\nframe.texture:SetPoint(\"LEFT\", frame, \"RIGHT\", - region:GetHeight() / 1.6, 0);\nframe.texture:SetSize(region:GetHeight() * 2.3, region:GetHeight() * 2.3);\n\n-----------------------------------------------------------------------------------------------------\n\naura_env.value, aura_env.total = math.random(400, 1400), 1600;\n\n\n",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["borderInFront"] = true,
			["compress"] = false,
			["icon_side"] = "LEFT",
			["anchorPoint"] = "CENTER",
			["width"] = 100,
			["sparkHeight"] = 60,
			["borderBackdrop"] = "None",
			["useAdjustededMax"] = false,
			["sparkHidden"] = "NEVER",
			["semver"] = "2.0.0",
			["spark"] = true,
			["id"] = "HordeProgressBar",
			["sparkWidth"] = 15,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 60,
			["icon"] = false,
			["inverse"] = false,
			["load"] = {
				["use_size"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
					},
				},
			},
			["orientation"] = "HORIZONTAL_INVERSE",
			["crop_x"] = 0.41,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["uid"] = "l1TEBj1iqeR",
		},
		["Circle Class Frame [PRIEST]"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["use_unit"] = true,
						["custom_type"] = "event",
						["events"] = "PLAYER_TARGET_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Priest\" then\n        return true\n    else\n        return false\n    end\nend",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Priest",
			["alpha"] = 1,
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PRIEST]",
			["parent"] = "Circle Class Frames (TARGET)",
			["frameStrata"] = 4,
			["width"] = 95,
			["color"] = {
				1, -- [1]
				0.9568627450980392, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["uid"] = "QqN00qtyjy)",
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 42,
		},
		["Circle Class Frame [WARLOCK]"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["events"] = "PLAYER_TARGET_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Warlock\" then\n        return true\n    else\n        return false\n    end\nend",
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warlock",
			["frameStrata"] = 4,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARLOCK]",
			["parent"] = "Circle Class Frames (TARGET)",
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["uid"] = "B95Gb9Dolel",
			["config"] = {
			},
			["color"] = {
				0.9882352941176471, -- [1]
				1, -- [2]
				0.9803921568627451, -- [3]
				1, -- [4]
			},
			["width"] = 95,
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 42,
		},
		["castbar player back"] = {
			["wagoID"] = "Yjx7bHW6u",
			["xOffset"] = 0,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["use_unit"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["width"] = 355,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastback.tga",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back",
			["parent"] = "player",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rotation"] = 0,
			["uid"] = "g40yJbaHWxU",
			["frameStrata"] = 2,
			["config"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellId",
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "easeIn",
					["preset"] = "fade",
					["alpha"] = 0.85,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["preset"] = "fade",
					["duration"] = "",
				},
			},
		},
		["Circle Class Frame [DRUID]"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["use_unit"] = true,
						["custom_type"] = "event",
						["events"] = "PLAYER_TARGET_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Druid\" then\n        return true\n    else\n        return false\n    end\nend",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Druid",
			["anchorFrameType"] = "SELECTFRAME",
			["discrete_rotation"] = 0,
			["parent"] = "Circle Class Frames (TARGET)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [DRUID]",
			["alpha"] = 1,
			["frameStrata"] = 4,
			["width"] = 95,
			["xOffset"] = 42,
			["config"] = {
			},
			["uid"] = "XZST3pUQSTa",
			["color"] = {
				0.984313725490196, -- [1]
				0.9725490196078431, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
		},
		["Circle Class Frame [MAGE]"] = {
			["xOffset"] = 42,
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Mage\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_TARGET_CHANGED",
						["spellIds"] = {
						},
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Mage",
			["width"] = 95,
			["discrete_rotation"] = 0,
			["parent"] = "Circle Class Frames (TARGET)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [MAGE]",
			["alpha"] = 1,
			["frameStrata"] = 4,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.9568627450980392, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["uid"] = "OTPG(0)Aye7",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
		},
		["IMMUNE focus visual"] = {
			["xOffset"] = -11,
			["preferToUpdate"] = false,
			["yOffset"] = -15,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useRem"] = false,
						["type"] = "aura2",
						["useStacks"] = false,
						["auranames"] = {
							"Ice Block", -- [1]
						},
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["names"] = {
						},
						["unitExists"] = false,
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["unit"] = "focus",
						["useExactSpellId"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["useRem"] = false,
						["type"] = "aura2",
						["useStacks"] = false,
						["auranames"] = {
							"Divine Shield", -- [1]
						},
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "focus",
						["unitExists"] = false,
						["names"] = {
						},
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["subeventPrefix"] = "SPELL",
						["useExactSpellId"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["useRem"] = false,
						["type"] = "aura2",
						["useStacks"] = false,
						["auranames"] = {
							"Cloak of Shadows", -- [1]
						},
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["unitExists"] = false,
						["unit"] = "focus",
						["spellIds"] = {
						},
						["names"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["useName"] = true,
						["useExactSpellId"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 75,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 130,
			["rotate"] = false,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
						[103] = true,
					},
				},
				["use_ignoreNameRealm"] = false,
				["class"] = {
					["single"] = "PRIEST",
					["multi"] = {
						["PRIEST"] = true,
						["PALADIN"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["desc"] = "IMMUNE focus highlight texture... (Cloak, Bubble, Block)",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-FOCUSFRAME-LARGE-FLASH",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				0.007843137254901961, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["tocversion"] = 40400,
			["id"] = "IMMUNE focus visual",
			["anchorFrameType"] = "SELECTFRAME",
			["frameStrata"] = 2,
			["width"] = 256,
			["config"] = {
			},
			["uid"] = "9BBiT8OblIu",
			["inverse"] = false,
			["alpha"] = 1,
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["discrete_rotation"] = 0,
		},
		["player"] = {
			["controlledChildren"] = {
				"castbar player back text", -- [1]
				"castbar player back end text", -- [2]
				"castbar player back", -- [3]
				"castbar player back end", -- [4]
				"castbar player interrupt", -- [5]
				"castbar player group", -- [6]
				"castbar player border", -- [7]
				"castbar player spark", -- [8]
				"castbar player border end", -- [9]
				"castbar player end text", -- [10]
				"castbar player end", -- [11]
				"castbar player casttime", -- [12]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "Yjx7bHW6u",
			["parent"] = "castbars",
			["preferToUpdate"] = true,
			["yOffset"] = -329.0891433609878,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["version"] = 14,
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1.149999976158142,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "player",
			["borderInset"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["xOffset"] = 132.2259608440456,
			["uid"] = "1zJ9fal2OdA",
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Circle Class Frame [PALADIN] 2"] = {
			["parent"] = "Circle Class Frames (FOCUS)",
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["use_unit"] = true,
						["custom_type"] = "event",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Paladin\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Paladin",
			["anchorFrameType"] = "SELECTFRAME",
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PALADIN] 2",
			["alpha"] = 1,
			["frameStrata"] = 4,
			["width"] = 95,
			["config"] = {
			},
			["uid"] = "hZI1fzlp1If",
			["authorOptions"] = {
			},
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["color"] = {
				1, -- [1]
				0.9254901960784314, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
		},
		["castbar player end"] = {
			["wagoID"] = "Yjx7bHW6u",
			["parent"] = "player",
			["preferToUpdate"] = true,
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.5, -- [4]
			},
			["yOffset"] = 0.5,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["animationType"] = "loop",
			["sameTexture"] = true,
			["hideBackground"] = true,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["customForegroundRows"] = 8,
			["frameRate"] = 60,
			["internalVersion"] = 66,
			["rotate"] = true,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_translate"] = true,
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "easeOut",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    local prog\n    if(progress < 0.25) then\n        prog = progress * 4\n    elseif(progress < .75) then\n        prog = 2 - (progress * 4)\n    else\n        prog = (progress - 1) * 4\n    end\n    return startX + (prog * deltaX), startY + (prog * deltaY)\nend\n",
					["scaley"] = 1,
					["alpha"] = 0,
					["scalex"] = 1,
					["y"] = 0,
					["x"] = 2,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["translateType"] = "shake",
					["easeStrength"] = 5,
					["preset"] = "shake",
					["colorB"] = 1,
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
			},
			["customForegroundFileHeight"] = 256,
			["customBackgroundRows"] = 16,
			["customForegroundFileWidth"] = 1024,
			["selfPoint"] = "CENTER",
			["rotation"] = 0,
			["startPercent"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 12,
			["customForegroundFrameHeight"] = 26,
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "event",
						["duration"] = "0.1",
						["event"] = "Health",
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["spellIds"] = {
						},
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["names"] = {
						},
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["xOffset"] = 3.5,
			["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\stopmotion",
			["source"] = "import",
			["foregroundTexture"] = "Interface\\Addons\\TextureScript\\CastBar\\uicastingbarstandardflipbook.tga",
			["backgroundPercent"] = 1,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.40015864372253, -- [4]
			},
			["mirror"] = false,
			["config"] = {
			},
			["regionType"] = "stopmotion",
			["url"] = "",
			["endPercent"] = 1,
			["customForegroundFrameWidth"] = 424,
			["width"] = 207,
			["customForegroundColumns"] = 2,
			["blendMode"] = "ADD",
			["customBackgroundFrames"] = 0,
			["customBackgroundColumns"] = 16,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player end",
			["customForegroundFrames"] = 15,
			["frameStrata"] = 3,
			["anchorFrameType"] = "SCREEN",
			["discrete_rotation"] = 0,
			["uid"] = "bw88STZMPeK",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "show",
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["desaturateForeground"] = false,
		},
		["castbar player back text"] = {
			["wagoID"] = "Yjx7bHW6u",
			["xOffset"] = 4,
			["preferToUpdate"] = true,
			["yOffset"] = -8,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["use_unit"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 40,
			["rotate"] = true,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["width"] = 355,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastbacktext.tga",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back text",
			["parent"] = "player",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rotation"] = 0,
			["uid"] = "zefS2NrCRus",
			["frameStrata"] = 2,
			["config"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellId",
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "easeIn",
					["preset"] = "fade",
					["alpha"] = 0.85,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["preset"] = "fade",
					["duration"] = "",
				},
			},
		},
		["AllianceFlag"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "BOTTOM",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nif ( not region.background ) then\n    region.background = region:CreateTexture(nil, \"BACKGROUND\");\nend\nregion.background:SetTexture([[Interface\\WorldStateFrame\\HordeFlagFlash]]);\nregion.background:SetBlendMode(\"ADD\");\nregion.background:ClearAllPoints();\nregion.background:SetPoint(\"CENTER\", region, \"CENTER\");\nregion.background:SetSize(region:GetWidth()*0.75 , region:GetHeight()*0.75);\n\naura_env.BGcolor = {};\n\nfor key, value in pairs(aura_env.config[\"color\"]) do\n    aura_env.BGcolor[key] = value;\nend",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
						["custom"] = "function(event, ...)\n    if not ( GetMapInfo() == \"WarsongGulch\" ) then return end\n    return select(2, GetWorldStateUIInfo(3)) == 2 \nend",
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCOREUPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["spellIds"] = {
						},
						["customTexture"] = "function()   \n    return [[Interface\\WorldStateFrame\\AllianceFlag]] \nend",
						["check"] = "event",
						["custom_type"] = "status",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    return true\nend",
					},
				}, -- [1]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1] \nend",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2);\n    local alpha = start + (((math.sin(angle) + 1)/2) * delta);\n    aura_env.region.background:SetVertexColor(aura_env.BGcolor[1], aura_env.BGcolor[2], aura_env.BGcolor[3], alpha);\n    return start;\nend",
					["use_alpha"] = true,
					["type"] = "custom",
					["scalex"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["colorType"] = "custom",
					["preset"] = "pulse",
					["colorA"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local alpha = 1 + (((math.sin(angle) + 1)/2) * 0.5)\n    WeakAuras.regions[aura_env.id].region.background:SetVertexColor(1, 1, 1, alpha)\n    return r1, g1, b1, a1\nend\n\n\n\n",
					["rotate"] = 0,
					["use_color"] = false,
					["duration"] = "1",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 39,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 50,
			["rotate"] = true,
			["load"] = {
				["use_size"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
						["pvp"] = true,
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "WeakAuras:HordeProgressBar",
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["authorOptions"] = {
				{
					["type"] = "color",
					["key"] = "color",
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useDesc"] = false,
					["name"] = "Цвет фона флага",
					["width"] = 1,
				}, -- [1]
			},
			["parent"] = "Battleground Widget",
			["anchorFrameParent"] = false,
			["texture"] = "Interface\\WorldStateFrame\\AllianceFlag",
			["xOffset"] = 0,
			["selfPoint"] = "TOP",
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "AllianceFlag",
			["anchorFrameType"] = "SELECTFRAME",
			["frameStrata"] = 4,
			["width"] = 50,
			["config"] = {
				["color"] = {
					0.21176470588235, -- [1]
					0.78039215686275, -- [2]
					1, -- [3]
					1, -- [4]
				},
			},
			["uid"] = "0pfDqSK9IuM",
			["alpha"] = 1,
			["rotation"] = 0,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
		},
		["HordeFlag"] = {
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "BOTTOM",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nif ( not region.background ) then\n    region.background = region:CreateTexture(nil, \"BACKGROUND\");\nend\nregion.background:SetTexture([[Interface\\WorldStateFrame\\HordeFlagFlash]]);\nregion.background:SetBlendMode(\"ADD\");\nregion.background:ClearAllPoints();\nregion.background:SetPoint(\"CENTER\", region, \"CENTER\");\nregion.background:SetSize(region:GetWidth()*0.75 , region:GetHeight()*0.75);\n\naura_env.BGcolor = {};\n\nfor key, value in pairs(aura_env.config[\"color\"]) do\n    aura_env.BGcolor[key] = value;\nend",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
						["custom"] = "function(event, ...)\n    if not ( GetMapInfo() == \"WarsongGulch\" ) then return end\n    return select(2, GetWorldStateUIInfo(2)) == 2 \nend",
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["spellIds"] = {
						},
						["customTexture"] = "function()   \n    return [[Interface\\WorldStateFrame\\HordeFlag]] \nend",
						["check"] = "event",
						["custom_type"] = "status",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    return true\nend",
					},
				}, -- [1]
				["disjunctive"] = "any",
				["customTriggerLogic"] = "function(trigger)\n    return trigger[1] \nend",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "custom",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2);\n    local alpha = start + (((math.sin(angle) + 1)/2) * delta);\n    aura_env.region.background:SetVertexColor(aura_env.BGcolor[1], aura_env.BGcolor[2], aura_env.BGcolor[3], alpha);\n    return start;\nend",
					["use_alpha"] = true,
					["type"] = "custom",
					["scalex"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["colorType"] = "custom",
					["preset"] = "pulse",
					["colorA"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local alpha = 1 + (((math.sin(angle) + 1)/2) * 0.5)\n    WeakAuras.regions[aura_env.id].region.background:SetVertexColor(1, 1, 1, alpha)\n    return r1, g1, b1, a1\nend\n\n\n\n",
					["rotate"] = 0,
					["use_color"] = false,
					["duration"] = "1",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 39,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 50,
			["rotate"] = true,
			["load"] = {
				["use_size"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
						["pvp"] = true,
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "WeakAuras:AllianceProgressBar",
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["authorOptions"] = {
				{
					["type"] = "color",
					["key"] = "color",
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["useDesc"] = false,
					["name"] = "Цвет фона флага",
					["width"] = 1,
				}, -- [1]
			},
			["parent"] = "Battleground Widget",
			["anchorFrameParent"] = false,
			["texture"] = "Interface\\WorldStateFrame\\HordeFlag",
			["xOffset"] = 0,
			["selfPoint"] = "TOP",
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "HordeFlag",
			["anchorFrameType"] = "SELECTFRAME",
			["frameStrata"] = 4,
			["width"] = 50,
			["config"] = {
				["color"] = {
					1, -- [1]
					0.5529411764705901, -- [2]
					0, -- [3]
					1, -- [4]
				},
			},
			["uid"] = "8x5(4W69qAm",
			["alpha"] = 1,
			["rotation"] = 0,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
		},
		["PW: Shield (Self indicator)"] = {
			["config"] = {
			},
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["mirror"] = false,
			["yOffset"] = -362.9558712188952,
			["anchorPoint"] = "CENTER",
			["xOffset"] = -23.88891101596016,
			["blendMode"] = "BLEND",
			["rotate"] = false,
			["regionType"] = "texture",
			["color"] = {
				1, -- [1]
				0, -- [2]
				0.09803921568627451, -- [3]
				0.5200000107288361, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["texture"] = "Interface\\Addons\\TextureScript\\Swipe",
			["anchorFrameType"] = "SCREEN",
			["internalVersion"] = 52,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["auranames"] = {
							"Weakened Soul", -- [1]
						},
						["useName"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
			},
			["id"] = "PW: Shield (Self indicator)",
			["rotation"] = 0,
			["alpha"] = 1,
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["uid"] = "(gJ6REEYYRb",
			["width"] = 36,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 36,
			["conditions"] = {
			},
			["information"] = {
			},
			["frameStrata"] = 6,
		},
		["Water Elemental Cast Status"] = {
			["controlledChildren"] = {
				"UI - pet castbar bar", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "OFUbeHBSv",
			["xOffset"] = -1.8999262776022,
			["preferToUpdate"] = false,
			["yOffset"] = -38,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 1,
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 0.66,
			["border"] = false,
			["anchorFrameFrame"] = "PetFrame",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.0",
			["tocversion"] = 30300,
			["id"] = "Water Elemental Cast Status",
			["borderInset"] = 1,
			["frameStrata"] = 5,
			["anchorFrameType"] = "SELECTFRAME",
			["selfPoint"] = "CENTER",
			["uid"] = "(PUE5jHMPH6",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["borderEdge"] = "Square Full White",
		},
		["Cheeta - Enhanced Stacking Nameplate - Core"] = {
			["iconSource"] = -1,
			["cooldownTextEnabled"] = true,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["url"] = "https://wago.io/AQdGXNEBH/5",
			["icon"] = true,
			["keepAspectRatio"] = false,
			["wordWrap"] = "WordWrap",
			["desc"] = "Author - Cheeta\n____________________________________\nProblems/Questions/Improvements:\nDiscord: cheeta.exe",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["load"] = {
				["talent2"] = {
					["multi"] = {
					},
				},
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "WARLOCK",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["zone"] = "Eiskronenzitadelle",
				["zoneId"] = "605",
				["difficulty"] = {
					["multi"] = {
					},
				},
				["use_zoneId"] = false,
				["talent3"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["use_zone"] = false,
				["role"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["flexible"] = true,
						["ten"] = true,
						["twentyfive"] = true,
						["fortyman"] = true,
						["twenty"] = true,
					},
				},
			},
			["shadowXOffset"] = 1,
			["regionType"] = "text",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_Smooth_Border2",
			["zoom"] = 0,
			["auto"] = false,
			["tocversion"] = 30300,
			["alpha"] = 1,
			["config"] = {
				["yspace"] = 30,
				["speedlower"] = 1,
				["speed"] = 0.7,
				["xspace"] = 150,
				["speedraise"] = 1,
				["IgnoreNames"] = {
				},
				["upperborder"] = 30,
				["nameplatefix"] = false,
				["width"] = 150,
				["FreezeMouseover"] = false,
				["originpos"] = 20,
				["interval"] = 0.01,
				["hitbox"] = false,
				["height"] = 20,
				["HideLDW"] = false,
				["AutoMouseOver"] = false,
				["speedreset"] = 1,
			},
			["fixedWidth"] = 200,
			["outline"] = "OUTLINE",
			["wagoID"] = "AQdGXNEBH",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["shadowYOffset"] = -1,
			["customTextUpdate"] = "event",
			["cooldownEdge"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "status",
						["event"] = "Health",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["custom"] = "function()\n    if not aura_env.last or aura_env.last < GetTime() - aura_env.config.interval then\n        aura_env.last = GetTime()\n        aura_env:UpdateStacking()\n        \n        if aura_env.config.AutoMouseOver then\n            for nameplate, _ in pairs(aura_env.MouseoverFrame) do\n                local isElvUI, Plate = aura_env.ElvUINamplate(nameplate)\n                if isElvUI and Plate.isTarget then \n                    aura_env:MoveNameplate(nameplate,false)\n                end\n            end \n        end\n    end\nend",
						["check"] = "update",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "event",
						["custom_hide"] = "custom",
						["event"] = "Health",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["names"] = {
						},
						["check"] = "event",
						["custom"] = "function(event,...)\n    if event == \"NP_SHOW\" then\n        local nameplate = ...\n        if aura_env.config.hitbox and InCombatLockdown() then\n            aura_env:SetID(nameplate)\n            aura_env:ToggleHitboxFrame();aura_env:ToggleHitboxFrame()\n        end\n        if aura_env.config.AutoMouseOver then\n            aura_env:AutoMouseOver(nameplate)\n        end\n    elseif event ==\"NP_HIDE\" and aura_env.config.hitbox and InCombatLockdown() then\n        aura_env:ToggleHitboxFrame();aura_env:ToggleHitboxFrame()    \n    elseif event == \"PLAYER_REGEN_DISABLED\" and aura_env.config.hitbox then \n        aura_env:ToggleIDStartFrame();aura_env:ToggleIDStartFrame()\n        aura_env:ToggleHitboxFrame();aura_env:ToggleHitboxFrame()\n    elseif event == \"COMBAT_LOG_EVENT_UNFILTERED\" and aura_env.config.HideLDW then\n        -- LDW MC Fix, deactivate nameplates if under mc\n        local _, subEvent, _,_,_,_, destName, _,spellID = ...\n        if spellID == 71289 and destName == UnitName(\"player\") then\n            SetUIVisibility(false);\n            WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, 12.2, \"RESET_NAMEPLATES\")\n        end\n    elseif event == \"UPDATE_MOUSEOVER_UNIT\" and aura_env.config.AutoMouseOver then\n        for nameplate, _ in pairs(aura_env.MouseoverFrame) do\n            local isElvUI, Plate = aura_env.ElvUINamplate(nameplate)\n            if select(6,nameplate:GetRegions()):IsShown() \n            or (isElvUI and Plate.isTarget) then \n                aura_env:MoveNameplate(nameplate,false)\n            end\n        end\n    elseif event == \"RESET_NAMEPLATES\" then  \n        SetUIVisibility(true);\n    elseif event ==\"AUTOMOUSEOVER_MOUSELOOK\" then\n        if aura_env.MouseLook and IsMouseButtonDown(\"RightButton\") then\n            MouselookStart()    \n            aura_env.MouseLook = false\n        end\n    end\nend",
						["events"] = "NP_SHOW, NP_HIDE, PLAYER_REGEN_DISABLED, RESET_NAMEPLATES, CLEU:SPELL_AURA_APPLIED, UPDATE_MOUSEOVER_UNIT, AUTOMOUSEOVER_MOUSELOOK",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "custom",
				["customTriggerLogic"] = "\n\n",
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["discrete_rotation"] = 0,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 50,
			["rotate"] = true,
			["fontSize"] = 12,
			["source"] = "import",
			["mirror"] = false,
			["uid"] = "S0u2X)hQ4gi",
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["parent"] = "Cheeta - Enhanced Stacking Nameplate",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["displayText"] = "",
			["displayText_format_p_time_precision"] = 1,
			["displayIcon"] = "Interface\\Icons\\Spell_ChargePositive",
			["desaturate"] = false,
			["semver"] = "1.0.4",
			["justify"] = "LEFT",
			["anchorFrameType"] = "SCREEN",
			["id"] = "Cheeta - Enhanced Stacking Nameplate - Core",
			["xOffset"] = 0,
			["frameStrata"] = 1,
			["width"] = 50,
			["selfPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "-- Watch NamePlate Events\nWeakAuras.WatchNamePlates()\n\nlocal me = aura_env\nme.c = me.config\n\n--IgnoreEnemy by Name\naura_env.ignoreNames = {}\nfor i,_ in pairs(me.c.IgnoreNames) do\n    for _,nameString in pairs(me.c.IgnoreNames[i]) do\n        aura_env.ignoreNames[nameString] = true\n    end\nend\n\n--Ignore LK Valks without RaidIcon\nlocal L = GetLocale()\naura_env.LocalValkName = {\n    [\"enUS\"] = \"Val'kyr Shadowguard\",\n    [\"deDE\"] = \"Schattenwächterin der Val'kyr\",\n    [\"esES\"] = \"Guardia de las Sombras Val'kyr\",\n    [\"frFR\"] = \"Garde de l'ombre val'kyr\",\n}\n\nlocal NP = ElvUI and ElvUI[1]:GetModule(\"NamePlates\")\n-- Friendly Nameplates clickthrough out of combat\n--if NP then\n--    NP.db.clickThrough[\"friendly\"] = true\n--end\n\nme.c.AutoMouseOver = me.c.AutoMouseOver and NP -- Option was only tested with ElvUI\n\nlocal GetTime = GetTime\nlocal GetCVar, SetCVar = GetCVar, SetCVar\nlocal ToggleFrame = ToggleFrame\nlocal GetScreenWidth = GetScreenWidth\nlocal Weakauras = Weakauras\nlocal CreateFrame = CreateFrame\nlocal GetScreenWidth = GetScreenWidth\nlocal UIPanelWindows = UIPanelWindows\n\naura_env.last = GetTime()\n\n-- Set Blizzard Nameplate Mode to allow overlap \nif GetCVar(\"nameplateAllowOverlap\")==\"0\" then\n    SetCVar(\"nameplateAllowOverlap\", 1)\nend\n\nlocal ScreenWidth = GetScreenWidth() * UIParent:GetEffectiveScale()\nlocal ScreenHeight = 768\n\n-- Enlarging of WorldFrame, so that nameplates are displayed even if they have slightly left the screen \n-- or are very high up, as is the case with large bosses.\nWorldFrame:ClearAllPoints(); \nWorldFrame:SetWidth(ScreenWidth);\nif me.c.nameplatefix then\n    WorldFrame:SetHeight(ScreenHeight*5);\nelse\n    WorldFrame:SetHeight(ScreenHeight); \nend\nWorldFrame:SetPoint(\"BOTTOM\");\n\n\nfunction aura_env:GetUnitInfo(frame)\n    local r, g, b = frame:GetStatusBarColor()\n    if r < 0.01 then\n        if b < 0.01 and g > 0.99 then\n            return 5, \"FRIENDLY_NPC\"\n        elseif b > 0.99 and g < 0.01 then\n            return 5, \"FRIENDLY_PLAYER\"\n        end\n    elseif r > 0.99 then\n        if b < 0.01 and g > 0.99 then\n            return 4, \"ENEMY_NPC\"\n        elseif b < 0.01 and g < 0.01 then\n            return 2, \"ENEMY_NPC\"\n        end\n    elseif r > 0.5 and r < 0.6 then\n        if g > 0.5 and g < 0.6 and b > 0.5 and b < 0.6 then\n            return 1, \"ENEMY_NPC\"\n        end\n    end\n    return 3, \"ENEMY_PLAYER\"\nend\n\n\n\nlocal delta = me.c.speed * 5\n\nfunction aura_env:ResetPosition(oldposition)\n    local newposition = oldposition - exp(-10/oldposition)*delta*me.c.speedreset\n    return newposition\nend\n\nfunction aura_env:RaisePosition(min, oldposition)\n    local yspace = me.c.yspace\n    local newposition = oldposition + exp(-min/yspace)*delta*me.c.speedraise\n    return newposition\nend\n\nfunction aura_env:LowerPosition(min, oldposition)\n    local yspace = me.c.yspace\n    local newposition = oldposition - exp(-yspace/min)*delta*0.8*me.c.speedlower\n    return newposition\nend\n\n-- Main Function\n-- First, the coordinates of all enemy nameplates are saved in an array, non-visible nameplates are reset.\n-- It is then iterated through the nameplates and the minimum distance to the next nameplate is determined for each nameplate.\n-- If there is no other nameplate in the immediate vicinity of the original position, the position is reset (to prevent the nameplates from rising higher and higher)\n-- Depending on whether the position is to be reset or the nameplate is above or below the closest one\n-- different functions are used for a smooth movement.\nfunction aura_env.ElvUINamplate(nameplate)\n    local Plate = select(3, nameplate:GetChildren()) --ElvUI Plate\n    if Plate then\n        local PlateName = Plate:GetName()\n        if PlateName and strmatch(PlateName, '^ElvUI_NamePlate%d+$') then\n            return true, Plate\n        end\n    end\n    return false\nend\n\nfunction aura_env:IgnoreNameplate(nameplate)\n    local Health = select(1,nameplate:GetChildren())\n    local reaction\n    if Health then\n        reaction = aura_env:GetUnitInfo(Health)\n    end\n    if reaction and reaction ~= 5 then --nameplate from Enemy\n        local nameframe = select(7, nameplate:GetRegions())\n        local FSPAT = \"%s*\"..(gsub(gsub(_G.FOREIGN_SERVER_LABEL, \"^%s\", \"\"), \"[%*()]\", \"%%%1\"))..\"$\"\n        local name = gsub(nameframe:GetText() or \"\", FSPAT, \"\")\n        if aura_env.ignoreNames[name] then -- Ignore by Name\n            return true\n        end\n        if name == aura_env.LocalValkName[L] then --Ignore LK Valks without RaidIcon\n            local isElvUI, Plate = aura_env.ElvUINamplate(nameplate)\n            if isElvUI then\n                if not Plate.RaidIcon:IsShown() then\n                    return true\n                end\n            end\n        end\n        return false\n    end\n    return true\nend\n\naura_env.Plates = {}\nfunction aura_env:UpdateStacking()\n    local xspace = me.c.xspace\n    local yspace = me.c.yspace\n    \n    local numChildren = WorldFrame:GetNumChildren()\n    for i = 1, numChildren do\n        local nameplate = select(i,WorldFrame:GetChildren())\n        \n        if nameplate:IsShown() and nameplate:IsProtected() and not aura_env:IgnoreNameplate(nameplate) then\n            local x, y = select(4, nameplate:GetPoint(1))\n            \n            if not aura_env.Plates[nameplate] then\n                aura_env.Plates[nameplate]={xpos = 0, ypos = 0, position = 0}\n            end\n            \n            aura_env.Plates[nameplate].xpos = x\n            aura_env.Plates[nameplate].ypos = y\n        else\n            aura_env.Plates[nameplate] = nil\n            nameplate:SetClampRectInsets(0, 0, 0, 0)\n            nameplate:SetClampedToScreen(false)\n        end\n    end\n    for frame_1, nameplate_1 in pairs(aura_env.Plates) do\n        local width, height = frame_1:GetSize()\n        \n        if (aura_env.config.AutoMouseOver and aura_env.MouseoverFrame[frame_1]) then -- Ignore Frames for AutoMouseOver\n            -- reposition frames in case mouse has been moved\n            local x, y = GetCursorPosition()\n            \n            frame_1:SetClampedToScreen()\n            frame_1:SetClampRectInsets(-2*ScreenWidth, ScreenWidth - x - width/2, ScreenHeight - y - height/2, -2*ScreenHeight)\n            \n        elseif (aura_env.config.FreezeMouseover and select(6,frame_1:GetRegions()):IsShown()) then  --Freeze Mouseover Nameplate\n            local x,y =  frame_1:GetCenter() --This Coordinates are the \"real\" values for the center point\n            local newposition = y-nameplate_1.ypos - me.c.originpos + height/2\n            nameplate_1.position = newposition\n            nameplate_1.xpos = x\n            \n            frame_1:SetClampedToScreen()\n            frame_1:SetClampRectInsets(-2*ScreenWidth, ScreenWidth - x - width/2, ScreenHeight - y - height/2, -2*ScreenHeight)\n            \n        else\n            local min = 1000\n            local reset = true\n            for frame_2, nameplate_2 in pairs(aura_env.Plates) do\n                if frame_1 ~= frame_2 then\n                    local xdiff = nameplate_1.xpos - nameplate_2.xpos\n                    local ydiff = nameplate_1.ypos + nameplate_1.position - nameplate_2.ypos - nameplate_2.position\n                    local ydiff_origin = nameplate_1.ypos - nameplate_2.ypos - nameplate_2.position\n                    \n                    if abs(xdiff) < xspace then --only consider nameplates in xspace\n                        if ydiff >= 0 and abs(ydiff) < min then --find minimal distance from other nameplate_2 below nameplate_1 \n                            min = abs(ydiff)\n                        end\n                        if abs(ydiff_origin) < yspace + 2*delta then\n                            reset = false  -- no reset if nameplate near origin position\n                        end\n                    end\n                end\n            end\n            \n            local oldposition = nameplate_1.position\n            local newposition = oldposition\n            if oldposition >= 2*delta and reset then\n                newposition = aura_env:ResetPosition(oldposition)\n            elseif  min < yspace then\n                newposition = aura_env:RaisePosition(min,oldposition)\n            elseif (oldposition >= 2*delta and min > yspace + delta*2) then\n                newposition = aura_env:LowerPosition(min,oldposition)\n            end\n            \n            nameplate_1.position = newposition\n            \n            frame_1:SetClampedToScreen()\n            frame_1:SetClampRectInsets(-10, 10, me.c.upperborder, - nameplate_1.ypos - newposition - me.c.originpos + height)\n        end\n    end\nend\n\naura_env.MouseoverFrame = {}\n-- Auto Mouseover: After a new nameplate appears, it is automatically placed under the mouse cursor so that nameplate addons can assign the GUID. \nfunction aura_env:MoveNameplate(nameplate, move)\n    local _ , Plate = aura_env.ElvUINamplate(nameplate)\n    if move then\n        Plate:Hide()\n        local x, y = GetCursorPosition()\n        nameplate:SetClampedToScreen()\n        nameplate:SetClampRectInsets(-2*ScreenWidth, ScreenWidth-x-me.c.width/2, ScreenHeight-y-me.c.height/2, -2*ScreenHeight)\n        aura_env.MouseoverFrame[nameplate] = true\n    else\n        Plate:Show()\n        nameplate:SetClampRectInsets(0, 0, 0, 0)\n        nameplate:SetClampedToScreen()\n        aura_env.MouseoverFrame[nameplate] = nil\n    end\nend\n\nfunction aura_env:AutoMouseOver(nameplate)\n    if IsMouseButtonDown(\"LeftButton\") then return end\n    local Health = select(1,nameplate:GetChildren())\n    local reaction\n    if Health then\n        reaction, _ = aura_env:GetUnitInfo(Health)\n    end\n    if reaction and reaction ~= 5 then --nameplate from Enemy\n        -- When the right mouse button is pressed (in MouseLook), \n        -- it must be released for a short period of time so that the cursor can capture the nameplate.\n        if IsMouselooking() or aura_env.MouseLook then \n            if aura_env.MouseLook then\n                WeakAuras.timer:CancelTimer(aura_env.timer)\n            end\n            aura_env.MouseLook = true\n            MouselookStop() \n            aura_env.timer=WeakAuras.timer:ScheduleTimer(WeakAuras.ScanEvents, 0.05, \"AUTOMOUSEOVER_MOUSELOOK\")\n        end\n        aura_env:MoveNameplate(nameplate,true)\n    end\nend\n\n\nlocal TriggerFrames = {}\n-- Change Nameplate Hitbox during Combat\nif not aura_env.h then\n    local h = CreateFrame(\"Frame\", \"SetHitboxFrame\", UIParent, \"SecureHandlerShowHideTemplate\") \n    h:SetFrameRef(\"WorldFrame\", WorldFrame)\n    \n    -- Change Hitbox of Enemy Nameplates based Config height/width\n    -- Nameplates that are already displayed can be found in the Plates array. \n    -- Firstly, the array is cleared of plates that are no longer visible.\n    --Since this part only works in combat, all already visible nameplates must be transferred at the start. \n    -- It is assumed that the hitbox is changed correctly via e.g. ElvUI out of combat.\n    -- Worlframe is assigned a different ID depending on last shown frame is an enemy or friendly nameplate.\n    -- Friendly nameplates (ID = 1) are made click-through\n    SecureHandlerWrapScript(h, \"OnShow\", h,[[\n        local WorldFrame = self:GetFrameRef(\"WorldFrame\");\n        local height = self:GetAttribute(\"height\")\n        local width = self:GetAttribute(\"width\")\n        Plates = Plates or table.new()\n        for plate, shown in pairs(Plates) do\n            if shown and not plate:IsShown() then\n                Plates[plate] = nil\n            end\n        end\n        for i, nameplate in pairs(newtable(WorldFrame:GetChildren())) do\n            if nameplate:IsShown() and nameplate:IsProtected() and not Plates[nameplate] then\n                Plates[nameplate] = true\n                if WorldFrame:GetID() == 1 then\n                    nameplate:SetWidth(1)\n                    nameplate:SetHeight(1)\n                elseif WorldFrame:GetID() == 0 then\n                    nameplate:SetWidth(width)\n                    nameplate:SetHeight(height)\n                end\n            end\n        end\n        ]])\n    aura_env.h = h \n    TriggerFrames[\"SetHitboxFrame\"] = h\nend\naura_env.h:SetAttribute(\"height\", aura_env.c.height)\naura_env.h:SetAttribute(\"width\", aura_env.c.width)\n\n-- Toggle Function\nfunction aura_env:ToggleHitboxFrame()\n    ToggleFrame(aura_env.h);\nend\n\n-- Worlframe switch ID depending on last shown frame is an enemy or friendly nameplate.\n-- ID == 0 for last Frame is Enemy Nameplate\n-- ID == 2 for last Frame is Friendly Nameplate\nfunction aura_env:SetID(nameplate)\n    local Health = nameplate:GetChildren()\n    local reaction, _ = aura_env:GetUnitInfo(Health)\n    \n    -- Worlframe switch ID depending on last shown frame is an enemy or friendly nameplate.\n    -- ID == 0 for last Frame is Enemy Nameplate\n    -- ID == 2 for last Frame is Friendly Nameplate\n    \n    local ID = WorldFrame:GetID() \n    if reaction == 5 and (ID == 0 or ID == 5) then \n        --lastFrame is Friendly but WorldFrame ID for Enemy\n        aura_env:ToggleIDFriendlyFrame();aura_env:ToggleIDFriendlyFrame()  \n    elseif reaction ~= 5 and (ID == 1 or ID == 5) then\n        --lastFrame is Enemy but WorldFrame ID for Friendly\n        aura_env:ToggleIDEnemyFrame();aura_env:ToggleIDEnemyFrame()\n    end\nend\n\nif not aura_env.v then\n    local v = CreateFrame(\"Frame\", \"WorldFrameSetIDStartFrame\", UIParent, \"SecureHandlerShowHideTemplate\") \n    v:SetFrameRef(\"WorldFrame\", WorldFrame)\n    SecureHandlerWrapScript(v, \"OnShow\", v,[[\n        local WorldFrame = self:GetFrameRef(\"WorldFrame\");\n        WorldFrame:SetID(5)\n        ]])\n    aura_env.v = v\n    TriggerFrames[\"WorldFrameSetIDStartFrame\"] = v\nend\n\n-- Toggle Function\nfunction aura_env:ToggleIDStartFrame()\n    ToggleFrame(aura_env.v);\nend\n\nif not aura_env.w then\n    local w = CreateFrame(\"Frame\", \"WorldFrameSetIDFriendlyFrame\", UIParent, \"SecureHandlerShowHideTemplate\") \n    w:SetFrameRef(\"WorldFrame\", WorldFrame)\n    SecureHandlerWrapScript(w, \"OnShow\", w,[[\n        local WorldFrame = self:GetFrameRef(\"WorldFrame\");\n        WorldFrame:SetID(1)\n        ]])\n    aura_env.w = w \n    TriggerFrames[\"WorldFrameSetIDFriendlyFrame\"] = w\nend\n\n-- Toggle Function\nfunction aura_env:ToggleIDFriendlyFrame()\n    ToggleFrame(aura_env.w);\nend\n\nif not aura_env.x then\n    local x = CreateFrame(\"Frame\", \"WorldFrameSetIDEnemyFrame\", UIParent, \"SecureHandlerShowHideTemplate\") \n    x:SetFrameRef(\"WorldFrame\", WorldFrame)\n    SecureHandlerWrapScript(x, \"OnShow\", x,[[\n        local WorldFrame = self:GetFrameRef(\"WorldFrame\");\n        WorldFrame:SetID(0)\n        ]])\n    aura_env.x = x\n    TriggerFrames[\"WorldFrameSetIDEnemyFrame\"] = x\nend\n\n-- Toggle Function\nfunction aura_env:ToggleIDEnemyFrame()\n    ToggleFrame(aura_env.x);\nend\n\n-- Add frames to the global table for frames controlled by the ToggleFrame API\nfor name, frame in pairs(TriggerFrames) do\n    if not UIPanelWindows[name] or true then   \n        UIPanelWindows[name] = { area = \"left\",    pushable = 8,    whileDead = 1, };\n        frame:SetAttribute(\"UIPanelLayout-defined\", true);\n        for attribute, value in pairs(UIPanelWindows[name]) do\n            frame:SetAttribute(\"UIPanelLayout-\"..attribute, value);\n        end\n        frame:SetAttribute(\"UIPanelLayout-enabled\", true);\n    end\nend",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
			},
			["inverse"] = false,
			["automaticWidth"] = "Auto",
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["cooldown"] = false,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = true,
					["desc"] = "Shows nameplates that would otherwise go over the top of the screen and would not be visible.",
					["key"] = "nameplatefix",
					["useDesc"] = true,
					["name"] = "Tall boss nameplate fix",
					["width"] = 1,
				}, -- [1]
				{
					["type"] = "toggle",
					["default"] = true,
					["desc"] = "If you are mind-controlled by Lady Deathwhisper , the nameplates are deactivated for a better overview",
					["key"] = "HideLDW",
					["useDesc"] = true,
					["name"] = "Hide on LDW MC",
					["width"] = 1,
				}, -- [2]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "This option makes it so that whenever a nameplate appears, it is first automatically placed below the cursor so that addons such as ElvUI can assign the GUID. This does not work if the left mouse button is pressed at the same time, because no frames can be mouseovered. When the right mouse button is pressed, it is deactivated for a short moment.",
					["key"] = "AutoMouseOver",
					["useDesc"] = true,
					["name"] = "AutoMouseOver (ElvUI)",
					["width"] = 1,
				}, -- [3]
				{
					["type"] = "toggle",
					["default"] = false,
					["desc"] = "Stops the MouseOver nampelate from moving for better selection",
					["key"] = "FreezeMouseover",
					["useDesc"] = true,
					["name"] = "Freeze MouseOver",
					["width"] = 1,
				}, -- [4]
				{
					["type"] = "description",
					["text"] = "|cffFF0000NOTE:|r Only use one of the MouseOver Features, otherwise Errors occur if a new nameplate appears while another nameplate is frozen.",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [5]
				{
					["subOptions"] = {
						{
							["type"] = "input",
							["useDesc"] = false,
							["width"] = 1,
							["key"] = "IgnoreEnemy",
							["default"] = "New Entrie",
							["name"] = "Exact and full Name",
							["length"] = 10,
							["multiline"] = false,
							["useLength"] = false,
						}, -- [1]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 1,
					["width"] = 1,
					["desc"] = "",
					["useCollapse"] = false,
					["collapse"] = false,
					["key"] = "IgnoreNames",
					["type"] = "group",
					["limitType"] = "none",
					["groupType"] = "array",
					["name"] = "Ignore enemies with the following names:",
					["size"] = 10,
				}, -- [6]
				{
					["useName"] = true,
					["type"] = "header",
					["text"] = "Update Interval",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [7]
				{
					["type"] = "description",
					["text"] = "Sets the time interval at which the positions of the nameplates are updated. An increase can improve the performace, but the animation will be choppy (might increase speed because it will also be slower).",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [8]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 0.4,
					["useHeight"] = false,
				}, -- [9]
				{
					["min"] = 0.01,
					["type"] = "range",
					["default"] = 0.01,
					["key"] = "interval",
					["softMax"] = 0.05,
					["name"] = "",
					["step"] = 0.01,
					["width"] = 1.2,
				}, -- [10]
				{
					["useName"] = true,
					["type"] = "header",
					["text"] = "y-Speed",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [11]
				{
					["type"] = "description",
					["text"] = "Modifies the speed at which the nameplates are moved vertically. If the update interval is increased, it might be better to increase the speed as well.",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [12]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 0.4,
					["useHeight"] = false,
				}, -- [13]
				{
					["type"] = "range",
					["useDesc"] = false,
					["step"] = 0.1,
					["width"] = 1.2,
					["min"] = 0.1,
					["key"] = "speed",
					["softMax"] = 2,
					["desc"] = "Modifies the speed at which the nameplates are moved vertically.",
					["name"] = "",
					["default"] = 0.7,
				}, -- [14]
				{
					["type"] = "description",
					["text"] = "Fine Tuning:",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [15]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 2,
					["step"] = 0.1,
					["width"] = 0.65,
					["min"] = 0.1,
					["key"] = "speedraise",
					["desc"] = "Modifies the speed at which the nameplates are moved vertically.",
					["name"] = "Raise Speed",
					["default"] = 1,
				}, -- [16]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 2,
					["step"] = 0.1,
					["width"] = 0.65,
					["min"] = 0.1,
					["key"] = "speedlower",
					["desc"] = "Modifies the speed at which the nameplates are moved vertically.",
					["name"] = "Lower Speed",
					["default"] = 1,
				}, -- [17]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 2,
					["step"] = 0.1,
					["width"] = 0.65,
					["min"] = 0.1,
					["key"] = "speedreset",
					["desc"] = "Modifies the speed at which the nameplates are moved vertically.",
					["name"] = "Reset Speed",
					["default"] = 1,
				}, -- [18]
				{
					["useName"] = true,
					["type"] = "header",
					["text"] = "Nameplate Position",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [19]
				{
					["type"] = "description",
					["text"] = "Changes to the default vertical position and top limit of the nameplates.",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [20]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 0.4,
					["useHeight"] = false,
				}, -- [21]
				{
					["softMin"] = 0,
					["type"] = "range",
					["useDesc"] = false,
					["step"] = 1,
					["desc"] = "",
					["name"] = "Origin Position (in px)",
					["softMax"] = 100,
					["width"] = 1.2,
					["key"] = "originpos",
					["default"] = 20,
				}, -- [22]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 0.4,
					["useHeight"] = false,
				}, -- [23]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 0.4,
					["useHeight"] = false,
				}, -- [24]
				{
					["softMin"] = 0,
					["type"] = "range",
					["useDesc"] = false,
					["step"] = 1,
					["desc"] = "Modifies the speed at which the nameplates are moved vertically.",
					["name"] = "Top Limit (in px)",
					["softMax"] = 200,
					["width"] = 1.2,
					["key"] = "upperborder",
					["default"] = 30,
				}, -- [25]
				{
					["useName"] = true,
					["type"] = "header",
					["text"] = "Non-Overlap Space",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [26]
				{
					["type"] = "description",
					["text"] = "Defines the area that should not be overlapped by each nameplate.",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [27]
				{
					["type"] = "space",
					["variableWidth"] = true,
					["height"] = 1,
					["width"] = 0.4,
					["useHeight"] = false,
				}, -- [28]
				{
					["type"] = "number",
					["useDesc"] = true,
					["max"] = 200,
					["step"] = 1,
					["width"] = 0.6,
					["min"] = 0,
					["key"] = "xspace",
					["desc"] = "y-height of the nameplate that should not overlap with others.",
					["name"] = "x-Space",
					["default"] = 130,
				}, -- [29]
				{
					["type"] = "number",
					["useDesc"] = true,
					["max"] = 100,
					["step"] = 1,
					["width"] = 0.6,
					["min"] = 0,
					["key"] = "yspace",
					["desc"] = "x-width of the nameplate that should not overlap with others.",
					["name"] = "y-Space",
					["default"] = 20,
				}, -- [30]
				{
					["useName"] = true,
					["type"] = "header",
					["text"] = "Clickable Size",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [31]
				{
					["type"] = "description",
					["text"] = "Change the enemy nameplate hitbox and non-clickability of friendly nameplates during combat. Unfortunately, this option has the problem that some UI elements are closed when new nameplates appear.",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [32]
				{
					["type"] = "toggle",
					["default"] = true,
					["desc"] = "",
					["key"] = "hitbox",
					["useDesc"] = false,
					["name"] = "Active",
					["width"] = 0.8,
				}, -- [33]
				{
					["type"] = "number",
					["useDesc"] = false,
					["max"] = 300,
					["step"] = 1,
					["width"] = 0.6,
					["min"] = 0,
					["key"] = "width",
					["desc"] = "",
					["name"] = "Width",
					["default"] = 150,
				}, -- [34]
				{
					["type"] = "number",
					["useDesc"] = false,
					["max"] = 300,
					["step"] = 1,
					["width"] = 0.6,
					["min"] = 0,
					["key"] = "height",
					["desc"] = "",
					["name"] = "Height",
					["default"] = 20,
				}, -- [35]
				{
					["type"] = "description",
					["text"] = "Default Blizzard: 145x36",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [36]
			},
		},
		["Battleground Widget"] = {
			["controlledChildren"] = {
				"AllianceProgressBar", -- [1]
				"HordeProgressBar", -- [2]
				"PointIsCaptured", -- [3]
				"HordeFlag", -- [4]
				"AllianceFlag", -- [5]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["groupIcon"] = "Interface\\Icons\\FactionChange",
			["anchorPoint"] = "TOP",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["unit"] = "player",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 52,
			["selfPoint"] = "BOTTOMLEFT",
			["desc"] = "",
			["version"] = 39,
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["anchorFrameFrame"] = "UIParent",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderEdge"] = "Square Full White",
			["borderOffset"] = 4,
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "Battleground Widget",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 0,
			["config"] = {
			},
			["uid"] = "ZQBPukwoW1X",
			["borderInset"] = 1,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
				["groupOffset"] = true,
			},
			["yOffset"] = -26,
		},
		["castbar player back end text"] = {
			["wagoID"] = "Yjx7bHW6u",
			["xOffset"] = 4,
			["preferToUpdate"] = true,
			["yOffset"] = -8,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["custom_hide"] = "timed",
						["debuffType"] = "HELPFUL",
						["spellName"] = 0,
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["custom_type"] = "event",
						["event"] = "Spell Cast Succeeded",
						["unit"] = "player",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["duration"] = "0.1",
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 40,
			["rotate"] = true,
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["width"] = 355,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastbacktext.tga",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				0.7607843875885, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back end text",
			["parent"] = "player",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rotation"] = 0,
			["uid"] = "qDblFlZiAD5",
			["frameStrata"] = 2,
			["config"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellId",
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "easeIn",
					["preset"] = "fade",
					["alpha"] = 0.85,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["preset"] = "fade",
					["duration"] = "",
				},
			},
		},
		["Sacred Cancer (Focus)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["xOffset"] = 41,
			["preferToUpdate"] = false,
			["adjustedMin"] = "",
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["fontSize"] = 12,
			["sameTexture"] = true,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"53659", -- [1]
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["specificUnit"] = "focus",
						["useName"] = true,
						["names"] = {
						},
						["unit"] = "member",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["selfPoint"] = "CENTER",
			["slanted"] = false,
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.5, -- [4]
			},
			["crop_x"] = 0.41,
			["desc"] = "Sacred Cancer FOCUS indicator",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["authorOptions"] = {
			},
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 66,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["load"] = {
				["use_class"] = true,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
						[103] = true,
					},
				},
				["use_talent"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PRIEST",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["foregroundColor"] = {
				0.9764706492424011, -- [1]
				1, -- [2]
				0.9921569228172302, -- [3]
				1, -- [4]
			},
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["startAngle"] = 0,
			["auraRotation"] = 0,
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-Sacred Cancer",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "progresstexture",
			["width"] = 66,
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["crop_y"] = 0.41,
			["slantMode"] = "INSIDE",
			["tocversion"] = 40400,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["useAdjustededMin"] = false,
			["smoothProgress"] = false,
			["compress"] = false,
			["id"] = "Sacred Cancer (Focus)",
			["desaturateForeground"] = false,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["uid"] = "MPxEDWLvDPS",
			["inverse"] = false,
			["adjustedMax"] = "",
			["orientation"] = "ANTICLOCKWISE",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["backgroundOffset"] = 2,
		},
		["Circle Class Frame [HUNTER]"] = {
			["color"] = {
				0.5882352941176471, -- [1]
				1, -- [2]
				0.6352941176470588, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Hunter\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_TARGET_CHANGED",
						["spellIds"] = {
						},
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Hunter",
			["frameStrata"] = 4,
			["discrete_rotation"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [HUNTER]",
			["parent"] = "Circle Class Frames (TARGET)",
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["width"] = 95,
			["uid"] = "79KS2lhfE1D",
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 42,
		},
		["castbar player group"] = {
			["controlledChildren"] = {
				"castbar player channel", -- [1]
				"castbar player channel start", -- [2]
				"castbar player", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "Yjx7bHW6u",
			["parent"] = "player",
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["version"] = 14,
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player group",
			["borderInset"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["xOffset"] = 0,
			["uid"] = "YYMmKKbAc)X",
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["castbar player border end"] = {
			["wagoID"] = "Yjx7bHW6u",
			["xOffset"] = 0,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_count"] = false,
						["duration"] = "0.1",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["unit"] = "player",
						["use_unit"] = true,
						["event"] = "Spell Cast Succeeded",
						["use_absorbMode"] = true,
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        aura_env.isSucceeded = true\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n        aura_env.isInterrupted = true\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["custom_type"] = "event",
						["sourceUnit"] = "player",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["width"] = 355,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastborder.blp",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player border end",
			["parent"] = "player",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rotation"] = 0,
			["uid"] = "KVBJ)A1)JWx",
			["frameStrata"] = 2,
			["config"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "customcheck",
						["value"] = "function()\n    if aura_env.isSucceeded == true then\n        aura_env.isSucceeded = false\n        return true\n    end \nend",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "customcheck",
						["value"] = "function()\n    if aura_env.isInterrupted == true then\n        aura_env.isInterrupted = false\n        return true\n    end \nend",
					},
					["changes"] = {
						{
							["value"] = {
								0.70588237047195, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "straight",
					["colorB"] = 0.58823531866074,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = false,
					["type"] = "none",
					["duration"] = "0.2",
					["easeType"] = "none",
					["scaley"] = 1,
					["use_color"] = true,
					["alpha"] = 0.85,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "pulseColor",
					["preset"] = "fade",
					["colorA"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local newProgress = ((math.sin(angle) + 1)/2);\n    return r1 + (newProgress * (r2 - r1)),\n         g1 + (newProgress * (g2 - g1)),\n         b1 + (newProgress * (b2 - b1)),\n         a1 + (newProgress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["x"] = 0,
					["scalex"] = 1,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["colorB"] = 0,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "0.2",
					["easeType"] = "none",
					["scalex"] = 1,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["x"] = 0,
					["use_color"] = true,
					["preset"] = "alphaPulse",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\nend\n",
					["easeStrength"] = 3,
					["colorType"] = "straightHSV",
					["colorA"] = 1,
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["preset"] = "fade",
					["duration"] = "",
				},
			},
		},
		["castbars"] = {
			["controlledChildren"] = {
				"player", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 161.7403512956749,
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 66,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 14,
			["subRegions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbars",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "YF0FOOXWfhs",
			["borderInset"] = 1,
			["xOffset"] = -156.176836886381,
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["information"] = {
			},
			["config"] = {
			},
		},
		["Renew Indicator (P1) 2"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["xOffset"] = -670.577845228872,
			["preferToUpdate"] = false,
			["yOffset"] = 260.3221785767261,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["sameTexture"] = true,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"Renew", -- [1]
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["specificUnit"] = "party1",
						["unit"] = "member",
						["names"] = {
						},
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["config"] = {
			},
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 30,
			["crop_y"] = 0.41,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["startAngle"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
			},
			["conditions"] = {
			},
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["authorOptions"] = {
			},
			["blendMode"] = "BLEND",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["fontSize"] = 12,
			["slantMode"] = "INSIDE",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["width"] = 30,
			["alpha"] = 1,
			["mirror"] = false,
			["compress"] = false,
			["id"] = "Renew Indicator (P1) 2",
			["tocversion"] = 30300,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura72",
			["uid"] = "j1rhGb4pkGy",
			["inverse"] = false,
			["foregroundColor"] = {
				0.06666666666666667, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0.41,
			["information"] = {
			},
			["backgroundOffset"] = 2,
		},
		["SPIRIT"] = {
			["iconSource"] = 0,
			["xOffset"] = -596.355630058134,
			["yOffset"] = -361.4005842732191,
			["anchorPoint"] = "CENTER",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "item",
						["use_genericShowOn"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Item Equipped",
						["use_inverse"] = false,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["use_itemSetName"] = false,
						["spellIds"] = {
						},
						["itemName"] = 28604,
						["use_itemName"] = true,
						["unit"] = "player",
						["itemSetName"] = "",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 13,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0.9490196078431372, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Gladdy Tooltip round",
					["border_offset"] = 0,
				}, -- [2]
			},
			["height"] = 39.5,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
			},
			["information"] = {
			},
			["conditions"] = {
			},
			["zoom"] = 0,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["id"] = "SPIRIT",
			["uid"] = "YPflZrAo6s0",
			["frameStrata"] = 1,
			["width"] = 39.5,
			["color"] = {
				0.01176470588235294, -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["displayIcon"] = "Interface\\Icons\\INV_Enchant_ShardBrilliantSmall",
			["cooldown"] = false,
			["parent"] = "Weapon Switches",
		},
		["castbar player border"] = {
			["wagoID"] = "Yjx7bHW6u",
			["xOffset"] = 0,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["use_unit"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["width"] = 355,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastborder.blp",
			["authorOptions"] = {
			},
			["color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player border",
			["parent"] = "player",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rotation"] = 0,
			["uid"] = ")vcUsoDp8Ii",
			["frameStrata"] = 2,
			["config"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellId",
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "easeIn",
					["preset"] = "fade",
					["alpha"] = 0.85,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["preset"] = "fade",
					["duration"] = "",
				},
			},
		},
		["UI - pet castbar bar"] = {
			["sparkWidth"] = 32,
			["sparkOffsetX"] = 0,
			["wagoID"] = "OFUbeHBSv",
			["parent"] = "Water Elemental Cast Status",
			["preferToUpdate"] = false,
			["adjustedMin"] = "5%",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_clone"] = true,
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Cast",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["use_specific_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "pet",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["unit"] = "nameplate",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "fade",
				},
			},
			["iconSource"] = -1,
			["icon"] = false,
			["sparkMirror"] = false,
			["desaturate"] = false,
			["selfPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_text_format_n_format"] = "none",
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_shadowXOffset"] = 1,
					["text_anchorYOffset"] = 1,
					["text_fontSize"] = 13,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [3]
				{
					["border_size"] = 10,
					["border_anchor"] = "bg",
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["border_offset"] = 2,
				}, -- [4]
				{
					["border_size"] = 3,
					["border_anchor"] = "bg",
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "ElvUI GlowBorder",
					["border_offset"] = 3,
				}, -- [5]
			},
			["height"] = 18,
			["xOffset"] = 27,
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["ten"] = true,
						["arena"] = true,
						["none"] = true,
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["barColor"] = {
				0, -- [1]
				0.807843137254902, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["source"] = "import",
			["uid"] = "eXRkZ9J5fRu",
			["anchorFrameFrame"] = "CompactRaidFrame2",
			["customAnchor"] = "function()\n    if aura_env.state and aura_env.state.unit then\n        return C_NamePlate.GetNamePlateForUnit(aura_env.state.unit)\n    end\nend",
			["anchorFrameType"] = "SCREEN",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["frameStrata"] = 1,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "LEFT",
			["sparkHidden"] = "NEVER",
			["sparkHeight"] = 40,
			["texture"] = "Blizzard",
			["spark"] = true,
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 30300,
			["id"] = "UI - pet castbar bar",
			["semver"] = "1.0.0",
			["alpha"] = 1,
			["width"] = 105,
			["version"] = 1,
			["config"] = {
			},
			["inverse"] = false,
			["stickyDuration"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
			},
		},
		["Circle Class Frame [ROGUE] 2"] = {
			["parent"] = "Circle Class Frames (FOCUS)",
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Rogue\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_FOCUS_CHANGED",
						["spellIds"] = {
						},
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Rogue",
			["width"] = 95,
			["discrete_rotation"] = 0,
			["selfPoint"] = "CENTER",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [ROGUE] 2",
			["frameStrata"] = 4,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["uid"] = "u(LrEvkDJ3l",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["color"] = {
				1, -- [1]
				0.8823529411764706, -- [2]
				0, -- [3]
				1, -- [4]
			},
		},
		["PW: Shield (P2)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0.57,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturateBackground"] = false,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["sameTexture"] = true,
			["backgroundColor"] = {
				0.5019607843137255, -- [1]
				0.5019607843137255, -- [2]
				0.5019607843137255, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auranames"] = {
							"6788", -- [1]
						},
						["spellIds"] = {
						},
						["specificUnit"] = "party2",
						["unit"] = "member",
						["names"] = {
						},
						["useName"] = true,
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["selfPoint"] = "CENTER",
			["backgroundOffset"] = 2,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
			},
			["conditions"] = {
			},
			["desc"] = "Shield CD on Party2 indicator...",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["xOffset"] = -39,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 43,
			["preferToUpdate"] = false,
			["crop_y"] = 0.41,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-PartyFlash-Highlight_Shield",
			["uid"] = "zDMEhE)lXyO",
			["config"] = {
			},
			["mirror"] = false,
			["anchorFrameFrame"] = "PartyMemberFrame2",
			["regionType"] = "progresstexture",
			["width"] = 43,
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["startAngle"] = 0,
			["slantMode"] = "INSIDE",
			["compress"] = false,
			["desaturateForeground"] = false,
			["useAdjustededMin"] = false,
			["smoothProgress"] = false,
			["tocversion"] = 40400,
			["id"] = "PW: Shield (P2)",
			["fontSize"] = 12,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["load"] = {
				["talent"] = {
					["multi"] = {
						[103] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PRIEST",
					["multi"] = {
						["PRIEST"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["auraRotation"] = 0,
			["inverse"] = false,
			["anchorPoint"] = "CENTER",
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
			},
			["slanted"] = false,
		},
		["Shadowfiend Duration"] = {
			["iconSource"] = 1,
			["authorOptions"] = {
			},
			["yOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "combatlog",
						["spellId"] = "34433",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["duration"] = "15.5",
						["event"] = "Combat Log",
						["subeventPrefix"] = "SPELL",
						["use_spellId"] = true,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["unit"] = "player",
						["names"] = {
						},
						["sourceUnit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
			},
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_p_decimal_precision"] = 0,
					["type"] = "subtext",
					["text_text_format_p_time_precision"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["anchorXOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["text_text_format_p_format"] = "Number",
					["text_text_format_p_time_format"] = 0,
					["text_fontSize"] = 20,
					["text_text_format_p_time_dynamic_threshold"] = 12,
					["text_text_format_p_round_type"] = "floor",
				}, -- [2]
				{
					["glowFrequency"] = 0.25,
					["type"] = "subglow",
					["useGlowColor"] = false,
					["glowType"] = "buttonOverlay",
					["glowLength"] = 10,
					["glowYOffset"] = 0,
					["glowColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["glowXOffset"] = 0,
					["glow"] = false,
					["glowThickness"] = 1,
					["glowScale"] = 1,
					["glowLines"] = 8,
					["glowBorder"] = false,
				}, -- [3]
			},
			["height"] = 30,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["anchorFrameFrame"] = "PetFrame",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["xOffset"] = 68,
			["information"] = {
			},
			["conditions"] = {
			},
			["zoom"] = 0.2099999934434891,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["frameStrata"] = 1,
			["id"] = "Shadowfiend Duration",
			["uid"] = "lkGdLzT6(7M",
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["width"] = 30,
			["config"] = {
			},
			["inverse"] = false,
			["icon"] = true,
			["displayIcon"] = "Interface\\Icons\\Spell_Shadow_Shadowfiend",
			["cooldown"] = false,
			["useTooltip"] = false,
		},
		["DMG Threshold CC Break (Self)"] = {
			["sparkWidth"] = 10,
			["iconSource"] = 0,
			["user_x"] = 0,
			["xOffset"] = 0,
			["adjustedMax"] = "",
			["yOffset"] = 3.0517578125e-005,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["glow_frame_type"] = "FRAMESELECTOR",
					["do_glow"] = false,
					["glow_frame"] = "WeakAuras:DMG Threshold CC Break",
					["use_glow_color"] = true,
					["glow_type"] = "buttonOverlay",
					["do_custom"] = false,
					["glow_action"] = "show",
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "\naura_env.spells = {\n    [8122] = true,\n    [8124] = true,\n    [10888] = true,\n    [10890] = true,\n    [5782] = true,\n    [6213] = true,\n    [6215] = true,\n    [5484] = true,\n    [17928] = true,\n    [5246] = true, -- Intimidating Shout\n    [51514] = true, -- Hex\n    [10326] = true -- Turn Evil\n}\n\naura_env.bustedSpells = {\n    [GetSpellInfo(58381)] = true, -- Mind Flay\n    [GetSpellInfo(63675)] = true, -- Improved Devouring Plague\n}\n\n\naura_env.classHealth = {\n    [1] = 8121, -- Warrior\n    [2] = 6934, -- Paladin\n    [3] = 7324, -- Hunter\n    [4] = 7604, -- Rogue\n    [5] = 6960, -- Priest\n    [6] = 8121, -- Death Knight\n    [7] = 7604, -- Shaman\n    [8] = 6963, -- Mage\n    [9] = 7164, -- Warlock\n    [11] = 7417, -- Druid\n}\n\n\n",
					["do_custom"] = true,
				},
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.25098039215686, -- [1]
				0.78039215686274, -- [2]
				0.92156862745098, -- [3]
				1, -- [4]
			},
			["desc"] = "",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["crop_y"] = 0,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["foregroundTexture"] = "Interface\\AddOns\\TextureScript\\SwipeWA",
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["blendMode"] = "BLEND",
			["slantMode"] = "INSIDE",
			["texture"] = "Blizzard",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 40400,
			["alpha"] = 1,
			["config"] = {
			},
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = 0,
			["adjustedMin"] = "",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "AUTO",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["customIcon"] = "",
						["custom_hide"] = "custom",
						["type"] = "custom",
						["subeventPrefix"] = "SPELL",
						["custom_type"] = "status",
						["unit"] = "player",
						["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
						["event"] = "Health",
						["custom"] = "function(event, ...)\n    if event == \"COMBAT_LOG_EVENT_UNFILTERED\" then\n        local _, subEvent, _, _, _, _, _, destGUID, _, _, _, spellID, spellName, _, arg15, _, _, arg18, _, _, arg21 = ...\n        \n        if (subEvent == \"SPELL_AURA_APPLIED\") and aura_env.spells[spellID] and destGUID == UnitGUID(\"player\") then\n            local _, _, class = UnitClass(\"player\")\n            local maxabsorb = aura_env.classHealth[class] * 0.4\n            \n            aura_env.isFeared = true\n            aura_env.totalAbsorb = maxabsorb\n            aura_env.currentAbsorb = maxabsorb\n        elseif subEvent == \"SPELL_AURA_REMOVED\" and aura_env.spells[spellID] and destGUID == UnitGUID(\"player\") then\n            aura_env.isFeared = false\n            aura_env.currentAbsorb = 0\n        elseif (subEvent == \"SPELL_DAMAGE\" or subEvent == \"RANGE_DAMAGE\" or subEvent == \"SPELL_PERIODIC_DAMAGE\") and destGUID == UnitGUID(\"player\") and aura_env.isFeared then\n            if (aura_env.bustedSpells[spellName] and subEvent ~= \"SPELL_PERIODIC_DAMAGE\") then\n                return false\n            end\n            \n            local damage = arg15\n            aura_env.currentAbsorb = aura_env.currentAbsorb - damage\n            \n        elseif subEvent == \"SWING_DAMAGE\" and destGUID == UnitGUID(\"player\") and aura_env.isFeared then\n            local damage = spellID\n            aura_env.currentAbsorb = aura_env.currentAbsorb - damage\n            \n        end\n    end\n    return aura_env.isFeared\nend",
						["customDuration"] = "function()\n    if aura_env.currentAbsorb >= 0 then\n        return aura_env.currentAbsorb, aura_env.totalAbsorb, true\n    end\nend",
						["customName"] = "",
						["spellIds"] = {
						},
						["unevent"] = "auto",
						["check"] = "event",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function(event, ...)\n    return not aura_env.isFeared\nend",
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "shrink",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["translateType"] = "straightTranslate",
					["duration_type"] = "seconds",
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["colorR"] = 1,
					["use_translate"] = false,
					["use_alpha"] = false,
					["preset"] = "pulse",
					["type"] = "none",
					["rotate"] = 0,
					["easeType"] = "none",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend\n",
					["scaley"] = 1,
					["alpha"] = 0,
					["colorType"] = "straightHSV",
					["y"] = 0,
					["x"] = 0,
					["use_color"] = false,
					["colorA"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\nend\n",
					["easeStrength"] = 3,
					["duration"] = "0",
					["scalex"] = 1,
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 184,
			["compress"] = false,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["crop_x"] = 0,
			["uid"] = "Ff2zh(bEvtO",
			["mirror"] = false,
			["desaturate"] = false,
			["load"] = {
				["use_size"] = false,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["ratedpvp"] = true,
						["arena"] = true,
						["ratedarena"] = true,
						["pvp"] = true,
					},
				},
			},
			["zoom"] = 0,
			["user_y"] = 0,
			["icon_side"] = "RIGHT",
			["anchorFrameType"] = "SCREEN",
			["icon"] = false,
			["sparkHeight"] = 30,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["sparkHidden"] = "NEVER",
			["foregroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.0",
			["authorOptions"] = {
			},
			["id"] = "DMG Threshold CC Break (Self)",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 1,
			["width"] = 184,
			["auraRotation"] = 0,
			["backgroundColor"] = {
				1, -- [1]
				0.02352941408753395, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["startAngle"] = 0,
			["orientation"] = "ANTICLOCKWISE",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
		},
		["DMG"] = {
			["iconSource"] = 0,
			["xOffset"] = -560.355630058134,
			["yOffset"] = -324.4005842732191,
			["anchorPoint"] = "CENTER",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "item",
						["itemName"] = 28770,
						["subeventSuffix"] = "_CAST_START",
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["event"] = "Item Equipped",
						["names"] = {
						},
						["unit"] = "player",
						["use_itemSetName"] = false,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["use_inverse"] = false,
						["genericShowOn"] = "showOnCooldown",
						["itemSetName"] = "",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_offset"] = 0,
					["border_size"] = 13,
					["border_color"] = {
						1, -- [1]
						0, -- [2]
						0.1098039215686275, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Gladdy Tooltip round",
					["type"] = "subborder",
				}, -- [2]
			},
			["height"] = 39.5,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
			},
			["color"] = {
				0.01176470588235294, -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["information"] = {
			},
			["conditions"] = {
			},
			["zoom"] = 0,
			["parent"] = "Weapon Switches",
			["alpha"] = 1,
			["id"] = "DMG",
			["uid"] = "SgRlvCFFHuQ",
			["frameStrata"] = 1,
			["width"] = 39.5,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["displayIcon"] = "Interface\\Icons\\Spell_Shadow_Shadowform",
			["cooldown"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
		},
		["Cheeta - Enhanced Stacking Nameplate"] = {
			["controlledChildren"] = {
				"Cheeta - Enhanced Stacking Nameplate - Core", -- [1]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "AQdGXNEBH",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["groupIcon"] = "Interface\\Icons\\Spell_ChargePositive",
			["anchorPoint"] = "BOTTOM",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "https://wago.io/AQdGXNEBH/5",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desc"] = "Author - Cheeta\n____________________________________\nProblems/Questions/Improvements:\nDiscord: cheeta.exe",
			["version"] = 5,
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["anchorFrameParent"] = false,
			["borderOffset"] = 4,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "Cheeta - Enhanced Stacking Nameplate",
			["uid"] = "LT6FgeYfq3B",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["selfPoint"] = "CENTER",
			["borderInset"] = 1,
			["config"] = {
			},
			["xOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
			},
			["yOffset"] = 0,
		},
		["castbar player interrupt"] = {
			["wagoID"] = "Yjx7bHW6u",
			["xOffset"] = 4,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["custom_hide"] = "timed",
						["debuffType"] = "HELPFUL",
						["spellName"] = 0,
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        return true\n    end \nend\n\n\n\n",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["events"] = "UNIT_SPELLCAST_INTERRUPTED",
						["custom_type"] = "event",
						["event"] = "Spell Cast Succeeded",
						["unit"] = "player",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["duration"] = "0.1",
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["width"] = 355,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastfail.tga",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				0.7607843875885, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player interrupt",
			["parent"] = "player",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rotation"] = 0,
			["uid"] = "1kvdC2gSI0J",
			["frameStrata"] = 2,
			["config"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellId",
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_translate"] = false,
					["use_alpha"] = true,
					["scalex"] = 1,
					["type"] = "none",
					["colorType"] = "custom",
					["easeType"] = "easeIn",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend\n",
					["use_color"] = false,
					["alpha"] = 0.85,
					["rotate"] = 0,
					["y"] = 0,
					["x"] = 0,
					["translateType"] = "straightTranslate",
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["preset"] = "fade",
					["duration"] = "",
				},
			},
		},
		["Circle Class Frame [DRUID] 2"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Druid\" then\n        return true\n    else\n        return false\n    end\nend",
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Druid",
			["width"] = 95,
			["selfPoint"] = "CENTER",
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [DRUID] 2",
			["frameStrata"] = 4,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				0.984313725490196, -- [1]
				0.9725490196078431, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "qMfPEvSCtq7",
			["config"] = {
			},
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
		},
		["Autobuy"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "r9Q5X_EGF",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local class = UnitClass(\"player\")\nlocal min_money = aura_env.config.min_gold*10000\n\nlocal class_items = { -- [\"class\"] = {[\"item\"] = config.item, min_lvl, max_lvl}\n    [\"Priest\"] = {\n        [\"Sacred Candle\"] = {amount = aura_env.config.priest.candle, min_lvl = 1, max_lvl = 80},\n        [\"Light Feather\"] = {amount = aura_env.config.priest.feather, min_lvl = 1, max_lvl = 80},\n        [\"Star's Tears\"] = {amount = aura_env.config.priest.watah, min_lvl = 1, max_lvl = 80},\n        [\"Heavy Netherweave Bandage\"] = {amount = aura_env.config.priest.FA, min_lvl = 1, max_lvl = 80},\n    },\n    [\"Mage\"] = {\n        [\"Light Feather\"] = {amount = aura_env.config.mage.feather, min_lvl = 1, max_lvl = 80},\n        [\"Arcane Powder\"] = {amount = aura_env.config.mage.powder, min_lvl = 1, max_lvl = 80},\n        [\"Heavy Netherweave Bandage\"] = {amount = aura_env.config.mage.FA, min_lvl = 1, max_lvl = 80},\n        [\"Star's Tears\"] = {amount = aura_env.config.mage.watah, min_lvl = 1, max_lvl = 80},\n    },\n}\n\nlocal msg_start = \"Auto-Buy: \"\n\naura_env.buy = function ()\n    local level = UnitLevel(\"player\")\n    \n    for item_name, val in pairs(class_items[class]) do -- loop through class' items\n        local desired = val.amount\n        local min_level = val.min_lvl\n        local max_lvl = val.max_lvl\n        \n        -- fetch current situation\n        local current_money = GetMoney()\n        local owned = GetItemCount(item_name)\n        \n        if desired > 0 and owned < desired then\n            for i = 1, GetMerchantNumItems() do\n                local merch_item, _, cost, min_buy, _, usable = GetMerchantItemInfo(i)\n                \n                if merch_item == item_name and usable then\n                    if level >= min_level and level <= max_lvl then\n                        local needed = desired - owned -- how many items should be bought\n                        local purchase = aura_env.config.round_up and math.ceil(needed / min_buy) or math.floor(needed / min_buy)\n                        local budget = current_money - min_money\n                        if purchase > 0 then\n                            if (purchase * cost) <= budget then -- budget is more than total cost\n                                BuyMerchantItem(i, purchase)\n                                local bought = purchase * min_buy\n                                print(msg_start..bought..\" of \"..item_name..\" bought for: \"..GetCoinTextureString(purchase * cost))\n                                \n                            else -- budget is less than total cost\n                                if cost <= budget then -- budget is more or equal than at least one purchase\n                                    local possible = budget/cost -- how many can actually be bought\n                                    BuyMerchantItem(i, possible)\n                                    local bought = possible * min_buy\n                                    local planned = purchase * min_buy\n                                    print(msg_start..bought..\" out of \"..planned..\" \"..item_name..\" bought for: \"..GetCoinTextureString(possible * cost))\n                                    \n                                else -- cannot afford a single purchase\n                                    local planned = purchase * min_buy\n                                    print(msg_start..\"none of the \"..planned..\" \"..item_name..\" could be bought due to insuficient funds\")\n                                end\n                            end\n                        end\n                    end\n                end\n            end\n        end\n    end\nend",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["spellIds"] = {
						},
						["custom"] = "function ()\n    if aura_env.config.enable_ab then\n        aura_env.buy()\n    end\nend",
						["custom_type"] = "event",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["events"] = "MERCHANT_SHOW",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_format"] = "timed",
			["internalVersion"] = 52,
			["wordWrap"] = "WordWrap",
			["desc"] = "",
			["font"] = "Friz Quadrata TT",
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["fontSize"] = 12,
			["source"] = "import",
			["shadowXOffset"] = 1,
			["regionType"] = "text",
			["conditions"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["selfPoint"] = "BOTTOM",
			["displayText_format_p_time_precision"] = 1,
			["preferToUpdate"] = true,
			["xOffset"] = 0,
			["semver"] = "1.0.2",
			["justify"] = "LEFT",
			["tocversion"] = 30300,
			["id"] = "Autobuy",
			["uid"] = "Kxw5wrRLc3l",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["config"] = {
				["enable_ab"] = true,
				["priest"] = {
					["candle"] = 200,
					["FA"] = 200,
					["feather"] = 200,
					["watah"] = 200,
				},
				["mage"] = {
					["watah"] = 200,
					["FA"] = 200,
					["feather"] = 200,
					["powder"] = 200,
				},
				["round_up"] = true,
				["min_gold"] = 10000,
			},
			["authorOptions"] = {
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [1]
				{
					["text"] = "|TInterface\\Icons\\INV_Misc_Coin_01:18:18:0:0:64:64:4:60:4:60|t |cffffff00Minimum Gold:|r",
					["type"] = "description",
					["fontSize"] = "large",
					["width"] = 1,
				}, -- [2]
				{
					["type"] = "number",
					["useDesc"] = false,
					["max"] = 99999,
					["step"] = 1,
					["width"] = 1,
					["min"] = 0,
					["key"] = "min_gold",
					["default"] = 100,
					["name"] = "",
					["desc"] = "",
				}, -- [3]
				{
					["text"] = "designate gold minimum to not go below when automatically buying items",
					["type"] = "description",
					["fontSize"] = "medium",
					["width"] = 2,
				}, -- [4]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [5]
				{
					["type"] = "toggle",
					["default"] = false,
					["key"] = "enable_ab",
					["name"] = "|cff00ff00Enable Auto-Buying|r",
					["width"] = 1,
				}, -- [6]
				{
					["text"] = "",
					["type"] = "description",
					["fontSize"] = "medium",
					["width"] = 1,
				}, -- [7]
				{
					["type"] = "toggle",
					["default"] = false,
					["width"] = 1,
					["name"] = "Round up purchases",
					["useDesc"] = true,
					["key"] = "round_up",
					["desc"] = "when buying items sold in stacks enabling this will round the stacks over your total, disabling will round them under your total",
				}, -- [8]
				{
					["text"] = "",
					["type"] = "description",
					["fontSize"] = "medium",
					["width"] = 1,
				}, -- [9]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [10]
				{
					["subOptions"] = {
						{
							["text"] = "|TInterface\\Icons\\INV_Misc_Dust_01:18:18:0:0:64:64:4:60:4:60|t Arcane Powder",
							["type"] = "description",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [1]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "powder",
							["default"] = 0,
							["name"] = "",
						}, -- [2]
						{
							["type"] = "description",
							["text"] = "|TInterface\\Icons\\inv_feather_04:18:18:0:0:64:64:4:60:4:60|t Light Feather",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [3]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "feather",
							["name"] = "",
							["default"] = 0,
						}, -- [4]
						{
							["type"] = "description",
							["text"] = "|TInterface\\Icons\\inv_drink_waterskin_01:18:18:0:0:64:64:4:60:4:60|t Watah",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [5]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "watah",
							["name"] = "",
							["default"] = 0,
						}, -- [6]
						{
							["text"] = "|TInterface\\Icons\\inv_misc_bandage_netherweave_heavy:18:18:0:0:64:64:4:60:4:60|t FA",
							["type"] = "description",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [7]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "FA",
							["default"] = 0,
							["name"] = "",
						}, -- [8]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 0,
					["width"] = 1,
					["useCollapse"] = true,
					["name"] = "|TInterface\\Icons\\inv_staff_13:18:18:0:0:64:64:4:60:4:60|t Mage",
					["collapse"] = true,
					["type"] = "group",
					["limitType"] = "none",
					["groupType"] = "simple",
					["key"] = "mage",
					["size"] = 10,
				}, -- [11]
				{
					["useName"] = false,
					["type"] = "header",
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [12]
				{
					["subOptions"] = {
						{
							["text"] = "|TInterface\\Icons\\inv_misc_candle_02:18:18:0:0:64:64:4:60:4:60|t Sacred Candle",
							["type"] = "description",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [1]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "candle",
							["default"] = 0,
							["name"] = "",
						}, -- [2]
						{
							["type"] = "description",
							["text"] = "|TInterface\\Icons\\inv_feather_04:18:18:0:0:64:64:4:60:4:60|t Light Feather",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [3]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "feather",
							["name"] = "",
							["default"] = 0,
						}, -- [4]
						{
							["text"] = "|TInterface\\Icons\\inv_drink_waterskin_01:18:18:0:0:64:64:4:60:4:60|t Watah",
							["type"] = "description",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [5]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "watah",
							["default"] = 0,
							["name"] = "",
						}, -- [6]
						{
							["text"] = "|TInterface\\Icons\\inv_misc_bandage_netherweave_heavy:18:18:0:0:64:64:4:60:4:60|t FA",
							["type"] = "description",
							["fontSize"] = "large",
							["width"] = 1,
						}, -- [7]
						{
							["type"] = "number",
							["useDesc"] = false,
							["max"] = 1000,
							["step"] = 1,
							["width"] = 1,
							["min"] = 0,
							["key"] = "FA",
							["default"] = 0,
							["name"] = "",
						}, -- [8]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 0,
					["width"] = 1,
					["useCollapse"] = true,
					["name"] = "|TInterface\\Icons\\inv_staff_30:18:18:0:0:64:64:4:60:4:60|t Priest",
					["collapse"] = true,
					["type"] = "group",
					["limitType"] = "none",
					["groupType"] = "simple",
					["key"] = "priest",
					["size"] = 10,
				}, -- [13]
			},
			["shadowYOffset"] = -1,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["url"] = "",
		},
		["castbar player channel start"] = {
			["sparkWidth"] = 15,
			["iconSource"] = -1,
			["user_x"] = 0,
			["xOffset"] = 4,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["backgroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.98431378602982, -- [1]
				1, -- [2]
				0.98431378602982, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = -1,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["startAngle"] = 0,
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["sparkDesaturate"] = false,
			["slantMode"] = "INSIDE",
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastcnannelfull.tga",
			["zoom"] = 0,
			["spark"] = true,
			["compress"] = false,
			["alpha"] = 1,
			["uid"] = "UyAaOgWEXrA",
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = 0,
			["wagoID"] = "Yjx7bHW6u",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["adjustedMin"] = "0.2",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "AUTO",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_castType"] = true,
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["names"] = {
						},
						["castType"] = "channel",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["unit"] = "player",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["custom"] = "\n\nfunction(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_CHANNEL_START\" then\n        return true\n    end\nend",
						["custom_type"] = "event",
						["events"] = "UNIT_SPELLCAST_CHANNEL_START",
						["duration"] = "0.1",
						["custom_hide"] = "timed",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 66,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "preset",
					["easeType"] = "easeIn",
					["preset"] = "fade",
					["alpha"] = 0.85,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "preset",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
			},
			["discrete_rotation"] = 0,
			["crop_y"] = 0.72,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["text_text_format_n_format"] = "string",
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_text_format_n_abbreviate_max"] = 30,
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_justify"] = "CENTER",
					["text_shadowYOffset"] = -1,
					["text_anchorYOffset"] = -14,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "INNER_CENTER",
					["text_shadowXOffset"] = 1,
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_n_abbreviate"] = true,
				}, -- [2]
			},
			["height"] = 18,
			["rotate"] = false,
			["information"] = {
			},
			["sparkBlendMode"] = "BLEND",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["source"] = "import",
			["crop_x"] = 0.7,
			["icon"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n",
					["do_custom"] = false,
				},
				["init"] = {
				},
			},
			["mirror"] = false,
			["tocversion"] = 30402,
			["foregroundTexture"] = "Interface\\Addons\\aTextures\\blizzcast.tga",
			["sparkTexture"] = "Interface\\Addons\\aTextures\\spark.tga",
			["width"] = 252,
			["icon_side"] = "LEFT",
			["config"] = {
			},
			["parent"] = "castbar player group",
			["sparkHeight"] = 35,
			["sparkHidden"] = "NEVER",
			["fontSize"] = 12,
			["adjustedMax"] = "0.5",
			["semver"] = "1.0.13",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["id"] = "castbar player channel start",
			["authorOptions"] = {
			},
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["auraRotation"] = 0,
			["user_y"] = 0,
			["inverse"] = false,
			["anchorPoint"] = "CENTER",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["slanted"] = false,
		},
		["DMG Threshold CC Break (Target - Arena3)"] = {
			["user_y"] = 0,
			["iconSource"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["adjustedMax"] = "",
			["yOffset"] = 9,
			["foregroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["icon"] = false,
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.25098039215686, -- [1]
				0.78039215686274, -- [2]
				0.92156862745098, -- [3]
				1, -- [4]
			},
			["desc"] = "",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_size"] = false,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["instance_type"] = {
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["ratedpvp"] = true,
						["arena"] = true,
						["ratedarena"] = true,
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["foregroundTexture"] = "Interface\\AddOns\\TextureScript\\SwipeWA",
			["customAnchor"] = "function(states, ...)\n    local frame\n    if UnitIsUnit(\"arena2\", \"target\") then\n        frame = TargetFrame\n    elseif UnitIsUnit(\"arena2\", \"focus\") then\n        frame = FocusFrame\n    end\n    return frame\nend\n\n\n\n",
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["blendMode"] = "BLEND",
			["slantMode"] = "INSIDE",
			["texture"] = "Blizzard",
			["zoom"] = 0,
			["spark"] = false,
			["compress"] = false,
			["alpha"] = 1,
			["uid"] = "sf(NOsa8SLc",
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["customText"] = "",
			["desaturateBackground"] = false,
			["cooldownSwipe"] = true,
			["sparkRotationMode"] = "AUTO",
			["cooldownEdge"] = false,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["customIcon"] = "",
						["custom_hide"] = "custom",
						["customTexture"] = "",
						["type"] = "custom",
						["use_unit"] = true,
						["custom_type"] = "status",
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["custom"] = "function(event)\n    local guid = UnitGUID(\"arena3\")\n    if event == \"PLAYER_TARGET_CHANGED\" then\n        if UnitIsUnit(\"target\", \"arena3\") then\n            guid = UnitGUID(\"target\")\n        else\n            guid = nil\n        end\n    end\n    \n    if guid and cacheUnit[guid] and cacheUnit[guid].feared then\n        aura_env.maxAmount = cacheUnit[guid].maxAmount\n        aura_env.currentAmount = cacheUnit[guid].currentAmount\n        aura_env.isFeared = cacheUnit[guid].feared\n        return true\n    else\n        aura_env.maxAmount = 0\n        aura_env.currentAmount = 0\n        aura_env.isFeared = false\n        return false\n    end\nend",
						["customDuration"] = "function()\n    if aura_env.currentAmount and aura_env.currentAmount > 0 then\n        return aura_env.currentAmount, aura_env.maxAmount, true\n    end\nend",
						["customName"] = "",
						["spellIds"] = {
						},
						["events"] = "CLEU:SWING_DAMAGE, CLEU:RANGE_DAMAGE, CLEU:SPELL_DAMAGE, CLEU:SPELL_PERIODIC_DAMAGE, CLEU:SPELL_AURA_APPLIED, CLEU:SPELL_AURA_REMOVED, PLAYER_TARGET_CHANGED",
						["check"] = "event",
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function(event, ...)\n    return not aura_env.isFeared\nend",
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["preferToUpdate"] = false,
			["cooldown"] = true,
			["crop_x"] = 0,
			["customTextUpdate"] = "event",
			["desaturate"] = false,
			["cooldownTextDisabled"] = false,
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 103,
			["adjustedMin"] = "",
			["startAngle"] = 0,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["width"] = 103,
			["useCooldownModRate"] = true,
			["fontSize"] = 12,
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["sparkHidden"] = "NEVER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["icon_side"] = "RIGHT",
			["xOffset"] = 94.42,
			["config"] = {
			},
			["sparkHeight"] = 30,
			["auraRotation"] = 0,
			["anchorPoint"] = "CENTER",
			["crop_y"] = 0,
			["semver"] = "1.0.0",
			["sparkWidth"] = 10,
			["id"] = "DMG Threshold CC Break (Target - Arena3)",
			["backgroundColor"] = {
				1, -- [1]
				0.02352941408753395, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["tocversion"] = 40400,
			["inverse"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["orientation"] = "ANTICLOCKWISE",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["slanted"] = false,
		},
		["Circle Class Frame [MAGE] 2"] = {
			["xOffset"] = 42,
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Mage\" then\n        return true\n    else\n        return false\n    end\nend",
						["use_unit"] = true,
						["custom_type"] = "event",
						["spellIds"] = {
						},
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Mage",
			["anchorFrameType"] = "SELECTFRAME",
			["selfPoint"] = "CENTER",
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [MAGE] 2",
			["frameStrata"] = 4,
			["alpha"] = 1,
			["width"] = 95,
			["authorOptions"] = {
			},
			["config"] = {
			},
			["uid"] = "r71p543s)oE",
			["color"] = {
				1, -- [1]
				0.9568627450980392, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
		},
		["AllianceProgressBar"] = {
			["sparkWidth"] = 15,
			["iconSource"] = 0,
			["user_x"] = 0,
			["xOffset"] = -60,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "WorldStateAlwaysUpFrame:Hide()",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nlocal C_Map = {};\nlocal C_PvP = {};\n\nC_Map[\"ArathiBasin\"] = {\n    progress = 3,\n    index = 1, \n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"AlteracValley\"] = {\n    progress = 3,\n    index = 1,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 600\n};\n\nC_Map[\"IsleofConquest\"] = {\n    progress = 3,\n    index = 1,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 300\n};\n\nC_Map[\"NetherstormArena\"] = {\n    progress = 3,\n    index = 2,\n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"WarsongGulch\"] = {\n    progress = 3,\n    index = 2,\n    curr = 3,\n    find = \"(%d+)[^%d]+(%d+)\",\n    total = 3\n};\n\nfunction C_PvP.IsPvPMap()\n    local inInstance, instanceType = IsInInstance()\n    if ( not inInstance ) then\n        return;\n    end\n    \n    return instanceType == \"pvp\" or instanceType == \"arena\";\nend\n\nfunction aura_env:OnEvent(event, ...)\n    \n    if ( not C_PvP.IsPvPMap() ) then\n        return false;\n    end\n    \n    local mapFileName = GetMapInfo();\n    \n    if ( C_Map[mapFileName] ) then\n        RequestBattlefieldScoreData()\n        \n        local number = C_Map[mapFileName]\n        local progress = select(number.progress,GetWorldStateUIInfo(number.index))\n        local curr  = select(number.curr, progress:find(number.find)) \n        \n        aura_env.zone  = mapFileName\n        aura_env.value = tonumber(curr)\n        aura_env.total = number.total\n        \n        return true\n    end\n    \nend\n-----------------------------------------------------------------------------------------------------\n\nlocal frame = WeakAuras.regions[aura_env.id].region;\n\nif ( not frame.texture ) then\n    local texture = CreateFrame(\"Frame\", nil, frame);\n    texture:SetFrameStrata(\"MEDIUM\") ;\n    frame.texture = texture;\n    frame.texture = frame.texture:CreateTexture(nil, \"Texture\");\n    frame.texture:SetTexture([[Interface\\Timer\\Alliance-Logo]]);\nend \n\nframe.texture:SetPoint(\"RIGHT\", frame, \"LEFT\", region:GetHeight() / 1.6, 0);\nframe.texture:SetSize(region:GetHeight() * 2.3, region:GetHeight() * 2.3);\n\n-----------------------------------------------------------------------------------------------------\n\naura_env.value, aura_env.total = math.random(400, 1400), 1600;",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "WorldStateAlwaysUpFrame:Show()",
					["do_custom"] = true,
				},
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.086274509803922, -- [1]
				0.17254901960784, -- [2]
				0.34117647058824, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["sparkOffsetY"] = 0,
			["crop_y"] = 0.41,
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\SpellActivationOverlays\\Eclipse_Sun",
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["blendMode"] = "BLEND",
			["sparkDesaturate"] = false,
			["texture"] = "Smooth",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = false,
			["tocversion"] = 30300,
			["alpha"] = 1,
			["sparkColor"] = {
				0, -- [1]
				0.74509803921569, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["backgroundOffset"] = 2,
			["sparkOffsetX"] = 0,
			["parent"] = "Battleground Widget",
			["customText"] = "function(total, value)    \n    \n    if ( ( aura_env.zone == \"IsleofConquest\" ) \n        or ( aura_env.zone == \"AlteracValley\" ) ) then\n        return value\n    end\n    \n    return (\"%.f / %.f\"):format(value, total)\nend",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "AUTO",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_hide"] = "timed",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["genericShowOn"] = "showOnActive",
						["names"] = {
						},
						["customDuration"] = "function()    \n    return aura_env.value, aura_env.total, true      \nend",
						["spellIds"] = {
						},
						["custom"] = "function(event, ...)\n    return aura_env:OnEvent(event, ...)\nend",
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["check"] = "event",
						["event"] = "Health",
						["custom_type"] = "status",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function()\n    return true\nend\n\n\n\n\n\n",
					},
				}, -- [1]
				["activeTriggerMode"] = 1,
			},
			["internalVersion"] = 52,
			["useAdjustedMin"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n  return start + (progress * delta)\nend",
					["use_translate"] = false,
					["use_alpha"] = false,
					["colorB"] = 1,
					["scaleType"] = "straightScale",
					["scalex"] = 1,
					["easeType"] = "none",
					["translateFunc"] = "",
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["use_scale"] = false,
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["translateType"] = "custom",
					["rotate"] = 0,
					["duration"] = "1",
					["type"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["backdropInFront"] = true,
			["version"] = 39,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["text_shadowXOffset"] = 1,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "PT Sans Narrow",
					["text_shadowYOffset"] = -1,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_CENTER",
					["text_text_format_c_format"] = "none",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [3]
				{
					["border_offset"] = 5,
					["border_size"] = 20,
					["border_anchor"] = "bg",
					["text_color"] = {
					},
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Blizzard Tooltip",
					["type"] = "subborder",
				}, -- [4]
			},
			["height"] = 25,
			["config"] = {
			},
			["zoom"] = 0,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\SpellActivationOverlays\\Eclipse_Sun",
			["source"] = "import",
			["crop_x"] = 0.41,
			["borderBackdrop"] = "None",
			["useAdjustedMax"] = false,
			["mirror"] = false,
			["spark"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.80000001192093, -- [4]
			},
			["borderInFront"] = true,
			["uid"] = "BzfZ6IjnWwh",
			["icon_side"] = "RIGHT",
			["load"] = {
				["use_size"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["talent3"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["talent2"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["ingroup"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
					},
				},
			},
			["anchorFrameType"] = "SCREEN",
			["sparkHeight"] = 60,
			["icon"] = false,
			["compress"] = false,
			["sparkHidden"] = "NEVER",
			["semver"] = "2.0.0",
			["backdropColor"] = {
				[4] = 0,
			},
			["id"] = "AllianceProgressBar",
			["user_y"] = 0,
			["frameStrata"] = 2,
			["width"] = 100,
			["authorOptions"] = {
			},
			["anchorPoint"] = "CENTER",
			["inverse"] = false,
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["customTextUpdate"] = "event",
		},
		["Stealth Effect TOP"] = {
			["wagoID"] = "wdib4Sz3Z",
			["xOffset"] = 0,
			["preferToUpdate"] = true,
			["yOffset"] = 260,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auraspellids"] = {
							"66", -- [1]
						},
						["event"] = "Health",
						["names"] = {
						},
						["auranames"] = {
							"1787", -- [1]
							"58984", -- [2]
							"305628", -- [3]
							"115191", -- [4]
						},
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["useExactSpellId"] = true,
						["useName"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 75,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "grow",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "pulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "grow",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["rotation"] = 180,
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 1100,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["single"] = "NightElf",
				},
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_race"] = true,
				["class"] = {
					["single"] = "ROGUE",
					["multi"] = {
						["ROGUE"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["textureWrapMode"] = "CLAMP",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["width"] = 1960,
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\6TJ_Polluted_mist_Stormy",
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["semver"] = "1.0.1",
			["tocversion"] = 30300,
			["id"] = "Stealth Effect TOP",
			["parent"] = "Invis additional visual",
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "f8VXnRZI0Jd",
			["config"] = {
			},
			["alpha"] = 1,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["color"] = {
				0, -- [1]
				0.8196078431372549, -- [2]
				1, -- [3]
				1, -- [4]
			},
		},
		["Sacred Cancer (Target)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["adjustedMin"] = "",
			["yOffset"] = 5.57,
			["foregroundColor"] = {
				1, -- [1]
				0.9960784912109375, -- [2]
				0.988235354423523, -- [3]
				1, -- [4]
			},
			["desaturateBackground"] = false,
			["smoothProgress"] = false,
			["sameTexture"] = true,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auranames"] = {
							"53659", -- [1]
						},
						["spellIds"] = {
						},
						["specificUnit"] = "target",
						["unit"] = "member",
						["names"] = {
						},
						["useName"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["selfPoint"] = "CENTER",
			["backgroundOffset"] = 2,
			["xOffset"] = 41,
			["conditions"] = {
			},
			["desc"] = "Sacred Cancer TARGET indicator",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["anchorPoint"] = "CENTER",
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 66,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["load"] = {
				["use_class"] = true,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
						[103] = true,
					},
				},
				["use_talent"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PRIEST",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["startAngle"] = 0,
			["uid"] = "MLpFgYvQ9v0",
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.5, -- [4]
			},
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "progresstexture",
			["anchorFrameType"] = "SELECTFRAME",
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-Sacred Cancer",
			["slantMode"] = "INSIDE",
			["tocversion"] = 40400,
			["crop_y"] = 0.41,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["useAdjustededMin"] = false,
			["compress"] = false,
			["id"] = "Sacred Cancer (Target)",
			["config"] = {
			},
			["alpha"] = 1,
			["width"] = 66,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["auraRotation"] = 0,
			["inverse"] = false,
			["adjustedMax"] = "",
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
			},
			["slanted"] = false,
		},
		["Desaturation (Priest)"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"Water Combat Desaturation (PRIEST)", -- [1]
				"Mount Combat Desaturation (PRIEST)", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["border"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderSize"] = 2,
			["scale"] = 1,
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["borderEdge"] = "Square Full White",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["subeventPrefix"] = "SPELL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["xOffset"] = 0,
			["borderOffset"] = 4,
			["selfPoint"] = "CENTER",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["id"] = "Desaturation (Priest)",
			["config"] = {
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "kMkzZjAlyDc",
			["borderInset"] = 1,
			["internalVersion"] = 52,
			["subRegions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["regionType"] = "group",
		},
		["VEINS CD Visual"] = {
			["iconSource"] = -1,
			["wagoID"] = "EJSv8n-lB",
			["color"] = {
				0.984313725490196, -- [1]
				0.9725490196078431, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["yOffset"] = -337.0667037963867,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["track"] = "auto",
						["rem"] = "6000",
						["useStacks"] = false,
						["auranames"] = {
							"Inner Fire", -- [1]
						},
						["names"] = {
						},
						["matchesShowOn"] = "showOnMissing",
						["genericShowOn"] = "showOnReady",
						["subeventPrefix"] = "SPELL",
						["use_showgcd"] = false,
						["stacks"] = "5",
						["useName"] = true,
						["use_showlossofcontrol"] = false,
						["match_count"] = "1",
						["spellName"] = 12472,
						["use_remaining"] = false,
						["debuffType"] = "HELPFUL",
						["match_countOperator"] = "<",
						["type"] = "spell",
						["stacksOperator"] = "<=",
						["useExactSpellId"] = false,
						["use_spellCount"] = false,
						["use_genericShowOn"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["unit"] = "player",
						["realSpellName"] = "Icy Veins",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["remOperator"] = "<=",
						["auraspellids"] = {
							"11025", -- [1]
							"10952", -- [2]
							"7128", -- [3]
							"1254", -- [4]
							"1006", -- [5]
							"588", -- [6]
							"11026", -- [7]
							"10951", -- [8]
							"624", -- [9]
							"7130", -- [10]
							"1252", -- [11]
							"7129", -- [12]
							"602", -- [13]
							"609", -- [14]
							"1253", -- [15]
							"1007", -- [16]
						},
						["use_track"] = true,
						["useRem"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["useTooltip"] = false,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desc"] = "",
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_offset"] = 1,
					["border_size"] = 14,
					["border_color"] = {
						0.9921568627450981, -- [1]
						1, -- [2]
						0.9686274509803922, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "None",
					["type"] = "subborder",
				}, -- [2]
			},
			["height"] = 48,
			["alpha"] = 1,
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
						["PRIEST"] = true,
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
						["scenario"] = true,
						["ten"] = true,
						["twentyfive"] = true,
						["fortyman"] = true,
						["ratedpvp"] = true,
						["flexible"] = true,
						["ratedarena"] = true,
						["party"] = true,
						["arena"] = true,
						["twenty"] = true,
						["pvp"] = true,
					},
				},
				["use_spellknown"] = false,
				["level_operator"] = {
					">=", -- [1]
				},
				["use_exact_spellknown"] = false,
				["use_level"] = false,
				["level"] = {
					"3", -- [1]
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
			},
			["useCooldownModRate"] = true,
			["useAdjustededMax"] = false,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["source"] = "import",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["displayIcon"] = 135932,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["url"] = "",
			["uid"] = "XXR9pwY2kqX",
			["useAdjustededMin"] = false,
			["width"] = 48,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 11503,
			["id"] = "VEINS CD Visual",
			["desaturate"] = false,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = -568.8888778686523,
			["config"] = {
			},
			["inverse"] = false,
			["internalVersion"] = 72,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [2]
			},
			["cooldown"] = true,
			["authorOptions"] = {
			},
		},
		["castbar player"] = {
			["sparkWidth"] = 30,
			["iconSource"] = -1,
			["user_x"] = 0,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["key"] = "disableBlizzard",
					["default"] = true,
					["name"] = "Disable Blizzard Castbar",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [1]
			},
			["adjustedMax"] = "0.5",
			["yOffset"] = 0,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n\naura_env.opacity = 0",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.castbarEvents = {\n    \"UNIT_SPELLCAST_START\",\n    \"UNIT_SPELLCAST_STOP\",\n    \"UNIT_SPELLCAST_FAILED\",\n    \"UNIT_SPELLCAST_INTERRUPTED\",\n    \"UNIT_SPELLCAST_DELAYED\",\n    \"UNIT_SPELLCAST_CHANNEL_START\",\n    \"UNIT_SPELLCAST_CHANNEL_UPDATE\",\n    \"UNIT_SPELLCAST_CHANNEL_STOP\",\n    \"PLAYER_ENTERING_WORLD\",\n}\n\naura_env.opacity = 0\n\nif aura_env.config.disableBlizzard then\n    \n    CastingBarFrame:UnregisterAllEvents()\nelse\n    for k,v in pairs(aura_env.castbarEvents) do\n        CastingBarFrame:RegisterEvent(v)\n    end    \n    \nend",
					["do_custom"] = true,
				},
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.9882352941176471, -- [1]
				0.996078431372549, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["startAngle"] = 0,
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["blendMode"] = "BLEND",
			["sparkDesaturate"] = false,
			["slantMode"] = "INSIDE",
			["texture"] = "blizzcast",
			["zoom"] = 0,
			["spark"] = true,
			["compress"] = false,
			["alpha"] = 1,
			["config"] = {
				["disableBlizzard"] = true,
			},
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = -15,
			["wagoID"] = "Yjx7bHW6u",
			["parent"] = "castbar player group",
			["adjustedMin"] = "0.2",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "AUTO",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_castType"] = true,
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_showLatency"] = false,
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["names"] = {
						},
						["castType"] = "cast",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["use_remaining"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 66,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "none",
					["preset"] = "fade",
					["alpha"] = 0.01,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["colorB"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["scalex"] = 1,
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = false,
					["type"] = "none",
					["easeType"] = "none",
					["scalex"] = 1,
					["use_color"] = false,
					["alpha"] = 0,
					["colorA"] = 1,
					["y"] = 0,
					["x"] = 0,
					["rotate"] = 0,
					["preset"] = "alphaPulse",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["colorType"] = "custom",
					["scaley"] = 1,
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
			},
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subforeground",
				}, -- [1]
				{
					["type"] = "subbackground",
				}, -- [2]
				{
					["text_text_format_n_format"] = "string",
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_text_format_n_abbreviate_max"] = 30,
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_justify"] = "CENTER",
					["text_shadowYOffset"] = -1,
					["text_anchorYOffset"] = -14,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_CENTER",
					["text_shadowXOffset"] = 1,
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_n_abbreviate"] = true,
				}, -- [3]
			},
			["height"] = 10,
			["crop_y"] = 0.72,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["source"] = "import",
			["information"] = {
			},
			["crop_x"] = 0.7,
			["tocversion"] = 30402,
			["mirror"] = false,
			["backgroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["anchorPoint"] = "CENTER",
			["foregroundTexture"] = "Interface\\Addons\\aTextures\\blizzcast.tga",
			["sparkTexture"] = "Interface\\Addons\\TextureScript\\CastBar\\sparkglow.tga",
			["icon_side"] = "LEFT",
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 4,
			["sparkHeight"] = 10,
			["fontSize"] = 12,
			["sparkHidden"] = "NEVER",
			["uid"] = "aFjHmrTgvjT",
			["semver"] = "1.0.13",
			["auraRotation"] = 0,
			["id"] = "castbar player",
			["icon"] = false,
			["frameStrata"] = 2,
			["width"] = 207,
			["user_y"] = 0,
			["preferToUpdate"] = true,
			["inverse"] = false,
			["sparkColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -1,
						["variable"] = "customcheck",
						["value"] = "function()\n    if (aura_env.opacity == 0) then aura_env.region.bar.spark:SetVertexColor(1,1,1,0) end\n    local conditions = WeakAuras.GetActiveTriggers(aura_env.id)\n    C_Timer.NewTicker(0.05, \n        function()\n            if (conditions[1]  == false or nil) then aura_env.opacity = 0 return end\n            local remaining = aura_env.state.expirationTime - GetTime()\n            if aura_env.state.duration/remaining > 1.14 then\n                if (aura_env.opacity <= 0.9) then aura_env.opacity = aura_env.opacity + 0.1 else return end\n                aura_env.region.bar.spark:SetVertexColor(1,1,1,aura_env.opacity)\n            end        \n    end, 30)\nend         \n\n",
					},
					["changes"] = {
						{
							["value"] = {
								["custom"] = "",
							},
							["property"] = "customcode",
						}, -- [1]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["slanted"] = false,
		},
		["castbar player spark"] = {
			["user_y"] = 0,
			["iconSource"] = -1,
			["user_x"] = 0,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["key"] = "disableBlizzard",
					["default"] = true,
					["name"] = "Disable Blizzard Castbar",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [1]
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "aura_env.castbarEvents = {\n    \"UNIT_SPELLCAST_START\",\n    \"UNIT_SPELLCAST_STOP\",\n    \"UNIT_SPELLCAST_FAILED\",\n    \"UNIT_SPELLCAST_INTERRUPTED\",\n    \"UNIT_SPELLCAST_DELAYED\",\n    \"UNIT_SPELLCAST_CHANNEL_START\",\n    \"UNIT_SPELLCAST_CHANNEL_UPDATE\",\n    \"UNIT_SPELLCAST_CHANNEL_STOP\",\n    \"PLAYER_ENTERING_WORLD\",\n}\n\nif aura_env.config.disableBlizzard then\n    \n    CastingBarFrame:UnregisterAllEvents()\nelse\n    for k,v in pairs(aura_env.castbarEvents) do\n        CastingBarFrame:RegisterEvent(v)\n    end    \n    \nend",
					["do_custom"] = true,
				},
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["crop_y"] = 0.72,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["foregroundTexture"] = "Interface\\Addons\\aTextures\\blizzcast.tga",
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["blendMode"] = "BLEND",
			["sparkDesaturate"] = false,
			["slantMode"] = "INSIDE",
			["texture"] = "blizzcast",
			["sparkTexture"] = "Interface\\Addons\\TextureScript\\CastBar\\spark.tga",
			["spark"] = true,
			["tocversion"] = 30402,
			["alpha"] = 1,
			["auraRotation"] = 0,
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = 0,
			["wagoID"] = "Yjx7bHW6u",
			["parent"] = "player",
			["adjustedMin"] = "0.2",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "AUTO",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_castType"] = false,
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["names"] = {
						},
						["castType"] = "cast",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["unit"] = "player",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 66,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["duration"] = "1",
					["alphaType"] = "straight",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "none",
					["preset"] = "fade",
					["alpha"] = 0.01,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["colorB"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["scalex"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
			},
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subforeground",
				}, -- [1]
				{
					["type"] = "subbackground",
				}, -- [2]
				{
					["text_text_format_n_format"] = "string",
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_text_format_n_abbreviate_max"] = 30,
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_justify"] = "CENTER",
					["text_shadowYOffset"] = -1,
					["text_anchorYOffset"] = -14,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = false,
					["text_anchorPoint"] = "INNER_CENTER",
					["text_shadowXOffset"] = 1,
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_n_abbreviate"] = true,
				}, -- [3]
			},
			["height"] = 12,
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["sparkBlendMode"] = "BLEND",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["information"] = {
			},
			["crop_x"] = 0.7,
			["config"] = {
				["disableBlizzard"] = true,
			},
			["mirror"] = false,
			["zoom"] = 0,
			["adjustedMax"] = "0.5",
			["anchorPoint"] = "CENTER",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["icon_side"] = "LEFT",
			["width"] = 207,
			["backgroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["sparkHeight"] = 24,
			["startAngle"] = 0,
			["id"] = "castbar player spark",
			["uid"] = "E3Nh9(gAG1l",
			["semver"] = "1.0.13",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkHidden"] = "NEVER",
			["icon"] = false,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["sparkWidth"] = 20,
			["xOffset"] = 4,
			["inverse"] = false,
			["compress"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["slanted"] = false,
		},
		["Renew Indicator (P2) 2"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["xOffset"] = -670.577845228872,
			["preferToUpdate"] = false,
			["yOffset"] = 154,
			["foregroundColor"] = {
				0.06666666666666667, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturateBackground"] = false,
			["sameTexture"] = true,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auranames"] = {
							"Renew", -- [1]
						},
						["spellIds"] = {
						},
						["specificUnit"] = "party2",
						["useName"] = true,
						["names"] = {
						},
						["unit"] = "member",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
			},
			["uid"] = "Cgq2n87sjDi",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 30,
			["crop_y"] = 0.41,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["startAngle"] = 0,
			["selfPoint"] = "CENTER",
			["crop_x"] = 0.41,
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["anchorPoint"] = "CENTER",
			["blendMode"] = "BLEND",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["fontSize"] = 12,
			["slantMode"] = "INSIDE",
			["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura72",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["mirror"] = false,
			["compress"] = false,
			["id"] = "Renew Indicator (P2) 2",
			["tocversion"] = 30300,
			["alpha"] = 1,
			["width"] = 30,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["orientation"] = "ANTICLOCKWISE",
			["conditions"] = {
			},
			["information"] = {
			},
			["backgroundOffset"] = 2,
		},
		["Water Elemental CD Visual"] = {
			["iconSource"] = -1,
			["wagoID"] = "EJSv8n-lB",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = -337.0667037963867,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["track"] = "auto",
						["rem"] = "6000",
						["useStacks"] = false,
						["auranames"] = {
							"Inner Fire", -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnReady",
						["unit"] = "player",
						["use_showgcd"] = false,
						["stacks"] = "5",
						["type"] = "spell",
						["use_showlossofcontrol"] = false,
						["match_count"] = "1",
						["match_countOperator"] = "<",
						["use_remaining"] = false,
						["spellName"] = 31687,
						["auraspellids"] = {
							"11025", -- [1]
							"10952", -- [2]
							"7128", -- [3]
							"1254", -- [4]
							"1006", -- [5]
							"588", -- [6]
							"11026", -- [7]
							"10951", -- [8]
							"624", -- [9]
							"7130", -- [10]
							"1252", -- [11]
							"7129", -- [12]
							"602", -- [13]
							"609", -- [14]
							"1253", -- [15]
							"1007", -- [16]
						},
						["useName"] = true,
						["stacksOperator"] = "<=",
						["subeventSuffix"] = "_CAST_START",
						["use_spellCount"] = false,
						["matchesShowOn"] = "showOnMissing",
						["event"] = "Cooldown Progress (Spell)",
						["names"] = {
						},
						["realSpellName"] = "Summon Water Elemental",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["useExactSpellId"] = false,
						["remOperator"] = "<=",
						["debuffType"] = "HELPFUL",
						["use_track"] = true,
						["useRem"] = true,
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["useTooltip"] = false,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desc"] = "",
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_offset"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Gladdy Tooltip round",
					["border_size"] = 10,
				}, -- [2]
			},
			["height"] = 48,
			["internalVersion"] = 72,
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["MAGE"] = true,
						["PRIEST"] = true,
					},
				},
				["zoneIds"] = "",
				["use_spellknown"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["level"] = {
					"3", -- [1]
				},
				["use_level"] = false,
				["use_exact_spellknown"] = false,
				["level_operator"] = {
					">=", -- [1]
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
						["scenario"] = true,
						["ten"] = true,
						["twentyfive"] = true,
						["fortyman"] = true,
						["ratedpvp"] = true,
						["flexible"] = true,
						["ratedarena"] = true,
						["party"] = true,
						["arena"] = true,
						["twenty"] = true,
						["pvp"] = true,
					},
				},
			},
			["useCooldownModRate"] = true,
			["useAdjustededMax"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["source"] = "import",
			["cooldownEdge"] = false,
			["cooldown"] = true,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "show",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [2]
			},
			["icon"] = true,
			["anchorFrameFrame"] = "PlayerFrame",
			["regionType"] = "icon",
			["useAdjustededMin"] = false,
			["config"] = {
			},
			["desaturate"] = false,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["tocversion"] = 11503,
			["id"] = "Water Elemental CD Visual",
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["frameStrata"] = 1,
			["width"] = 48,
			["color"] = {
				0.984313725490196, -- [1]
				0.9725490196078431, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "6vnX6bzrDkY",
			["inverse"] = false,
			["alpha"] = 1,
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["xOffset"] = -568.8888778686523,
		},
		["MP5"] = {
			["iconSource"] = 0,
			["color"] = {
				0.01176470588235294, -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
			},
			["yOffset"] = -361.4005842732191,
			["anchorPoint"] = "CENTER",
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "item",
						["use_inverse"] = false,
						["subeventSuffix"] = "_CAST_START",
						["genericShowOn"] = "showOnCooldown",
						["use_genericShowOn"] = true,
						["event"] = "Item Equipped",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["use_itemSetName"] = false,
						["spellIds"] = {
						},
						["use_itemName"] = true,
						["itemName"] = 28033,
						["names"] = {
						},
						["itemSetName"] = "",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_offset"] = 0,
					["border_size"] = 13,
					["border_color"] = {
						1, -- [1]
						0.984313725490196, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Gladdy Tooltip round",
					["type"] = "subborder",
				}, -- [2]
			},
			["height"] = 39.5,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["cooldown"] = false,
			["displayIcon"] = "Interface\\Icons\\Spell_Nature_ManaRegenTotem",
			["zoom"] = 0,
			["xOffset"] = -631.355630058134,
			["anchorFrameType"] = "SCREEN",
			["id"] = "MP5",
			["config"] = {
			},
			["frameStrata"] = 1,
			["width"] = 39.5,
			["alpha"] = 1,
			["uid"] = "7pW6VNO1BKk",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["parent"] = "Weapon Switches",
		},
		["Circle Class Frame [WARRIOR]"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["events"] = "PLAYER_TARGET_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Warrior\" then\n        return true\n    else\n        return false\n    end\nend",
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warrior",
			["frameStrata"] = 4,
			["discrete_rotation"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARRIOR]",
			["parent"] = "Circle Class Frames (TARGET)",
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.9686274509803922, -- [2]
				0.9725490196078431, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["width"] = 95,
			["uid"] = "G(TBcTmVwJO",
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 42,
		},
		["Circle Class Frame [WARRIOR] 2"] = {
			["parent"] = "Circle Class Frames (FOCUS)",
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["use_unit"] = true,
						["custom_type"] = "event",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Warrior\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warrior",
			["anchorFrameType"] = "SELECTFRAME",
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARRIOR] 2",
			["alpha"] = 1,
			["frameStrata"] = 4,
			["width"] = 95,
			["config"] = {
			},
			["uid"] = "qQyU9Qhpyxa",
			["color"] = {
				1, -- [1]
				0.9686274509803922, -- [2]
				0.9725490196078431, -- [3]
				1, -- [4]
			},
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["authorOptions"] = {
			},
		},
		["Circle Class Frame [PALADIN]"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["events"] = "PLAYER_TARGET_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Paladin\" then\n        return true\n    else\n        return false\n    end\nend",
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Paladin",
			["frameStrata"] = 4,
			["discrete_rotation"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PALADIN]",
			["parent"] = "Circle Class Frames (TARGET)",
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.9254901960784314, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["width"] = 95,
			["uid"] = "rIoSAeOj6u0",
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 42,
		},
		["Circle Class Frame [ROGUE]"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Rogue\" then\n        return true\n    else\n        return false\n    end\nend",
						["use_unit"] = true,
						["custom_type"] = "event",
						["events"] = "PLAYER_TARGET_CHANGED",
						["spellIds"] = {
						},
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Rogue",
			["alpha"] = 1,
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [ROGUE]",
			["parent"] = "Circle Class Frames (TARGET)",
			["frameStrata"] = 4,
			["width"] = 95,
			["color"] = {
				1, -- [1]
				0.8823529411764706, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["uid"] = "0CRscaaoT(h",
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 42,
		},
		["Circle Class Frame [HUNTER] 2"] = {
			["parent"] = "Circle Class Frames (FOCUS)",
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Hunter\" then\n        return true\n    else\n        return false\n    end\nend",
						["use_unit"] = true,
						["custom_type"] = "event",
						["spellIds"] = {
						},
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Hunter",
			["anchorFrameType"] = "SELECTFRAME",
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [HUNTER] 2",
			["alpha"] = 1,
			["frameStrata"] = 4,
			["width"] = 95,
			["config"] = {
			},
			["uid"] = "TI5L9PmeJeh",
			["authorOptions"] = {
			},
			["color"] = {
				0.5882352941176471, -- [1]
				1, -- [2]
				0.6352941176470588, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 42,
		},
		["Invis additional visual"] = {
			["controlledChildren"] = {
				"Stealth Effect TOP", -- [1]
				"Stealth Effect BOTTOM", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "wdib4Sz3Z",
			["xOffset"] = -95.33245849609401,
			["preferToUpdate"] = true,
			["groupIcon"] = "Interface\\Icons\\Ability_Mage_Invisibility",
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 75,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desc"] = "",
			["version"] = 2,
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["config"] = {
			},
			["borderOffset"] = 4,
			["semver"] = "1.0.1",
			["tocversion"] = 30300,
			["id"] = "Invis additional visual",
			["authorOptions"] = {
			},
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["borderInset"] = 1,
			["selfPoint"] = "CENTER",
			["uid"] = "vQTq0ZuVxji",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["yOffset"] = -94.66683959960901,
		},
		["DMG Threshold CC Break (Target - Arena1)"] = {
			["user_y"] = 0,
			["iconSource"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["adjustedMax"] = "",
			["yOffset"] = 9,
			["foregroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["backgroundColor"] = {
				1, -- [1]
				0.02352941408753395, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.25098039215686, -- [1]
				0.78039215686274, -- [2]
				0.92156862745098, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_size"] = false,
				["use_never"] = true,
				["instance_type"] = {
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["zoneIds"] = "",
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["ratedpvp"] = true,
						["arena"] = true,
						["ratedarena"] = true,
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["foregroundTexture"] = "Interface\\AddOns\\TextureScript\\SwipeWA",
			["customAnchor"] = "function(states, ...)\n    local frame\n    if UnitIsUnit(\"arena1\", \"target\") then\n        frame = TargetFrame\n    elseif UnitIsUnit(\"arena1\", \"focus\") then\n        frame = FocusFrame\n    end\n    return frame\nend\n\n\n\n",
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["blendMode"] = "BLEND",
			["slantMode"] = "INSIDE",
			["texture"] = "Blizzard",
			["zoom"] = 0,
			["spark"] = false,
			["compress"] = false,
			["alpha"] = 1,
			["uid"] = "CwtWC6TUaFa",
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["customText"] = "",
			["desaturateBackground"] = false,
			["cooldownSwipe"] = true,
			["sparkRotationMode"] = "AUTO",
			["cooldownEdge"] = false,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_unit"] = true,
						["customIcon"] = "",
						["custom_hide"] = "custom",
						["customTexture"] = "",
						["type"] = "custom",
						["unit"] = "player",
						["custom_type"] = "status",
						["unevent"] = "auto",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Health",
						["events"] = "CLEU:SWING_DAMAGE, CLEU:RANGE_DAMAGE, CLEU:SPELL_DAMAGE, CLEU:SPELL_PERIODIC_DAMAGE, CLEU:SPELL_AURA_APPLIED, CLEU:SPELL_AURA_REMOVED, PLAYER_TARGET_CHANGED",
						["customDuration"] = "function()\n    if aura_env.currentAmount and aura_env.currentAmount > 0 then\n        return aura_env.currentAmount, aura_env.maxAmount, true\n    end\nend",
						["customName"] = "",
						["custom"] = "function(event)\n    local guid = UnitGUID(\"arena1\")\n    if event == \"PLAYER_TARGET_CHANGED\" then\n        if UnitIsUnit(\"target\", \"arena1\") then\n            guid = UnitGUID(\"target\")\n        else\n            guid = nil\n        end\n    end\n    \n    if guid and cacheUnit[guid] and cacheUnit[guid].feared then\n        aura_env.maxAmount = cacheUnit[guid].maxAmount\n        aura_env.currentAmount = cacheUnit[guid].currentAmount\n        aura_env.isFeared = cacheUnit[guid].feared\n        return true\n    else\n        aura_env.maxAmount = 0\n        aura_env.currentAmount = 0\n        aura_env.isFeared = false\n        return false\n    end\nend",
						["spellIds"] = {
						},
						["check"] = "event",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["custom"] = "function(event, ...)\n    return not aura_env.isFeared\nend",
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["preferToUpdate"] = false,
			["cooldown"] = true,
			["crop_x"] = 0,
			["customTextUpdate"] = "event",
			["desc"] = "",
			["tocversion"] = 40400,
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 103,
			["adjustedMin"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["width"] = 103,
			["useCooldownModRate"] = true,
			["crop_y"] = 0,
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["sparkHidden"] = "NEVER",
			["fontSize"] = 12,
			["sparkWidth"] = 10,
			["icon_side"] = "RIGHT",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auraRotation"] = 0,
			["sparkHeight"] = 30,
			["anchorPoint"] = "CENTER",
			["config"] = {
			},
			["xOffset"] = 94.42,
			["semver"] = "1.0.0",
			["icon"] = false,
			["id"] = "DMG Threshold CC Break (Target - Arena1)",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["startAngle"] = 0,
			["cooldownTextDisabled"] = false,
			["inverse"] = false,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["orientation"] = "ANTICLOCKWISE",
			["conditions"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["slanted"] = false,
		},
		["castbar player channel"] = {
			["user_y"] = 0,
			["iconSource"] = -1,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["backgroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.9764705882352941, -- [1]
				1, -- [2]
				0.9921568627450981, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["crop_y"] = 0.72,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["startAngle"] = 0,
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["blendMode"] = "BLEND",
			["sparkDesaturate"] = false,
			["slantMode"] = "INSIDE",
			["texture"] = "blizzcastchannel",
			["sparkTexture"] = "Interface\\Addons\\TextureScript\\CastBar\\sparkfade.tga",
			["spark"] = true,
			["tocversion"] = 30402,
			["alpha"] = 1,
			["auraRotation"] = 0,
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = -5,
			["wagoID"] = "Yjx7bHW6u",
			["parent"] = "castbar player group",
			["adjustedMin"] = "0.2",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "MANUAL",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_castType"] = true,
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["names"] = {
						},
						["castType"] = "channel",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["unit"] = "player",
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 66,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "easeIn",
					["preset"] = "fade",
					["alpha"] = 0.85,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
			},
			["sparkMirror"] = true,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subforeground",
				}, -- [1]
				{
					["type"] = "subbackground",
				}, -- [2]
				{
					["text_text_format_n_format"] = "string",
					["text_text"] = "%n",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_text_format_n_abbreviate_max"] = 30,
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_justify"] = "CENTER",
					["text_shadowYOffset"] = -1,
					["text_anchorYOffset"] = -14,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_CENTER",
					["text_shadowXOffset"] = 1,
					["text_fontType"] = "OUTLINE",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_n_abbreviate"] = true,
				}, -- [3]
			},
			["height"] = 10,
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "BLEND",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["information"] = {
			},
			["crop_x"] = 0.7,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["mirror"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n",
					["do_custom"] = false,
				},
				["init"] = {
				},
			},
			["xOffset"] = 4,
			["foregroundTexture"] = "Interface\\Addons\\aTextures\\blizzcast.tga",
			["zoom"] = 0,
			["icon_side"] = "LEFT",
			["anchorFrameType"] = "SCREEN",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 10,
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["id"] = "castbar player channel",
			["config"] = {
			},
			["semver"] = "1.0.13",
			["uid"] = "kFK(6yDsl0o",
			["sparkHidden"] = "EMPTY",
			["icon"] = false,
			["frameStrata"] = 2,
			["width"] = 207,
			["sparkWidth"] = 10,
			["compress"] = false,
			["inverse"] = false,
			["adjustedMax"] = "0.5",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<",
						["value"] = "0.2",
						["variable"] = "expirationTime",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0, -- [4]
							},
							["property"] = "sparkColor",
						}, -- [1]
					},
				}, -- [1]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["slanted"] = false,
		},
		["Circle Class Frame [SHAMAN]"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Shaman\" then\n        return true\n    else\n        return false\n    end\nend",
						["use_unit"] = true,
						["custom_type"] = "event",
						["events"] = "PLAYER_TARGET_CHANGED",
						["spellIds"] = {
						},
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Shaman",
			["anchorFrameType"] = "SELECTFRAME",
			["discrete_rotation"] = 0,
			["parent"] = "Circle Class Frames (TARGET)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [SHAMAN]",
			["alpha"] = 1,
			["frameStrata"] = 4,
			["width"] = 95,
			["xOffset"] = 42,
			["config"] = {
			},
			["uid"] = "h)25fvrrLar",
			["color"] = {
				1, -- [1]
				0.9882352941176471, -- [2]
				0.9568627450980392, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
		},
		["Stealth Effect BOTTOM"] = {
			["wagoID"] = "wdib4Sz3Z",
			["xOffset"] = 0,
			["preferToUpdate"] = true,
			["yOffset"] = -50,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auraspellids"] = {
							"66", -- [1]
						},
						["event"] = "Health",
						["names"] = {
						},
						["auranames"] = {
							"1787", -- [1]
							"58984", -- [2]
							"305628", -- [3]
							"115191", -- [4]
						},
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["useExactSpellId"] = true,
						["useName"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 75,
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "custom",
					["colorA"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_translate"] = false,
					["use_alpha"] = false,
					["type"] = "preset",
					["easeType"] = "none",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend\n",
					["scaley"] = 1,
					["alpha"] = 0,
					["y"] = -200,
					["x"] = 0,
					["colorB"] = 1,
					["preset"] = "grow",
					["easeStrength"] = 3,
					["rotate"] = 0,
					["translateType"] = "straightTranslate",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "pulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "grow",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 2,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 1100,
			["rotate"] = true,
			["load"] = {
				["use_race"] = true,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["single"] = "NightElf",
				},
				["use_petbattle"] = false,
				["use_zone"] = false,
				["class"] = {
					["single"] = "ROGUE",
					["multi"] = {
						["DRUID"] = true,
						["ROGUE"] = true,
					},
				},
				["use_spellknown"] = false,
				["spellknown"] = 5215,
				["zoneIds"] = "",
			},
			["textureWrapMode"] = "CLAMP",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["width"] = 1960,
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\6TJ_Polluted_mist_Stormy",
			["selfPoint"] = "CENTER",
			["discrete_rotation"] = 0,
			["semver"] = "1.0.1",
			["tocversion"] = 30300,
			["id"] = "Stealth Effect BOTTOM",
			["parent"] = "Invis additional visual",
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "kBbzhHWQpyL",
			["config"] = {
			},
			["alpha"] = 1,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["color"] = {
				1, -- [1]
				0, -- [2]
				0.05490196078431373, -- [3]
				1, -- [4]
			},
		},
		["castbar player end text"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "Yjx7bHW6u",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["displayText"] = "%n",
			["yOffset"] = -14,
			["anchorPoint"] = "CENTER",
			["displayText_format_n_abbreviate_max"] = 30,
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "event",
						["debuffType"] = "HELPFUL",
						["duration"] = "0.1",
						["event"] = "Chat Message",
						["unit"] = "player",
						["spellIds"] = {
						},
						["customName"] = "function()\n    return aura_env.text\nend",
						["custom"] = "function(event, text)\n    if event == \"CAST_FINISHED\" then\n        aura_env.text = text\n        return true\n    end\nend\n\n\n",
						["names"] = {
						},
						["events"] = "CAST_FINISHED",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "timed",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_time_mod_rate"] = true,
			["displayText_format_p_time_legacy_floor"] = false,
			["wordWrap"] = "WordWrap",
			["font"] = "Friz Quadrata TT",
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["config"] = {
			},
			["fontSize"] = 12,
			["source"] = "import",
			["displayText_format_n_format"] = "string",
			["shadowXOffset"] = 1,
			["selfPoint"] = "CENTER",
			["automaticWidth"] = "Auto",
			["regionType"] = "text",
			["conditions"] = {
			},
			["shadowYOffset"] = -1,
			["preferToUpdate"] = true,
			["displayText_format_p_format"] = "timed",
			["displayText_format_p_time_precision"] = 1,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
			},
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["semver"] = "1.0.13",
			["justify"] = "CENTER",
			["tocversion"] = 30402,
			["id"] = "castbar player end text",
			["internalVersion"] = 66,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["parent"] = "player",
			["uid"] = "(OW98pPw5Xo",
			["authorOptions"] = {
			},
			["displayText_format_n_abbreviate"] = true,
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
			},
			["xOffset"] = 4,
		},
		["PointIsCaptured"] = {
			["parent"] = "Battleground Widget",
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "aura_env.region.texture:SetTexCoord(unpack(aura_env.state.coord))",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "local WorldMap_GetPOITextureCoords = WorldMap_GetPOITextureCoords;\nlocal GetNumMapLandmarks, GetMapLandmarkInfo = GetNumMapLandmarks, GetMapLandmarkInfo;\nlocal GetLocale, GetMapInfo = GetLocale, GetMapInfo;\nlocal PointIsCaptured, WeakAuras = aura_env, WeakAuras;\n\nlocal L = {};\n\nif ( GetLocale() == \"ruRU\" ) then\n    L[\"captures\"] = \"захватывает\";\n    L[\"returned\"] = \"возвращен\";\n    L[\"dropped\"]  = \"уронили\";\nelse\n    L[\"captures\"] = \"captures\";\n    L[\"returned\"] = \"returned\";\n    L[\"dropped\"]  = \"dropped\";\nend\n\nlocal C_Map = {};\nC_Map[\"NetherstormArena\"] = {};\nC_Map[\"ArathiBasin\"] = {};\nC_Map.IsBattleground = function()\n    return C_Map[GetMapInfo()];\nend\n\nC_Map[\"NetherstormArena\"].Object = {\n    [10] = {\"horde\", \"captured\"}, \n    [11] = {\"alliance\", \"captured\"},\n};\n\nC_Map[\"ArathiBasin\"].Object = {\n    [17] = {\"alliance\", \"attack\"},   [19] = {\"horde\", \"attack\"},\n    [22] = {\"alliance\", \"attack\"},   [24] = {\"horde\", \"attack\"}, \n    [27] = {\"alliance\", \"attack\"},   [29] = {\"horde\", \"attack\"},\n    [32] = {\"alliance\", \"attack\"},   [34] = {\"horde\", \"attack\"}, \n    [37] = {\"alliance\", \"attack\"},   [39] = {\"horde\", \"attack\"},\n    \n    [18] = {\"alliance\", \"captured\"},  [20] = {\"horde\", \"captured\"},\n    [23] = {\"alliance\", \"captured\"},  [25] = {\"horde\", \"captured\"}, \n    [28] = {\"alliance\", \"captured\"},  [30] = {\"horde\", \"captured\"}, \n    [33] = {\"alliance\", \"captured\"},  [35] = {\"horde\", \"captured\"}, \n    [38] = {\"alliance\", \"captured\"},  [40] = {\"horde\", \"captured\"},\n};\n\nC_Map.GetObject = function(index)\n    if ( C_Map[GetMapInfo()] )  then\n        local index = C_Map[GetMapInfo()].Object[index];\n        return index and index[1], index and index[2];\n    end\nend\n\nPointIsCaptured.roster = PointIsCaptured.roster or {};\n\nfunction PointIsCaptured:GetFactionStatusBar(faction)\n    if ( faction == \"alliance\" ) then\n        return \"AllianceProgressBar\";\n    else\n        return \"HordeProgressBar\";\n    end\nend\n\nfunction PointIsCaptured:CreateTexture(allstates, index)\n    local data = self.roster[index]\n    if ( not data ) then \n        return;\n    end\n    \n    allstates[index] = {\n        show = true,\n        changed = true,\n        autoHide = false,\n        progressType = \"static\",\n        --custom\n        texture = \"Interface\\\\Minimap\\\\POIIcons\",\n        status = data.status,\n        name = data.name,\n        index = index,\n        coord = data.coord,\n        frameID = data.frameID\n    };\nend\n\nfunction PointIsCaptured:CreateFrame(allstates)\n    for index, data in pairs(self.roster) do\n        self:CreateTexture(allstates, index);\n    end\nend\n\nfunction PointIsCaptured:RemoveDB(allstates, index)\n    local state = allstates[index];\n    if ( not state ) then\n        return;\n    end\n    \n    state.show = false;\n    state.changed = true;\nend\n\nfunction PointIsCaptured:CheckFlagStatus(allstates, event, ...)\n    local msg = ...  or \"\";\n    local update = false;\n    if ( ( event == \"CHAT_MSG_BG_SYSTEM_ALLIANCE\" or event == \"CHAT_MSG_BG_SYSTEM_HORDE\" ) \n        and (msg):match(L[\"captures\"]) ) then \n        local index, textureIndex = 6, 45;\n        local name = \"Flag\";\n        local a, b, c, d = WorldMap_GetPOITextureCoords(textureIndex);\n        local faction = event == \"CHAT_MSG_BG_SYSTEM_ALLIANCE\" and \"alliance\" or \"horde\";\n        self.roster[index] = {\n            textureIndex = textureIndex, \n            index = index,\n            coord = {a,b,c,d},\n            name = name,\n            status = \"neutral\",   \n            frameID = self:GetFactionStatusBar(faction),\n        };\n        self:CreateTexture(allstates, index);\n        self:scheduleUpdateFrames(allstates, 0.02);\n        update = true;\n    elseif ( (msg):match(L[\"returned\"]) or (msg):match(L[\"dropped\"]) ) then\n        local state = allstates[6];\n        if ( state ) then\n            state.show = false;\n            state.changed = true;\n            self.roster[6] = nil;\n            self:scheduleUpdateFrames(allstates, 0.02);\n            update = true;\n        end\n    end\n    return update;\nend\n\nfunction PointIsCaptured:InitNeweBase(allstates, ...)\n    local update = false;\n    if ( GetMapInfo() == \"NetherstormArena\" ) then\n        update = self:CheckFlagStatus(allstates, ...);\n    end\n    \n    for index, data in pairs(self.roster) do\n        if ( index ~= 6 ) then \n            if ( data.textureIndex ~= select(3, GetMapLandmarkInfo(index)) ) then\n                self:RemoveDB(allstates, index);\n                self.roster[index] = nil;\n                update = true;\n                self:scheduleUpdateFrames(allstates, 0.02);\n            end\n        end\n    end\n    \n    for index = 1, GetNumMapLandmarks() do\n        local name, _, textureIndex = GetMapLandmarkInfo(index);\n        local textureIndex = select(3, GetMapLandmarkInfo(index));\n        if ( name and textureIndex ) then \n            local faction, status = C_Map.GetObject(textureIndex);\n            local a,b,c,d = WorldMap_GetPOITextureCoords(textureIndex);\n            if ( status and not self.roster[index] ) then\n                self.roster[index] = {\n                    textureIndex = textureIndex, \n                    index = index,\n                    coord = {a,b,c,d},\n                    name = name,\n                    status = status,\n                    frameID = self:GetFactionStatusBar(faction)\n                };\n                \n                self:CreateTexture(allstates, index);\n                update = true;\n                self:scheduleUpdateFrames(allstates, 0.02);\n            end\n        end \n    end\n    return update;\nend\n\nfunction PointIsCaptured:ClearAllStates(allstates) \n    for _, state in pairs(allstates) do\n        state.show = false;\n        state.changed = true;\n    end\n    self.roster = {};\nend\n\nPointIsCaptured.TestObject = {\n    [17] = {\"alliance\", \"attack\"},   \n    [22] = {\"alliance\", \"captured\"}, \n    [28] = {\"alliance\", \"captured\"},  \n    \n    [35] = {\"horde\", \"attack\"},\n    [40] = {\"horde\", \"captured\"},\n};\n\nfunction PointIsCaptured:CreateTestFrames(allstates)\n    for textureIndex in pairs(self.TestObject) do\n        local faction = self.TestObject[textureIndex][1];\n        local a,b,c,d = WorldMap_GetPOITextureCoords(textureIndex);\n        self.roster[textureIndex] = {\n            textureIndex = textureIndex, \n            coord = {a,b,c,d},\n            faction = faction,\n            frameID = self:GetFactionStatusBar(faction)\n        };\n        self:CreateTexture(allstates, textureIndex);\n    end\nend\n\nfunction PointIsCaptured:OnEvent(allstates, event, ...) \n    if ( event == \"OPTIONS\" ) then\n        self:CreateTestFrames(allstates);\n        self:scheduleUpdateFrames(allstates, 0.02);\n    end\n    \n    if ( not C_Map.IsBattleground() ) then \n        return;\n    end\n    \n    if ( event == \"ZONE_CHANGED_NEW_AREA\" ) then\n        self:ClearAllStates(allstates);\n        self:InitNeweBase(allstates, event, ...);\n        self:CreateFrame(allstates);\n        return true;\n        \n    elseif ( event == \"PLAYER_ENTERING_WORLD\" ) then \n        self:InitNeweBase(allstates, event, ...);\n        self:CreateFrame(allstates);\n        return true;\n        \n    else\n        return self:InitNeweBase(allstates, event, ...);\n    end\nend\n\nPointIsCaptured.auraCount = {};\nPointIsCaptured.xOffset = 0;\nPointIsCaptured.yOffset = -10;\n\nlocal function setIconPosition(self, state, rowIdx)\n    local region = WeakAuras.GetRegion(self.id, state.index);\n    local f = WeakAuras.GetRegion(state.frameID);\n    local positionFrom, positionTo;\n    if ( f and region ) then\n        self.auraCount[state.index] = self.auraCount[state.index] or {};\n        self.auraCount[state.index].rowIdx = self.auraCount[state.index].rowIdx or 0;\n        \n        local xoffset, yoffset = 0, 0;\n        local height, width = region:GetHeight() + 2, region:GetWidth() + 2;\n        \n        if ( state.frameID == \"AllianceProgressBar\" ) then\n            xoffset = xoffset - (rowIdx - 1) * height;\n            positionFrom, positionTo = \"TOPRIGHT\", \"BOTTOMRIGHT\";\n        elseif ( state.frameID == \"HordeProgressBar\" ) then\n            xoffset = xoffset + (rowIdx - 1) * height;\n            positionFrom, positionTo = \"TOPLEFT\", \"BOTTOMLEFT\";\n        end\n        \n        region:SetAnchor(positionFrom, f, positionTo);\n        region:SetOffset(xoffset + self.xOffset, yoffset + self.yOffset);\n        region.texture:SetTexCoord(unpack(state.coord)) ;\n        self.auraCount[state.index].rowIdx = self.auraCount[state.index].rowIdx + 1;\n    end\nend\n\nfunction PointIsCaptured:updateFrames(allstates)\n    table.wipe(self.auraCount)\n    for index, indexData in pairs(self.roster) do  \n        local rowIdxA = 0    \n        local rowIdxH = 0    \n        for _, state in pairs(allstates) do\n            if state.show and state.frameID == \"AllianceProgressBar\" then\n                rowIdxA = rowIdxA + 1\n                setIconPosition(self, state, rowIdxA)\n            elseif state.show and state.frameID == \"HordeProgressBar\" then\n                rowIdxH = rowIdxH+ 1\n                setIconPosition(self, state, rowIdxH)\n            end                           \n        end            \n    end\nend\n\nlocal timer;\nfunction PointIsCaptured:scheduleUpdateFrames(allstates, duration)\n    if timer then WeakAuras.timer:CancelTimer(timer) end\n    timer = WeakAuras.timer:ScheduleTimer(function()\n            self:updateFrames(allstates) end, \n        duration\n    )\nend",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "stateupdate",
						["customVariables"] = "{\n    texIndx = 'number',\n    status = {\n        display = \"Status\",\n        type = \"select\",\n        values = {\n            [\"attack\"] = \"Attacked\", \n            [\"captured\"] = \"Captured\", \n        }\n    }\n}",
						["event"] = "Health",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["names"] = {
						},
						["check"] = "event",
						["events"] = "ZONE_CHANGED_NEW_AREA PLAYER_ENTERING_WORLD CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["custom"] = "function(...)\n    return aura_env:OnEvent(...)\nend",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["version"] = 39,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 18,
			["rotate"] = true,
			["load"] = {
				["use_size"] = true,
				["use_never"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["discrete_rotation"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["texture"] = "Interface\\ICONS\\Achievement_BG_DefendXtowers_AV",
			["xOffset"] = 0,
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n\n",
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "PointIsCaptured",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["width"] = 18,
			["config"] = {
			},
			["uid"] = "pzKfttOqwyz",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["duration_type"] = "seconds",
					["colorB"] = 1,
					["colorG"] = 1,
					["colorA"] = 1,
					["use_translate"] = false,
					["type"] = "none",
					["easeStrength"] = 3,
					["scaleType"] = "straightScale",
					["translateType"] = "straightTranslate",
					["easeType"] = "none",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend\n",
					["scaley"] = 1,
					["alpha"] = 0,
					["x"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\nend\n",
					["use_color"] = false,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["scalex"] = 1,
					["use_scale"] = false,
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Circle Class Frames (FOCUS)"] = {
			["controlledChildren"] = {
				"Circle Class Frame [WARLOCK] 2", -- [1]
				"Circle Class Frame [MAGE] 2", -- [2]
				"Circle Class Frame [DRUID] 2", -- [3]
				"Circle Class Frame [WARRIOR] 2", -- [4]
				"Circle Class Frame [ROGUE] 2", -- [5]
				"Circle Class Frame [HUNTER] 2", -- [6]
				"Circle Class Frame [PRIEST] 2", -- [7]
				"Circle Class Frame [PALADIN] 2", -- [8]
				"Circle Class Frame [SHAMAN] 2", -- [9]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["groupIcon"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Mage",
			["anchorPoint"] = "CENTER",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["subRegions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["source"] = "import",
			["scale"] = 1,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
			["borderOffset"] = 4,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frames (FOCUS)",
			["uid"] = "9Lcfb1CqjxZ",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["borderInset"] = 1,
			["config"] = {
			},
			["yOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 0,
		},
		["castbar player back end"] = {
			["wagoID"] = "Yjx7bHW6u",
			["xOffset"] = 4,
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_absorbMode"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["custom_hide"] = "timed",
						["debuffType"] = "HELPFUL",
						["spellName"] = 0,
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["custom_type"] = "event",
						["event"] = "Spell Cast Succeeded",
						["unit"] = "player",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["duration"] = "0.1",
						["use_unit"] = true,
						["sourceUnit"] = "player",
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 20,
			["rotate"] = true,
			["load"] = {
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["width"] = 355,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcast.tga",
			["authorOptions"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back end",
			["parent"] = "player",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["rotation"] = 0,
			["uid"] = "iN4BrN2CQJ6",
			["frameStrata"] = 2,
			["config"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellId",
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [1]
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["alphaType"] = "straight",
					["colorB"] = 1,
					["colorG"] = 1,
					["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
					["use_alpha"] = true,
					["type"] = "none",
					["easeType"] = "easeIn",
					["preset"] = "fade",
					["alpha"] = 0.85,
					["y"] = 0,
					["x"] = 0,
					["duration_type"] = "seconds",
					["rotate"] = 0,
					["easeStrength"] = 3,
					["scaley"] = 1,
					["colorA"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["preset"] = "alphaPulse",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "straightColor",
					["use_color"] = false,
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["preset"] = "fade",
					["duration"] = "",
				},
			},
		},
		["DMG Threshold CC Break (Target - Arena2)"] = {
			["user_y"] = 0,
			["iconSource"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["adjustedMax"] = "",
			["yOffset"] = 9,
			["foregroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "\n\n",
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["fontFlags"] = "OUTLINE",
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0.25098039215686, -- [1]
				0.78039215686274, -- [2]
				0.92156862745098, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_size"] = false,
				["use_never"] = true,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
						["ratedpvp"] = true,
						["arena"] = true,
						["ratedarena"] = true,
					},
				},
				["difficulty"] = {
					["multi"] = {
					},
				},
				["role"] = {
					["multi"] = {
					},
				},
				["faction"] = {
					["multi"] = {
					},
				},
				["pvptalent"] = {
					["multi"] = {
					},
				},
				["race"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["instance_type"] = {
				},
				["zoneIds"] = "",
			},
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["foregroundTexture"] = "Interface\\AddOns\\TextureScript\\SwipeWA",
			["customAnchor"] = "function(states, ...)\n    local frame\n    if UnitIsUnit(\"arena2\", \"target\") then\n        frame = TargetFrame\n    elseif UnitIsUnit(\"arena2\", \"focus\") then\n        frame = FocusFrame\n    end\n    return frame\nend\n\n\n\n",
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["blendMode"] = "BLEND",
			["slantMode"] = "INSIDE",
			["texture"] = "Blizzard",
			["zoom"] = 0,
			["spark"] = false,
			["compress"] = false,
			["alpha"] = 1,
			["uid"] = "MmgxxQVPB7g",
			["backgroundOffset"] = 0,
			["sparkOffsetX"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["customText"] = "",
			["desaturateBackground"] = false,
			["cooldownSwipe"] = true,
			["sparkRotationMode"] = "AUTO",
			["cooldownEdge"] = false,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["unit"] = "player",
						["customIcon"] = "",
						["custom_hide"] = "custom",
						["debuffType"] = "HELPFUL",
						["type"] = "custom",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["custom_type"] = "status",
						["unevent"] = "auto",
						["event"] = "Health",
						["spellIds"] = {
						},
						["customDuration"] = "function()\n    if aura_env.currentAmount and aura_env.currentAmount > 0 then\n        return aura_env.currentAmount, aura_env.maxAmount, true\n    end\nend",
						["customName"] = "",
						["events"] = "CLEU:SWING_DAMAGE, CLEU:RANGE_DAMAGE, CLEU:SPELL_DAMAGE, CLEU:SPELL_PERIODIC_DAMAGE, CLEU:SPELL_AURA_APPLIED, CLEU:SPELL_AURA_REMOVED, PLAYER_TARGET_CHANGED",
						["custom"] = "function(event)\n    local guid = UnitGUID(\"arena2\")\n    if event == \"PLAYER_TARGET_CHANGED\" then\n        if UnitIsUnit(\"target\", \"arena2\") then\n            guid = UnitGUID(\"target\")\n        else\n            guid = nil\n        end\n    end\n    \n    if guid and cacheUnit[guid] and cacheUnit[guid].feared then\n        aura_env.maxAmount = cacheUnit[guid].maxAmount\n        aura_env.currentAmount = cacheUnit[guid].currentAmount\n        aura_env.isFeared = cacheUnit[guid].feared\n        return true\n    else\n        aura_env.maxAmount = 0\n        aura_env.currentAmount = 0\n        aura_env.isFeared = false\n        return false\n    end\nend",
						["check"] = "event",
						["names"] = {
						},
						["use_unit"] = true,
						["customTexture"] = "",
					},
					["untrigger"] = {
						["custom"] = "function(event, ...)\n    return not aura_env.isFeared\nend",
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
					["easeStrength"] = 3,
					["easeType"] = "none",
				},
			},
			["preferToUpdate"] = false,
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["customTextUpdate"] = "event",
			["desc"] = "",
			["tocversion"] = 40400,
			["version"] = 3,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 103,
			["adjustedMin"] = "",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["anchorFrameType"] = "SELECTFRAME",
			["frameStrata"] = 1,
			["sparkWidth"] = 10,
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["id"] = "DMG Threshold CC Break (Target - Arena2)",
			["icon"] = false,
			["crop_y"] = 0,
			["icon_side"] = "RIGHT",
			["xOffset"] = 94.42,
			["anchorPoint"] = "CENTER",
			["sparkHeight"] = 30,
			["auraRotation"] = 0,
			["config"] = {
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["semver"] = "1.0.0",
			["fontSize"] = 12,
			["sparkHidden"] = "NEVER",
			["backgroundColor"] = {
				1, -- [1]
				0.02352941408753395, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["useCooldownModRate"] = true,
			["width"] = 103,
			["startAngle"] = 0,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["inverse"] = false,
			["cooldownTextDisabled"] = false,
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0,
			["cooldown"] = true,
			["slanted"] = false,
		},
		["Circle Class Frame [SHAMAN] 2"] = {
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Shaman\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_FOCUS_CHANGED",
						["spellIds"] = {
						},
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Shaman",
			["width"] = 95,
			["selfPoint"] = "CENTER",
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [SHAMAN] 2",
			["frameStrata"] = 4,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.9882352941176471, -- [2]
				0.9568627450980392, -- [3]
				1, -- [4]
			},
			["uid"] = "C3fWdU(hE3k",
			["config"] = {
			},
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
		},
		["Water Combat Desaturation (PRIEST)"] = {
			["color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.6400000154972076, -- [4]
			},
			["yOffset"] = -314.4668774954076,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["use_incombat"] = true,
						["use_eventtype"] = true,
						["eventtype"] = "PLAYER_REGEN_DISABLED",
						["event"] = "Conditions",
						["unit"] = "player",
						["type"] = "unit",
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["use_unit"] = true,
						["names"] = {
						},
						["auranames"] = {
							"Weakened Soul", -- [1]
						},
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 36,
			["rotate"] = false,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\TextureScript\\Swipe",
			["width"] = 36,
			["discrete_rotation"] = 0,
			["desc"] = "because 3.3.5a client is fucking dogshit and cant do it on its own",
			["frameStrata"] = 6,
			["id"] = "Water Combat Desaturation (PRIEST)",
			["parent"] = "Desaturation (Priest)",
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["xOffset"] = 191.7111078178856,
			["uid"] = "Bqo)mk1GQIV",
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["easeStrength"] = 3,
					["preset"] = "fade",
				},
			},
		},
		["Circle Class Frame [WARLOCK] 2"] = {
			["color"] = {
				0.9882352941176471, -- [1]
				1, -- [2]
				0.9803921568627451, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["debuffType"] = "HELPFUL",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["use_unit"] = true,
						["custom_type"] = "event",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Warlock\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom_hide"] = "custom",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["discrete_rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warlock",
			["anchorFrameType"] = "SELECTFRAME",
			["rotation"] = 0,
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARLOCK] 2",
			["alpha"] = 1,
			["frameStrata"] = 4,
			["width"] = 95,
			["xOffset"] = 42,
			["uid"] = "g(5LpFJW(uF",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
		},
		["Circle Class Frame [PRIEST] 2"] = {
			["parent"] = "Circle Class Frames (FOCUS)",
			["preferToUpdate"] = false,
			["yOffset"] = 5.57,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["custom_hide"] = "custom",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Priest\" then\n        return true\n    else\n        return false\n    end\nend",
						["custom_type"] = "event",
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 95,
			["rotate"] = true,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Priest",
			["width"] = 95,
			["discrete_rotation"] = 0,
			["selfPoint"] = "CENTER",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PRIEST] 2",
			["frameStrata"] = 4,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["uid"] = "xIPPOvJrN1V",
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				0.9568627450980392, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["authorOptions"] = {
			},
		},
		["Mount Combat Desaturation (PRIEST)"] = {
			["xOffset"] = 149.7111078178856,
			["yOffset"] = -314.4668774954076,
			["anchorPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_incombat"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["event"] = "Conditions",
						["unit"] = "player",
						["useName"] = true,
						["use_eventtype"] = true,
						["spellIds"] = {
						},
						["eventtype"] = "PLAYER_REGEN_DISABLED",
						["subeventPrefix"] = "SPELL",
						["auranames"] = {
							"Weakened Soul", -- [1]
						},
						["names"] = {
						},
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 52,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
			},
			["desc"] = "because 3.3.5a client is fucking dogshit and cant do it on its own",
			["rotation"] = 0,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 36,
			["rotate"] = false,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["mirror"] = false,
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["texture"] = "Interface\\Addons\\TextureScript\\Swipe",
			["parent"] = "Desaturation (Priest)",
			["discrete_rotation"] = 0,
			["selfPoint"] = "CENTER",
			["frameStrata"] = 6,
			["id"] = "Mount Combat Desaturation (PRIEST)",
			["config"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["uid"] = "gaJTYMBCYy0",
			["color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.6400000154972076, -- [4]
			},
			["width"] = 36,
			["conditions"] = {
			},
			["information"] = {
			},
			["desaturate"] = false,
		},
		["PW: Shield (P1)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0.57,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturateBackground"] = false,
			["load"] = {
				["talent"] = {
					["multi"] = {
						[103] = true,
					},
				},
				["class"] = {
					["single"] = "PRIEST",
					["multi"] = {
						["PRIEST"] = true,
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sameTexture"] = true,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auranames"] = {
							"6788", -- [1]
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["specificUnit"] = "party1",
						["useName"] = true,
						["names"] = {
						},
						["unit"] = "member",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["endAngle"] = 360,
			["internalVersion"] = 75,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["selfPoint"] = "CENTER",
			["slanted"] = false,
			["xOffset"] = -39,
			["crop_x"] = 0.41,
			["desc"] = "Shield CD on Party1 indicator...",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["preferToUpdate"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 43,
			["animation"] = {
				["start"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "preset",
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["preset"] = "fade",
					["easeStrength"] = 3,
				},
			},
			["crop_y"] = 0.41,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["startAngle"] = 0,
			["uid"] = "nD2epxy)96V",
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["mirror"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["anchorFrameType"] = "SELECTFRAME",
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["slantMode"] = "INSIDE",
			["compress"] = false,
			["smoothProgress"] = false,
			["anchorFrameFrame"] = "PartyMemberFrame1",
			["anchorPoint"] = "CENTER",
			["tocversion"] = 40400,
			["id"] = "PW: Shield (P1)",
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-PartyFlash-Highlight_Shield",
			["alpha"] = 1,
			["width"] = 43,
			["config"] = {
			},
			["auraRotation"] = 0,
			["inverse"] = false,
			["backgroundColor"] = {
				0.5019607843137255, -- [1]
				0.5019607843137255, -- [2]
				0.5019607843137255, -- [3]
				0.5, -- [4]
			},
			["orientation"] = "ANTICLOCKWISE",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["backgroundOffset"] = 2,
		},
		["Weapon Switches"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"DMG", -- [1]
				"HEAL", -- [2]
				"SPIRIT", -- [3]
				"MP5", -- [4]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["xOffset"] = 0,
			["information"] = {
			},
			["border"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["borderSize"] = 2,
			["borderEdge"] = "Square Full White",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["scale"] = 1,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["authorOptions"] = {
			},
			["borderOffset"] = 4,
			["selfPoint"] = "CENTER",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["id"] = "Weapon Switches",
			["internalVersion"] = 52,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "K5NYFGjIbiX",
			["borderInset"] = 1,
			["config"] = {
			},
			["subRegions"] = {
			},
			["conditions"] = {
			},
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["regionType"] = "group",
		},
	},
	["lastArchiveClear"] = 1724945002,
	["minimap"] = {
		["hide"] = true,
	},
	["lastUpgrade"] = 1724945003,
	["dbVersion"] = 52,
	["login_squelch_time"] = 10,
	["registered"] = {
	},
	["frame"] = {
		["xOffset"] = -345.5576178563459,
		["yOffset"] = -24.00003884395198,
		["height"] = 665.0000550517277,
		["width"] = 829.9998844255653,
	},
	["editor_theme"] = "Monokai",
}
