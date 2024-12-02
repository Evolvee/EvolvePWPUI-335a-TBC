
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["editor_tab_spaces"] = 4,
	["displays"] = {
		["Circle Class Frame [WARRIOR]"] = {
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Warrior\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_TARGET_CHANGED",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warrior",
			["alpha"] = 1,
			["xOffset"] = 42,
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
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARRIOR]",
			["parent"] = "Circle Class Frames (TARGET)",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["uid"] = "G(TBcTmVwJO",
			["width"] = 95,
			["color"] = {
				1, -- [1]
				0.9686274509803922, -- [2]
				0.9725490196078431, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
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
						["useStacks"] = false,
						["useExactSpellId"] = false,
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "target",
						["unitExists"] = false,
						["auranames"] = {
							"Ice Block", -- [1]
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["useName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["useRem"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["useStacks"] = false,
						["subeventSuffix"] = "_CAST_START",
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["names"] = {
						},
						["unitExists"] = false,
						["auranames"] = {
							"Divine Shield", -- [1]
						},
						["spellIds"] = {
						},
						["unit"] = "target",
						["useName"] = true,
						["useExactSpellId"] = false,
						["subeventPrefix"] = "SPELL",
						["useRem"] = false,
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["useStacks"] = false,
						["subeventSuffix"] = "_CAST_START",
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "target",
						["unitExists"] = false,
						["auranames"] = {
							"Cloak of Shadows", -- [1]
						},
						["spellIds"] = {
						},
						["useName"] = true,
						["useExactSpellId"] = false,
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["useRem"] = false,
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
						["PALADIN"] = true,
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
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["discrete_rotation"] = 0,
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-FOCUSFRAME-LARGE-FLASH",
			["authorOptions"] = {
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
			["desc"] = "IMMUNE target highlight texture... (Bubble, Block, Cloak)",
			["tocversion"] = 30300,
			["id"] = "IMMUNE target visual",
			["anchorFrameType"] = "SELECTFRAME",
			["frameStrata"] = 2,
			["width"] = 256,
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
			["xOffset"] = -11,
		},
		["castbar player casttime"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "Yjx7bHW6u",
			["parent"] = "player",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["yOffset"] = 5,
			["anchorPoint"] = "CENTER",
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
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
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 0,
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cast",
						["names"] = {
						},
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["use_absorbMode"] = true,
						["use_unit"] = true,
						["unit"] = "player",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_time_mod_rate"] = true,
			["internalVersion"] = 66,
			["selfPoint"] = "BOTTOM",
			["tocversion"] = 30402,
			["displayText_format_1.destName_format"] = "none",
			["font"] = "Friz Quadrata TT",
			["version"] = 14,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["displayText_format_t_format"] = "timed",
			["conditions"] = {
			},
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
			["displayText_format_p_format"] = "timed",
			["url"] = "",
			["fontSize"] = 12,
			["source"] = "import",
			["displayText"] = "%p / %t",
			["shadowXOffset"] = 1,
			["uid"] = "1T4ymU17Hz7",
			["xOffset"] = 3,
			["anchorFrameFrame"] = "WeakAuras:castbar player group",
			["regionType"] = "text",
			["wordWrap"] = "WordWrap",
			["displayText_format_t_time_dynamic_threshold"] = 60,
			["preferToUpdate"] = true,
			["displayText_format_t_time_legacy_floor"] = false,
			["displayText_format_p_time_precision"] = 1,
			["justify"] = "LEFT",
			["authorOptions"] = {
			},
			["shadowYOffset"] = -1,
			["semver"] = "1.0.13",
			["displayText_format_t_time_format"] = 0,
			["id"] = "castbar player casttime",
			["displayText_format_t_time_precision"] = 1,
			["frameStrata"] = 3,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["displayText_format_t_time_mod_rate"] = true,
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
					["colorR"] = 1,
					["duration"] = "",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["scalex"] = 1,
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["use_color"] = false,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
			["shadowColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["fixedWidth"] = 200,
			["information"] = {
			},
			["displayText_format_p_time_legacy_floor"] = false,
		},
		["HordeProgressBar"] = {
			["sparkWidth"] = 15,
			["iconSource"] = 0,
			["user_x"] = 0,
			["xOffset"] = 60,
			["preferToUpdate"] = false,
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
					["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\567474.ogg",
					["custom"] = "",
					["do_custom"] = false,
					["do_sound"] = false,
				},
				["finish"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nlocal C_Map = {};\nlocal C_PvP = {};\n\nC_Map[\"ArathiBasin\"] = {\n    progress = 3,\n    index = 2,\n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"AlteracValley\"] = {\n    progress = 3,\n    index = 2,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 600\n};\n\nC_Map[\"IsleofConquest\"] = {\n    progress = 3,\n    index = 2,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 300\n};\n\nC_Map[\"NetherstormArena\"] = {\n    progress = 3,\n    index = 3,\n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"WarsongGulch\"] = {\n    progress = 3,\n    index = 3,\n    curr = 3,\n    find = \"(%d+)[^%d]+(%d+)\",\n    total = 3\n};\n\nfunction C_PvP.IsPvPMap()\n    local inInstance, instanceType = IsInInstance()\n    if ( not inInstance ) then\n        return;\n    end\n    \n    return instanceType == \"pvp\" or instanceType == \"arena\";\nend\n\nfunction aura_env:OnEvent(event, ...)\n    \n    if not C_PvP.IsPvPMap() then\n        return false;\n    end\n    \n    local mapFileName = GetMapInfo();\n    \n    if ( C_Map[mapFileName] ) then\n        RequestBattlefieldScoreData()\n        \n        local number = C_Map[mapFileName]\n        local progress = select(number.progress,GetWorldStateUIInfo(number.index))\n        local curr  = select(number.curr, progress:find(number.find)) \n        \n        aura_env.zone  = mapFileName\n        aura_env.value = tonumber(curr)\n        aura_env.total = number.total\n        \n        return true\n    end\n    \nend\n-----------------------------------------------------------------------------------------------------\n\nlocal frame = WeakAuras.regions[aura_env.id].region;\n\nif ( not frame.texture ) then\n    local texture = CreateFrame(\"Frame\", nil, frame);\n    texture:SetFrameStrata(\"MEDIUM\") ;\n    frame.texture = texture;\n    frame.texture = frame.texture:CreateTexture(nil, \"Texture\");\n    frame.texture:SetTexture([[Interface\\Timer\\Horde-Logo]]);\nend \n\nframe.texture:SetPoint(\"LEFT\", frame, \"RIGHT\", - region:GetHeight() / 1.6, 0);\nframe.texture:SetSize(region:GetHeight() * 2.3, region:GetHeight() * 2.3);\n\n-----------------------------------------------------------------------------------------------------\n\naura_env.value, aura_env.total = math.random(400, 1400), 1600;\n\n\n",
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
				0.54901960784314, -- [1]
				0.086274509803922, -- [2]
				0.086274509803922, -- [3]
				1, -- [4]
			},
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
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
			["borderBackdrop"] = "None",
			["parent"] = "Battleground Widget",
			["customText"] = "function(total, value)    \n    \n    if ( ( aura_env.zone == \"IsleofConquest\" ) \n        or ( aura_env.zone == \"AlteracValley\" ) ) then\n        return value\n    end\n    \n    return (\"%.f / %.f\"):format(value, total)\nend",
			["desaturateBackground"] = false,
			["sparkRotationMode"] = "AUTO",
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["debuffType"] = "HELPFUL",
						["custom_type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["genericShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "player",
						["customDuration"] = "function()\n    return aura_env.value, aura_env.total, true      \nend",
						["custom"] = "function(event, ...)\n    return aura_env:OnEvent(event, ...)\nend",
						["spellIds"] = {
						},
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["check"] = "event",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["custom_hide"] = "timed",
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
					["easeStrength"] = 3,
					["type"] = "none",
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
					["duration"] = "1",
					["type"] = "none",
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["translateFunc"] = "",
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["x"] = 0,
					["translateType"] = "custom",
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["use_scale"] = false,
					["easeStrength"] = 3,
					["scalex"] = 1,
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
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
					["text_visible"] = true,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [3]
				{
					["type"] = "subborder",
					["border_offset"] = 5,
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
					["border_size"] = 20,
				}, -- [4]
			},
			["height"] = 25,
			["sparkOffsetX"] = 0,
			["uid"] = "l1TEBj1iqeR",
			["sparkBlendMode"] = "ADD",
			["backdropColor"] = {
				[4] = 0,
			},
			["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\SpellActivationOverlays\\Eclipse_Sun",
			["source"] = "import",
			["crop_x"] = 0.41,
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
				["ingroup"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
					},
				},
			},
			["useAdjustedMax"] = false,
			["mirror"] = false,
			["authorOptions"] = {
			},
			["desaturate"] = false,
			["borderInFront"] = true,
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.80000001192093, -- [4]
			},
			["icon_side"] = "LEFT",
			["zoom"] = 0,
			["anchorFrameType"] = "SCREEN",
			["sparkHeight"] = 60,
			["icon"] = false,
			["user_y"] = 0,
			["id"] = "HordeProgressBar",
			["semver"] = "2.0.0",
			["spark"] = true,
			["sparkHidden"] = "NEVER",
			["useAdjustededMax"] = false,
			["frameStrata"] = 2,
			["width"] = 100,
			["anchorPoint"] = "CENTER",
			["compress"] = false,
			["inverse"] = false,
			["config"] = {
			},
			["orientation"] = "HORIZONTAL_INVERSE",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["customTextUpdate"] = "event",
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Priest\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Priest",
			["frameStrata"] = 1,
			["xOffset"] = 42,
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PRIEST]",
			["parent"] = "Circle Class Frames (TARGET)",
			["alpha"] = 1,
			["width"] = 95,
			["uid"] = "QqN00qtyjy)",
			["config"] = {
			},
			["anchorFrameType"] = "SELECTFRAME",
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
			["selfPoint"] = "CENTER",
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Warlock\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_TARGET_CHANGED",
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
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warlock",
			["alpha"] = 1,
			["xOffset"] = 42,
			["rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARLOCK]",
			["parent"] = "Circle Class Frames (TARGET)",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["width"] = 95,
			["config"] = {
			},
			["color"] = {
				0.9882352941176471, -- [1]
				1, -- [2]
				0.9803921568627451, -- [3]
				1, -- [4]
			},
			["uid"] = "B95Gb9Dolel",
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
		["castbar player back"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
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
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
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
					["colorA"] = 1,
					["scaley"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "",
					["easeType"] = "none",
					["use_color"] = false,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
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
			["frameStrata"] = 2,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastback.tga",
			["xOffset"] = 0,
			["rotation"] = 0,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "g40yJbaHWxU",
			["config"] = {
			},
			["parent"] = "player",
			["width"] = 355,
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
			["selfPoint"] = "CENTER",
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Druid\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Druid",
			["width"] = 95,
			["selfPoint"] = "CENTER",
			["parent"] = "Circle Class Frames (TARGET)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [DRUID]",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				0.984313725490196, -- [1]
				0.9725490196078431, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["uid"] = "XZST3pUQSTa",
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
		},
		["Circle Class Frame [MAGE]"] = {
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Mage\" then\n        return true\n    else\n        return false\n    end\nend",
						["use_unit"] = true,
						["custom_type"] = "event",
						["spellIds"] = {
						},
						["events"] = "PLAYER_TARGET_CHANGED",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Mage",
			["anchorFrameType"] = "SELECTFRAME",
			["selfPoint"] = "CENTER",
			["parent"] = "Circle Class Frames (TARGET)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [MAGE]",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["width"] = 95,
			["authorOptions"] = {
			},
			["uid"] = "OTPG(0)Aye7",
			["config"] = {
			},
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
		["IMMUNE focus visual"] = {
			["xOffset"] = -11,
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
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["useStacks"] = false,
						["useExactSpellId"] = false,
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["names"] = {
						},
						["unitExists"] = false,
						["auranames"] = {
							"Ice Block", -- [1]
						},
						["spellIds"] = {
						},
						["unit"] = "focus",
						["useName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["useRem"] = false,
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["useStacks"] = false,
						["useExactSpellId"] = false,
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "focus",
						["unitExists"] = false,
						["auranames"] = {
							"Divine Shield", -- [1]
						},
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["useName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["useRem"] = false,
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["useStacks"] = false,
						["useExactSpellId"] = false,
						["useTotal"] = false,
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["unitExists"] = false,
						["auranames"] = {
							"Cloak of Shadows", -- [1]
						},
						["spellIds"] = {
						},
						["useName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["unit"] = "focus",
						["useRem"] = false,
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
						["PALADIN"] = true,
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
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "BLEND",
			["selfPoint"] = "CENTER",
			["texture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-FOCUSFRAME-LARGE-FLASH",
			["authorOptions"] = {
			},
			["desc"] = "IMMUNE focus highlight texture... (Cloak, Bubble, Block)",
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "IMMUNE focus visual",
			["width"] = 256,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SELECTFRAME",
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
			["color"] = {
				1, -- [1]
				0.007843137254901961, -- [2]
				0, -- [3]
				1, -- [4]
			},
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
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 66,
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
			["version"] = 14,
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
			["uid"] = "1zJ9fal2OdA",
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 132.2259608440456,
		},
		["PointIsCaptured"] = {
			["xOffset"] = 0,
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "aura_env.region.texture:SetTexCoord(unpack(aura_env.state.coord))",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local WorldMap_GetPOITextureCoords = WorldMap_GetPOITextureCoords;\nlocal GetNumMapLandmarks, GetMapLandmarkInfo = GetNumMapLandmarks, GetMapLandmarkInfo;\nlocal GetLocale, GetMapInfo = GetLocale, GetMapInfo;\nlocal PointIsCaptured, WeakAuras = aura_env, WeakAuras;\n\nlocal L = {};\n\nif ( GetLocale() == \"ruRU\" ) then\n    L[\"captures\"] = \"захватывает\";\n    L[\"returned\"] = \"возвращен\";\n    L[\"dropped\"]  = \"уронили\";\nelse\n    L[\"captures\"] = \"captures\";\n    L[\"returned\"] = \"returned\";\n    L[\"dropped\"]  = \"dropped\";\nend\n\nlocal C_Map = {};\nC_Map[\"NetherstormArena\"] = {};\nC_Map[\"ArathiBasin\"] = {};\nC_Map.IsBattleground = function()\n    return C_Map[GetMapInfo()];\nend\n\nC_Map[\"NetherstormArena\"].Object = {\n    [10] = {\"horde\", \"captured\"}, \n    [11] = {\"alliance\", \"captured\"},\n};\n\nC_Map[\"ArathiBasin\"].Object = {\n    [17] = {\"alliance\", \"attack\"},   [19] = {\"horde\", \"attack\"},\n    [22] = {\"alliance\", \"attack\"},   [24] = {\"horde\", \"attack\"}, \n    [27] = {\"alliance\", \"attack\"},   [29] = {\"horde\", \"attack\"},\n    [32] = {\"alliance\", \"attack\"},   [34] = {\"horde\", \"attack\"}, \n    [37] = {\"alliance\", \"attack\"},   [39] = {\"horde\", \"attack\"},\n    \n    [18] = {\"alliance\", \"captured\"},  [20] = {\"horde\", \"captured\"},\n    [23] = {\"alliance\", \"captured\"},  [25] = {\"horde\", \"captured\"}, \n    [28] = {\"alliance\", \"captured\"},  [30] = {\"horde\", \"captured\"}, \n    [33] = {\"alliance\", \"captured\"},  [35] = {\"horde\", \"captured\"}, \n    [38] = {\"alliance\", \"captured\"},  [40] = {\"horde\", \"captured\"},\n};\n\nC_Map.GetObject = function(index)\n    if ( C_Map[GetMapInfo()] )  then\n        local index = C_Map[GetMapInfo()].Object[index];\n        return index and index[1], index and index[2];\n    end\nend\n\nPointIsCaptured.roster = PointIsCaptured.roster or {};\n\nfunction PointIsCaptured:GetFactionStatusBar(faction)\n    if ( faction == \"alliance\" ) then\n        return \"AllianceProgressBar\";\n    else\n        return \"HordeProgressBar\";\n    end\nend\n\nfunction PointIsCaptured:CreateTexture(allstates, index)\n    local data = self.roster[index]\n    if ( not data ) then \n        return;\n    end\n    \n    allstates[index] = {\n        show = true,\n        changed = true,\n        autoHide = false,\n        progressType = \"static\",\n        --custom\n        texture = \"Interface\\\\Minimap\\\\POIIcons\",\n        status = data.status,\n        name = data.name,\n        index = index,\n        coord = data.coord,\n        frameID = data.frameID\n    };\nend\n\nfunction PointIsCaptured:CreateFrame(allstates)\n    for index, data in pairs(self.roster) do\n        self:CreateTexture(allstates, index);\n    end\nend\n\nfunction PointIsCaptured:RemoveDB(allstates, index)\n    local state = allstates[index];\n    if ( not state ) then\n        return;\n    end\n    \n    state.show = false;\n    state.changed = true;\nend\n\nfunction PointIsCaptured:CheckFlagStatus(allstates, event, ...)\n    local msg = ...  or \"\";\n    local update = false;\n    if ( ( event == \"CHAT_MSG_BG_SYSTEM_ALLIANCE\" or event == \"CHAT_MSG_BG_SYSTEM_HORDE\" ) \n        and (msg):match(L[\"captures\"]) ) then \n        local index, textureIndex = 6, 45;\n        local name = \"Flag\";\n        local a, b, c, d = WorldMap_GetPOITextureCoords(textureIndex);\n        local faction = event == \"CHAT_MSG_BG_SYSTEM_ALLIANCE\" and \"alliance\" or \"horde\";\n        self.roster[index] = {\n            textureIndex = textureIndex, \n            index = index,\n            coord = {a,b,c,d},\n            name = name,\n            status = \"neutral\",   \n            frameID = self:GetFactionStatusBar(faction),\n        };\n        self:CreateTexture(allstates, index);\n        self:scheduleUpdateFrames(allstates, 0.02);\n        update = true;\n    elseif ( (msg):match(L[\"returned\"]) or (msg):match(L[\"dropped\"]) ) then\n        local state = allstates[6];\n        if ( state ) then\n            state.show = false;\n            state.changed = true;\n            self.roster[6] = nil;\n            self:scheduleUpdateFrames(allstates, 0.02);\n            update = true;\n        end\n    end\n    return update;\nend\n\nfunction PointIsCaptured:InitNeweBase(allstates, ...)\n    local update = false;\n    if ( GetMapInfo() == \"NetherstormArena\" ) then\n        update = self:CheckFlagStatus(allstates, ...);\n    end\n    \n    for index, data in pairs(self.roster) do\n        if ( index ~= 6 ) then \n            if ( data.textureIndex ~= select(3, GetMapLandmarkInfo(index)) ) then\n                self:RemoveDB(allstates, index);\n                self.roster[index] = nil;\n                update = true;\n                self:scheduleUpdateFrames(allstates, 0.02);\n            end\n        end\n    end\n    \n    for index = 1, GetNumMapLandmarks() do\n        local name, _, textureIndex = GetMapLandmarkInfo(index);\n        local textureIndex = select(3, GetMapLandmarkInfo(index));\n        if ( name and textureIndex ) then \n            local faction, status = C_Map.GetObject(textureIndex);\n            local a,b,c,d = WorldMap_GetPOITextureCoords(textureIndex);\n            if ( status and not self.roster[index] ) then\n                self.roster[index] = {\n                    textureIndex = textureIndex, \n                    index = index,\n                    coord = {a,b,c,d},\n                    name = name,\n                    status = status,\n                    frameID = self:GetFactionStatusBar(faction)\n                };\n                \n                self:CreateTexture(allstates, index);\n                update = true;\n                self:scheduleUpdateFrames(allstates, 0.02);\n            end\n        end \n    end\n    return update;\nend\n\nfunction PointIsCaptured:ClearAllStates(allstates) \n    for _, state in pairs(allstates) do\n        state.show = false;\n        state.changed = true;\n    end\n    self.roster = {};\nend\n\nPointIsCaptured.TestObject = {\n    [17] = {\"alliance\", \"attack\"},   \n    [22] = {\"alliance\", \"captured\"}, \n    [28] = {\"alliance\", \"captured\"},  \n    \n    [35] = {\"horde\", \"attack\"},\n    [40] = {\"horde\", \"captured\"},\n};\n\nfunction PointIsCaptured:CreateTestFrames(allstates)\n    for textureIndex in pairs(self.TestObject) do\n        local faction = self.TestObject[textureIndex][1];\n        local a,b,c,d = WorldMap_GetPOITextureCoords(textureIndex);\n        self.roster[textureIndex] = {\n            textureIndex = textureIndex, \n            coord = {a,b,c,d},\n            faction = faction,\n            frameID = self:GetFactionStatusBar(faction)\n        };\n        self:CreateTexture(allstates, textureIndex);\n    end\nend\n\nfunction PointIsCaptured:OnEvent(allstates, event, ...) \n    if ( event == \"OPTIONS\" ) then\n        self:CreateTestFrames(allstates);\n        self:scheduleUpdateFrames(allstates, 0.02);\n    end\n    \n    if ( not C_Map.IsBattleground() ) then \n        return;\n    end\n    \n    if ( event == \"ZONE_CHANGED_NEW_AREA\" ) then\n        self:ClearAllStates(allstates);\n        self:InitNeweBase(allstates, event, ...);\n        self:CreateFrame(allstates);\n        return true;\n        \n    elseif ( event == \"PLAYER_ENTERING_WORLD\" ) then \n        self:InitNeweBase(allstates, event, ...);\n        self:CreateFrame(allstates);\n        return true;\n        \n    else\n        return self:InitNeweBase(allstates, event, ...);\n    end\nend\n\nPointIsCaptured.auraCount = {};\nPointIsCaptured.xOffset = 0;\nPointIsCaptured.yOffset = -10;\n\nlocal function setIconPosition(self, state, rowIdx)\n    local region = WeakAuras.GetRegion(self.id, state.index);\n    local f = WeakAuras.GetRegion(state.frameID);\n    local positionFrom, positionTo;\n    if ( f and region ) then\n        self.auraCount[state.index] = self.auraCount[state.index] or {};\n        self.auraCount[state.index].rowIdx = self.auraCount[state.index].rowIdx or 0;\n        \n        local xoffset, yoffset = 0, 0;\n        local height, width = region:GetHeight() + 2, region:GetWidth() + 2;\n        \n        if ( state.frameID == \"AllianceProgressBar\" ) then\n            xoffset = xoffset - (rowIdx - 1) * height;\n            positionFrom, positionTo = \"TOPRIGHT\", \"BOTTOMRIGHT\";\n        elseif ( state.frameID == \"HordeProgressBar\" ) then\n            xoffset = xoffset + (rowIdx - 1) * height;\n            positionFrom, positionTo = \"TOPLEFT\", \"BOTTOMLEFT\";\n        end\n        \n        region:SetAnchor(positionFrom, f, positionTo);\n        region:SetOffset(xoffset + self.xOffset, yoffset + self.yOffset);\n        region.texture:SetTexCoord(unpack(state.coord)) ;\n        self.auraCount[state.index].rowIdx = self.auraCount[state.index].rowIdx + 1;\n    end\nend\n\nfunction PointIsCaptured:updateFrames(allstates)\n    table.wipe(self.auraCount)\n    for index, indexData in pairs(self.roster) do  \n        local rowIdxA = 0    \n        local rowIdxH = 0    \n        for _, state in pairs(allstates) do\n            if state.show and state.frameID == \"AllianceProgressBar\" then\n                rowIdxA = rowIdxA + 1\n                setIconPosition(self, state, rowIdxA)\n            elseif state.show and state.frameID == \"HordeProgressBar\" then\n                rowIdxH = rowIdxH+ 1\n                setIconPosition(self, state, rowIdxH)\n            end                           \n        end            \n    end\nend\n\nlocal timer;\nfunction PointIsCaptured:scheduleUpdateFrames(allstates, duration)\n    if timer then WeakAuras.timer:CancelTimer(timer) end\n    timer = WeakAuras.timer:ScheduleTimer(function()\n            self:updateFrames(allstates) end, \n        duration\n    )\nend",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["custom_type"] = "stateupdate",
						["debuffType"] = "HELPFUL",
						["event"] = "Health",
						["unit"] = "player",
						["events"] = "ZONE_CHANGED_NEW_AREA PLAYER_ENTERING_WORLD CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["custom"] = "function(...)\n    return aura_env:OnEvent(...)\nend",
						["spellIds"] = {
						},
						["names"] = {
						},
						["check"] = "event",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["customVariables"] = "{\n    texIndx = 'number',\n    status = {\n        display = \"Status\",\n        type = \"select\",\n        values = {\n            [\"attack\"] = \"Attacked\", \n            [\"captured\"] = \"Captured\", \n        }\n    }\n}",
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
					["translateType"] = "straightTranslate",
					["scalex"] = 1,
					["colorB"] = 1,
					["colorG"] = 1,
					["duration_type"] = "seconds",
					["use_translate"] = false,
					["use_scale"] = false,
					["rotate"] = 0,
					["scaleType"] = "straightScale",
					["use_color"] = false,
					["easeType"] = "none",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend\n",
					["scaley"] = 1,
					["alpha"] = 0,
					["colorR"] = 1,
					["y"] = 0,
					["colorType"] = "straightColor",
					["scaleFunc"] = "function(progress, startX, startY, scaleX, scaleY)\n    return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\nend\n",
					["x"] = 0,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["easeStrength"] = 3,
					["type"] = "none",
					["colorA"] = 1,
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
			["selfPoint"] = "CENTER",
			["parent"] = "Battleground Widget",
			["texture"] = "Interface\\ICONS\\Achievement_BG_DefendXtowers_AV",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n\n",
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "PointIsCaptured",
			["width"] = 18,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["uid"] = "pzKfttOqwyz",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["discrete_rotation"] = 0,
		},
		["Water Elemental Out of CD Visual"] = {
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
			["url"] = "",
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
						["track"] = "auto",
						["rem"] = "6000",
						["useStacks"] = false,
						["auranames"] = {
							"Inner Fire", -- [1]
						},
						["use_genericShowOn"] = true,
						["matchesShowOn"] = "showOnMissing",
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["use_showgcd"] = false,
						["stacks"] = "5",
						["useName"] = true,
						["use_showlossofcontrol"] = false,
						["match_count"] = "1",
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
						["use_remaining"] = false,
						["debuffType"] = "HELPFUL",
						["useExactSpellId"] = false,
						["type"] = "spell",
						["stacksOperator"] = "<=",
						["match_countOperator"] = "<",
						["use_spellCount"] = false,
						["subeventPrefix"] = "SPELL",
						["event"] = "Cooldown Progress (Spell)",
						["unit"] = "player",
						["realSpellName"] = "Summon Water Elemental",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["remOperator"] = "<=",
						["spellName"] = 31687,
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
			["desc"] = "",
			["version"] = 6,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 10,
					["border_offset"] = 2,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Gladdy Tooltip round",
					["type"] = "subborder",
				}, -- [2]
			},
			["height"] = 48,
			["anchorFrameFrame"] = "PlayerFrame",
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = false,
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
						["party"] = true,
						["ratedarena"] = true,
						["flexible"] = true,
						["arena"] = true,
						["twenty"] = true,
						["pvp"] = true,
					},
				},
				["use_class"] = true,
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
			["frameStrata"] = 1,
			["useAdjustededMax"] = false,
			["icon"] = true,
			["source"] = "import",
			["desaturate"] = true,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",
			["internalVersion"] = 72,
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["uid"] = "IozEijyvK7l",
			["xOffset"] = -568.8888778686523,
			["width"] = 48,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 11503,
			["id"] = "Water Elemental Out of CD Visual",
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["useCooldownModRate"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["selfPoint"] = "CENTER",
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
			["cooldownEdge"] = false,
		},
		["castbar player end"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["customForegroundFrames"] = 15,
			["yOffset"] = 0.5,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["animationType"] = "loop",
			["sameTexture"] = true,
			["startPercent"] = 0,
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
						["type"] = "custom",
						["custom_type"] = "event",
						["duration"] = "0.1",
						["event"] = "Health",
						["unit"] = "player",
						["custom_hide"] = "timed",
						["subeventSuffix"] = "_CAST_START",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["names"] = {
						},
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["activeTriggerMode"] = -10,
			},
			["frameRate"] = 60,
			["internalVersion"] = 66,
			["rotation"] = 0,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["colorR"] = 1,
					["scalex"] = 1,
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
					["colorB"] = 1,
					["y"] = 0,
					["x"] = 2,
					["preset"] = "shake",
					["easeStrength"] = 5,
					["translateType"] = "shake",
					["rotate"] = 0,
					["duration_type"] = "seconds",
					["duration"] = "1",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["scalex"] = 1,
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["use_color"] = false,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
			["customForegroundFileHeight"] = 256,
			["customBackgroundRows"] = 16,
			["customForegroundFileWidth"] = 1024,
			["customForegroundRows"] = 8,
			["discrete_rotation"] = 0,
			["hideBackground"] = true,
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
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.40015864372253, -- [4]
			},
			["rotate"] = true,
			["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\stopmotion",
			["customBackgroundColumns"] = 16,
			["foregroundTexture"] = "Interface\\Addons\\TextureScript\\CastBar\\uicastingbarstandardflipbook.tga",
			["backgroundPercent"] = 1,
			["desaturateForeground"] = false,
			["mirror"] = false,
			["uid"] = "bw88STZMPeK",
			["regionType"] = "stopmotion",
			["source"] = "import",
			["endPercent"] = 1,
			["customForegroundFrameWidth"] = 424,
			["parent"] = "player",
			["customForegroundColumns"] = 2,
			["blendMode"] = "ADD",
			["customBackgroundFrames"] = 0,
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.5, -- [4]
			},
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player end",
			["width"] = 207,
			["frameStrata"] = 3,
			["anchorFrameType"] = "SCREEN",
			["xOffset"] = 3.5,
			["config"] = {
			},
			["inverse"] = false,
			["selfPoint"] = "CENTER",
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
			["url"] = "",
		},
		["castbar player back text"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = -8,
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
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
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
					["colorA"] = 1,
					["scaley"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "",
					["easeType"] = "none",
					["use_color"] = false,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
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
			["frameStrata"] = 2,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastbacktext.tga",
			["xOffset"] = 4,
			["rotation"] = 0,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back text",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "zefS2NrCRus",
			["config"] = {
			},
			["parent"] = "player",
			["width"] = 355,
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
			["selfPoint"] = "CENTER",
		},
		["AllianceFlag"] = {
			["parent"] = "Battleground Widget",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "BOTTOM",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nif ( not region.background ) then\n    region.background = region:CreateTexture(nil, \"BACKGROUND\");\nend\nregion.background:SetTexture([[Interface\\WorldStateFrame\\HordeFlagFlash]]);\nregion.background:SetBlendMode(\"ADD\");\nregion.background:ClearAllPoints();\nregion.background:SetPoint(\"CENTER\", region, \"CENTER\");\nregion.background:SetSize(region:GetWidth()*0.75 , region:GetHeight()*0.75);\n\naura_env.BGcolor = {};\n\nfor key, value in pairs(aura_env.config[\"color\"]) do\n    aura_env.BGcolor[key] = value;\nend",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["custom_type"] = "status",
						["custom"] = "function(event, ...)\n    if not ( GetMapInfo() == \"WarsongGulch\" ) then return end\n    return select(2, GetWorldStateUIInfo(3)) == 2 \nend",
						["customTexture"] = "function()   \n    return [[Interface\\WorldStateFrame\\AllianceFlag]] \nend",
						["check"] = "event",
						["spellIds"] = {
						},
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCOREUPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
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
					["easeStrength"] = 3,
					["type"] = "none",
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
					["duration"] = "1",
					["easeType"] = "none",
					["scaley"] = 1,
					["use_color"] = false,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "custom",
					["preset"] = "pulse",
					["colorA"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local alpha = 1 + (((math.sin(angle) + 1)/2) * 0.5)\n    WeakAuras.regions[aura_env.id].region.background:SetVertexColor(1, 1, 1, alpha)\n    return r1, g1, b1, a1\nend\n\n\n\n",
					["easeStrength"] = 3,
					["x"] = 0,
					["scalex"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
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
			["rotation"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameParent"] = false,
			["texture"] = "Interface\\WorldStateFrame\\AllianceFlag",
			["selfPoint"] = "TOP",
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "AllianceFlag",
			["frameStrata"] = 4,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["uid"] = "0pfDqSK9IuM",
			["config"] = {
				["color"] = {
					0.21176470588235, -- [1]
					0.78039215686275, -- [2]
					1, -- [3]
					1, -- [4]
				},
			},
			["width"] = 50,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
				{
					["type"] = "color",
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["key"] = "color",
					["name"] = "Цвет фона флага",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [1]
			},
		},
		["HordeFlag"] = {
			["parent"] = "Battleground Widget",
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "BOTTOM",
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nif ( not region.background ) then\n    region.background = region:CreateTexture(nil, \"BACKGROUND\");\nend\nregion.background:SetTexture([[Interface\\WorldStateFrame\\HordeFlagFlash]]);\nregion.background:SetBlendMode(\"ADD\");\nregion.background:ClearAllPoints();\nregion.background:SetPoint(\"CENTER\", region, \"CENTER\");\nregion.background:SetSize(region:GetWidth()*0.75 , region:GetHeight()*0.75);\n\naura_env.BGcolor = {};\n\nfor key, value in pairs(aura_env.config[\"color\"]) do\n    aura_env.BGcolor[key] = value;\nend",
					["do_custom"] = true,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "custom",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["custom_type"] = "status",
						["custom"] = "function(event, ...)\n    if not ( GetMapInfo() == \"WarsongGulch\" ) then return end\n    return select(2, GetWorldStateUIInfo(2)) == 2 \nend",
						["customTexture"] = "function()   \n    return [[Interface\\WorldStateFrame\\HordeFlag]] \nend",
						["check"] = "event",
						["spellIds"] = {
						},
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
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
					["easeStrength"] = 3,
					["type"] = "none",
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
					["duration"] = "1",
					["easeType"] = "none",
					["scaley"] = 1,
					["use_color"] = false,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["colorType"] = "custom",
					["preset"] = "pulse",
					["colorA"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local alpha = 1 + (((math.sin(angle) + 1)/2) * 0.5)\n    WeakAuras.regions[aura_env.id].region.background:SetVertexColor(1, 1, 1, alpha)\n    return r1, g1, b1, a1\nend\n\n\n\n",
					["easeStrength"] = 3,
					["x"] = 0,
					["scalex"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
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
				["use_zone"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["use_size"] = true,
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
			["rotation"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameParent"] = false,
			["texture"] = "Interface\\WorldStateFrame\\HordeFlag",
			["selfPoint"] = "TOP",
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "HordeFlag",
			["frameStrata"] = 4,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["uid"] = "8x5(4W69qAm",
			["config"] = {
				["color"] = {
					1, -- [1]
					0.5529411764705901, -- [2]
					0, -- [3]
					1, -- [4]
				},
			},
			["width"] = 50,
			["xOffset"] = 0,
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
				{
					["type"] = "color",
					["default"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["key"] = "color",
					["name"] = "Цвет фона флага",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [1]
			},
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
			["uid"] = "(PUE5jHMPH6",
			["frameStrata"] = 5,
			["anchorFrameType"] = "SELECTFRAME",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["borderInset"] = 1,
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["information"] = {
			},
			["borderEdge"] = "Square Full White",
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
			["preferToUpdate"] = false,
			["yOffset"] = -26,
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
				["finish"] = {
				},
				["init"] = {
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
			["selfPoint"] = "BOTTOMLEFT",
			["desc"] = "",
			["version"] = 39,
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
			["anchorFrameFrame"] = "UIParent",
			["regionType"] = "group",
			["borderSize"] = 2,
			["xOffset"] = 0,
			["borderOffset"] = 4,
			["semver"] = "2.0.0",
			["tocversion"] = 30300,
			["id"] = "Battleground Widget",
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
			["frameStrata"] = 4,
			["anchorFrameType"] = "SCREEN",
			["borderEdge"] = "Square Full White",
			["config"] = {
			},
			["uid"] = "ZQBPukwoW1X",
			["borderInset"] = 1,
			["conditions"] = {
			},
			["information"] = {
				["groupOffset"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["groupIcon"] = "Interface\\Icons\\FactionChange",
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
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Warlock\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "texture",
			["blendMode"] = "ADD",
			["anchorFrameParent"] = true,
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warlock",
			["width"] = 95,
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
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARLOCK] 2",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["authorOptions"] = {
			},
			["uid"] = "g(5LpFJW(uF",
			["config"] = {
			},
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["rotation"] = 0,
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
			["desaturateForeground"] = false,
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
			["authorOptions"] = {
			},
			["crop_x"] = 0.41,
			["desc"] = "Sacred Cancer FOCUS indicator",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
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
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 66,
			["foregroundColor"] = {
				0.9764706492424011, -- [1]
				1, -- [2]
				0.9921569228172302, -- [3]
				1, -- [4]
			},
			["load"] = {
				["use_never"] = true,
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
			["crop_y"] = 0.41,
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-Sacred Cancer",
			["config"] = {
			},
			["uid"] = "MPxEDWLvDPS",
			["mirror"] = false,
			["anchorFrameFrame"] = "FocusFrame",
			["regionType"] = "progresstexture",
			["width"] = 66,
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["adjustedMax"] = "",
			["slantMode"] = "INSIDE",
			["tocversion"] = 40400,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["useAdjustededMin"] = false,
			["smoothProgress"] = false,
			["compress"] = false,
			["id"] = "Sacred Cancer (Focus)",
			["fontSize"] = 12,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["startAngle"] = 0,
			["auraRotation"] = 0,
			["inverse"] = false,
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Hunter\" then\n        return true\n    else\n        return false\n    end\nend",
						["use_unit"] = true,
						["custom_type"] = "event",
						["spellIds"] = {
						},
						["events"] = "PLAYER_TARGET_CHANGED",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Hunter",
			["alpha"] = 1,
			["xOffset"] = 42,
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
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [HUNTER]",
			["parent"] = "Circle Class Frames (TARGET)",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["uid"] = "79KS2lhfE1D",
			["width"] = 95,
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
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
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["internalVersion"] = 66,
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
			["version"] = 14,
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
			["uid"] = "YYMmKKbAc)X",
			["selfPoint"] = "CENTER",
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 0,
		},
		["castbar player border end"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["url"] = "",
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
						["use_count"] = false,
						["use_absorbMode"] = true,
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
						["custom_hide"] = "timed",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_SUCCESS",
						["names"] = {
						},
						["custom_type"] = "event",
						["event"] = "Spell Cast Succeeded",
						["use_unit"] = true,
						["spellIds"] = {
						},
						["use_spellId"] = false,
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        aura_env.isSucceeded = true\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n        aura_env.isInterrupted = true\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["use_sourceUnit"] = true,
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["duration"] = "0.1",
						["sourceUnit"] = "player",
						["unit"] = "player",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
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
					["scalex"] = 1,
					["easeType"] = "none",
					["x"] = 0,
					["scaley"] = 1,
					["alpha"] = 0.85,
					["easeStrength"] = 3,
					["y"] = 0,
					["colorType"] = "pulseColor",
					["preset"] = "fade",
					["colorA"] = 1,
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local newProgress = ((math.sin(angle) + 1)/2);\n    return r1 + (newProgress * (r2 - r1)),\n         g1 + (newProgress * (g2 - g1)),\n         b1 + (newProgress * (b2 - b1)),\n         a1 + (newProgress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["use_color"] = true,
					["duration"] = "0.2",
				},
				["main"] = {
					["colorR"] = 1,
					["duration"] = "0.2",
					["colorB"] = 0,
					["colorG"] = 1,
					["type"] = "none",
					["colorA"] = 1,
					["easeType"] = "none",
					["colorType"] = "straightHSV",
					["use_color"] = true,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "alphaPulse",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\nend\n",
					["rotate"] = 0,
					["duration_type"] = "seconds",
					["scalex"] = 1,
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "",
					["easeType"] = "none",
					["use_color"] = false,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
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
			["frameStrata"] = 2,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastborder.blp",
			["xOffset"] = 0,
			["rotation"] = 0,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player border end",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "KVBJ)A1)JWx",
			["config"] = {
			},
			["parent"] = "player",
			["width"] = 355,
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
			["selfPoint"] = "CENTER",
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
						["names"] = {
						},
						["event"] = "Health",
						["unit"] = "player",
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
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbars",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["borderInset"] = 1,
			["xOffset"] = -156.176836886381,
			["uid"] = "YF0FOOXWfhs",
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
		["castbar player border"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
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
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
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
					["colorA"] = 1,
					["scaley"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "",
					["easeType"] = "none",
					["use_color"] = false,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
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
			["frameStrata"] = 2,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastborder.blp",
			["xOffset"] = 0,
			["rotation"] = 0,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player border",
			["color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = ")vcUsoDp8Ii",
			["config"] = {
			},
			["parent"] = "player",
			["width"] = 355,
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
			["selfPoint"] = "CENTER",
		},
		["UI - pet castbar bar"] = {
			["sparkWidth"] = 32,
			["iconSource"] = -1,
			["wagoID"] = "OFUbeHBSv",
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["adjustedMin"] = "5%",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["url"] = "",
			["icon"] = false,
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
			["selfPoint"] = "CENTER",
			["xOffset"] = 27,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["barColor"] = {
				0, -- [1]
				0.807843137254902, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["stickyDuration"] = false,
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
			["sparkMirror"] = false,
			["version"] = 1,
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
			["sparkOffsetY"] = 0,
			["load"] = {
				["size"] = {
					["multi"] = {
						["ten"] = true,
						["arena"] = true,
						["none"] = true,
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
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["config"] = {
			},
			["source"] = "import",
			["uid"] = "eXRkZ9J5fRu",
			["desaturate"] = false,
			["customAnchor"] = "function()\n    if aura_env.state and aura_env.state.unit then\n        return C_NamePlate.GetNamePlateForUnit(aura_env.state.unit)\n    end\nend",
			["anchorFrameType"] = "SCREEN",
			["anchorFrameFrame"] = "CompactRaidFrame2",
			["regionType"] = "aurabar",
			["frameStrata"] = 1,
			["auto"] = true,
			["icon_side"] = "LEFT",
			["id"] = "UI - pet castbar bar",
			["sparkHeight"] = 40,
			["texture"] = "Blizzard",
			["semver"] = "1.0.0",
			["zoom"] = 0,
			["spark"] = true,
			["tocversion"] = 30300,
			["sparkHidden"] = "NEVER",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["alpha"] = 1,
			["width"] = 105,
			["useAdjustededMin"] = false,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["parent"] = "Water Elemental Cast Status",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["sparkOffsetX"] = 0,
		},
		["Circle Class Frame [ROGUE] 2"] = {
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
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Rogue\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Rogue",
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.8823529411764706, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [ROGUE] 2",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 95,
			["xOffset"] = 42,
			["config"] = {
			},
			["authorOptions"] = {
			},
			["uid"] = "u(LrEvkDJ3l",
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
		},
		["PW: Shield (P2)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["xOffset"] = -39,
			["preferToUpdate"] = false,
			["adjustedMin"] = "",
			["yOffset"] = 0.57,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["load"] = {
				["use_never"] = true,
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
			["sameTexture"] = true,
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
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
			["conditions"] = {
			},
			["desc"] = "Shield CD on Party2 indicator...",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["desaturateForeground"] = false,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 43,
			["authorOptions"] = {
			},
			["crop_y"] = 0.41,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["startAngle"] = 0,
			["config"] = {
			},
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-PartyFlash-Highlight_Shield",
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "progresstexture",
			["width"] = 43,
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["uid"] = "zDMEhE)lXyO",
			["slantMode"] = "INSIDE",
			["tocversion"] = 40400,
			["adjustedMax"] = "",
			["anchorFrameFrame"] = "PartyMemberFrame2",
			["mirror"] = false,
			["compress"] = false,
			["id"] = "PW: Shield (P2)",
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["auraRotation"] = 0,
			["inverse"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
			},
			["slanted"] = false,
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
		["castbar player interrupt"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
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
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["sourceUnit"] = "player",
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["debuffType"] = "HELPFUL",
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        return true\n    end \nend\n\n\n\n",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["custom_type"] = "event",
						["events"] = "UNIT_SPELLCAST_INTERRUPTED",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Spell Cast Succeeded",
						["unit"] = "player",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["custom_hide"] = "timed",
						["spellName"] = 0,
						["use_track"] = true,
						["duration"] = "0.1",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 66,
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
					["colorA"] = 1,
					["type"] = "none",
					["scaley"] = 1,
					["easeType"] = "easeIn",
					["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    return startX + (progress * deltaX), startY + (progress * deltaY)\nend\n",
					["use_color"] = false,
					["alpha"] = 0.85,
					["easeStrength"] = 3,
					["y"] = 0,
					["colorType"] = "custom",
					["translateType"] = "straightTranslate",
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["x"] = 0,
					["scalex"] = 1,
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "",
					["easeType"] = "none",
					["use_color"] = false,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
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
			["frameStrata"] = 2,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastfail.tga",
			["xOffset"] = 4,
			["rotation"] = 0,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player interrupt",
			["color"] = {
				1, -- [1]
				0.7607843875885, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "1kvdC2gSI0J",
			["config"] = {
			},
			["parent"] = "player",
			["width"] = 355,
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
			["selfPoint"] = "CENTER",
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
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Druid\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Druid",
			["anchorFrameType"] = "SELECTFRAME",
			["discrete_rotation"] = 0,
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [DRUID] 2",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 95,
			["xOffset"] = 42,
			["uid"] = "qMfPEvSCtq7",
			["config"] = {
			},
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
			["shadowYOffset"] = -1,
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
						["events"] = "MERCHANT_SHOW",
						["custom"] = "function ()\n    if aura_env.config.enable_ab then\n        aura_env.buy()\n    end\nend",
						["custom_type"] = "event",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
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
			["preferToUpdate"] = false,
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
			["displayText_format_p_time_precision"] = 1,
			["yOffset"] = 0,
			["xOffset"] = 0,
			["justify"] = "LEFT",
			["semver"] = "1.0.2",
			["tocversion"] = 30300,
			["id"] = "Autobuy",
			["uid"] = "Kxw5wrRLc3l",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["config"] = {
				["enable_ab"] = true,
				["priest"] = {
					["FA"] = 200,
					["candle"] = 200,
					["feather"] = 200,
					["watah"] = 200,
				},
				["mage"] = {
					["powder"] = 200,
					["FA"] = 200,
					["feather"] = 200,
					["watah"] = 200,
				},
				["round_up"] = true,
				["min_gold"] = 10000,
			},
			["selfPoint"] = "BOTTOM",
			["authorOptions"] = {
				{
					["type"] = "header",
					["useName"] = false,
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
					["type"] = "header",
					["useName"] = false,
					["text"] = "",
					["noMerge"] = false,
					["width"] = 1,
				}, -- [5]
				{
					["type"] = "toggle",
					["key"] = "enable_ab",
					["default"] = false,
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
					["type"] = "header",
					["useName"] = false,
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
					["name"] = "|TInterface\\Icons\\inv_staff_13:18:18:0:0:64:64:4:60:4:60|t Mage",
					["collapse"] = true,
					["type"] = "group",
					["limitType"] = "none",
					["groupType"] = "simple",
					["key"] = "mage",
					["size"] = 10,
				}, -- [11]
				{
					["type"] = "header",
					["useName"] = false,
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
							["type"] = "description",
							["text"] = "|TInterface\\Icons\\inv_misc_bandage_netherweave_heavy:18:18:0:0:64:64:4:60:4:60|t FA",
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
							["name"] = "",
							["default"] = 0,
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
			["automaticWidth"] = "Auto",
		},
		["FF Indicator (P2)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["adjustedMin"] = "",
			["yOffset"] = 0.57,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["xOffset"] = -39,
			["sameTexture"] = true,
			["desaturateForeground"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["use_debuffClass"] = false,
						["auranames"] = {
							"Faerie Fire", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
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
			["backgroundOffset"] = 2,
			["adjustedMax"] = "",
			["conditions"] = {
			},
			["desc"] = "FF Indicator (P2)",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["selfPoint"] = "CENTER",
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 39,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["load"] = {
				["use_never"] = true,
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
			["crop_y"] = 0.41,
			["useAdjustededMax"] = false,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["startAngle"] = 0,
			["config"] = {
			},
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-PartyFlash-Highlight_Renew",
			["mirror"] = false,
			["anchorFrameFrame"] = "PartyMemberFrame2",
			["regionType"] = "progresstexture",
			["anchorFrameType"] = "SELECTFRAME",
			["blendMode"] = "BLEND",
			["alpha"] = 1,
			["fontSize"] = 12,
			["slantMode"] = "INSIDE",
			["compress"] = false,
			["uid"] = "Hq7AGNLkKNn",
			["foregroundColor"] = {
				0, -- [1]
				0.8588235294117647, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["smoothProgress"] = false,
			["tocversion"] = 40400,
			["id"] = "FF Indicator (P2)",
			["useAdjustededMin"] = false,
			["frameStrata"] = 1,
			["width"] = 39,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["auraRotation"] = 0,
			["inverse"] = false,
			["backgroundColor"] = {
				0.501960813999176, -- [1]
				0.501960813999176, -- [2]
				0.501960813999176, -- [3]
				0, -- [4]
			},
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
			},
			["slanted"] = false,
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
						["events"] = "CLEU:SWING_DAMAGE, CLEU:RANGE_DAMAGE, CLEU:SPELL_DAMAGE, CLEU:SPELL_PERIODIC_DAMAGE, CLEU:SPELL_AURA_APPLIED, CLEU:SPELL_AURA_REMOVED, PLAYER_TARGET_CHANGED",
						["customDuration"] = "function()\n    if aura_env.currentAmount and aura_env.currentAmount > 0 then\n        return aura_env.currentAmount, aura_env.maxAmount, true\n    end\nend",
						["customName"] = "",
						["custom"] = "function(event)\n    local guid = UnitGUID(\"arena2\")\n    if event == \"PLAYER_TARGET_CHANGED\" then\n        if UnitIsUnit(\"target\", \"arena2\") then\n            guid = UnitGUID(\"target\")\n        else\n            guid = nil\n        end\n    end\n    \n    if guid and cacheUnit[guid] and cacheUnit[guid].feared then\n        aura_env.maxAmount = cacheUnit[guid].maxAmount\n        aura_env.currentAmount = cacheUnit[guid].currentAmount\n        aura_env.isFeared = cacheUnit[guid].feared\n        return true\n    else\n        aura_env.maxAmount = 0\n        aura_env.currentAmount = 0\n        aura_env.isFeared = false\n        return false\n    end\nend",
						["spellIds"] = {
						},
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
		["Circle Class Frame [MAGE] 2"] = {
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
						["events"] = "PLAYER_FOCUS_CHANGED",
						["spellIds"] = {
						},
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Mage\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Mage",
			["width"] = 95,
			["discrete_rotation"] = 0,
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [MAGE] 2",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.9568627450980392, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["uid"] = "r71p543s)oE",
			["authorOptions"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
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
			["id"] = "Circle Class Frames (FOCUS)",
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
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["yOffset"] = 0,
			["config"] = {
			},
			["uid"] = "9Lcfb1CqjxZ",
			["borderInset"] = 1,
			["conditions"] = {
			},
			["information"] = {
			},
			["xOffset"] = 0,
		},
		["Stealth Effect TOP"] = {
			["wagoID"] = "wdib4Sz3Z",
			["xOffset"] = 1.422279509452778,
			["preferToUpdate"] = true,
			["yOffset"] = 254.3110693432246,
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
				["use_never"] = false,
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
			["alpha"] = 1,
			["uid"] = "f8VXnRZI0Jd",
			["authorOptions"] = {
			},
			["config"] = {
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
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-Sacred Cancer",
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
			["backgroundOffset"] = 2,
			["xOffset"] = 41,
			["conditions"] = {
			},
			["desc"] = "Sacred Cancer TARGET indicator",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 66,
			["adjustedMax"] = "",
			["load"] = {
				["use_never"] = true,
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
			["selfPoint"] = "CENTER",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["startAngle"] = 0,
			["uid"] = "MLpFgYvQ9v0",
			["auraRotation"] = 0,
			["smoothProgress"] = false,
			["anchorFrameFrame"] = "TargetFrame",
			["regionType"] = "progresstexture",
			["anchorFrameType"] = "SELECTFRAME",
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["mirror"] = false,
			["slantMode"] = "INSIDE",
			["tocversion"] = 40400,
			["crop_y"] = 0.41,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["useAdjustededMin"] = false,
			["compress"] = false,
			["id"] = "Sacred Cancer (Target)",
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["alpha"] = 1,
			["width"] = 66,
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
				0.5, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["anchorPoint"] = "CENTER",
			["orientation"] = "ANTICLOCKWISE",
			["crop_x"] = 0.41,
			["information"] = {
				["forceEvents"] = true,
			},
			["slanted"] = false,
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
						["type"] = "spell",
						["use_showlossofcontrol"] = false,
						["match_count"] = "1",
						["spellName"] = 12472,
						["useName"] = true,
						["debuffType"] = "HELPFUL",
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
						["use_remaining"] = false,
						["stacksOperator"] = "<=",
						["subeventSuffix"] = "_CAST_START",
						["use_spellCount"] = false,
						["use_genericShowOn"] = true,
						["event"] = "Cooldown Progress (Spell)",
						["unit"] = "player",
						["realSpellName"] = "Icy Veins",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["useExactSpellId"] = false,
						["remOperator"] = "<=",
						["match_countOperator"] = "<",
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
			["anchorFrameFrame"] = "PlayerFrame",
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
				["use_class"] = true,
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
			["frameStrata"] = 1,
			["useAdjustededMax"] = false,
			["url"] = "",
			["source"] = "import",
			["internalVersion"] = 72,
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["displayIcon"] = 135932,
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
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["uid"] = "XXR9pwY2kqX",
			["alpha"] = 1,
			["width"] = 48,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["zoom"] = 0,
			["auto"] = true,
			["tocversion"] = 11503,
			["id"] = "VEINS CD Visual",
			["xOffset"] = -568.8888778686523,
			["useCooldownModRate"] = true,
			["anchorFrameType"] = "SCREEN",
			["desaturate"] = false,
			["config"] = {
			},
			["inverse"] = false,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
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
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["do_custom"] = false,
				},
				["finish"] = {
				},
			},
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Shaman\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Shaman",
			["width"] = 95,
			["selfPoint"] = "CENTER",
			["parent"] = "Circle Class Frames (TARGET)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [SHAMAN]",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.9882352941176471, -- [2]
				0.9568627450980392, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["uid"] = "h)25fvrrLar",
			["xOffset"] = 42,
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
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
						["useName"] = true,
						["use_showlossofcontrol"] = false,
						["match_count"] = "1",
						["subeventSuffix"] = "_CAST_START",
						["type"] = "spell",
						["spellName"] = 31687,
						["useExactSpellId"] = false,
						["use_remaining"] = false,
						["stacksOperator"] = "<=",
						["match_countOperator"] = "<",
						["use_spellCount"] = false,
						["matchesShowOn"] = "showOnMissing",
						["event"] = "Cooldown Progress (Spell)",
						["names"] = {
						},
						["realSpellName"] = "Summon Water Elemental",
						["use_spellName"] = true,
						["spellIds"] = {
						},
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
			["anchorFrameFrame"] = "PlayerFrame",
			["load"] = {
				["ingroup"] = {
				},
				["use_never"] = false,
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
				["use_class"] = true,
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
			["frameStrata"] = 1,
			["useAdjustededMax"] = false,
			["desaturate"] = false,
			["source"] = "import",
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
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["cooldownEdge"] = false,
			["config"] = {
			},
			["color"] = {
				0.984313725490196, -- [1]
				0.9725490196078431, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.5",
			["tocversion"] = 11503,
			["id"] = "Water Elemental CD Visual",
			["icon"] = true,
			["alpha"] = 1,
			["width"] = 48,
			["useCooldownModRate"] = true,
			["uid"] = "6vnX6bzrDkY",
			["inverse"] = false,
			["xOffset"] = -568.8888778686523,
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",
			["information"] = {
				["forceEvents"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["internalVersion"] = 72,
		},
		["castbar player spark"] = {
			["user_y"] = 0,
			["iconSource"] = -1,
			["user_x"] = 0,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = true,
					["key"] = "disableBlizzard",
					["useDesc"] = false,
					["name"] = "Disable Blizzard Castbar",
					["width"] = 1,
				}, -- [1]
			},
			["adjustedMax"] = "0.5",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "aura_env.castbarEvents = {\n    \"UNIT_SPELLCAST_START\",\n    \"UNIT_SPELLCAST_STOP\",\n    \"UNIT_SPELLCAST_FAILED\",\n    \"UNIT_SPELLCAST_INTERRUPTED\",\n    \"UNIT_SPELLCAST_DELAYED\",\n    \"UNIT_SPELLCAST_CHANNEL_START\",\n    \"UNIT_SPELLCAST_CHANNEL_UPDATE\",\n    \"UNIT_SPELLCAST_CHANNEL_STOP\",\n    \"PLAYER_ENTERING_WORLD\",\n}\n\nif aura_env.config.disableBlizzard then\n    \n    CastingBarFrame:UnregisterAllEvents()\nelse\n    for k,v in pairs(aura_env.castbarEvents) do\n        CastingBarFrame:RegisterEvent(v)\n    end    \n    \nend",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n",
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
						["unit"] = "player",
						["castType"] = "cast",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
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
					["scalex"] = 1,
					["scaley"] = 1,
					["easeStrength"] = 3,
					["rotate"] = 0,
					["colorB"] = 1,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["scalex"] = 1,
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["use_color"] = false,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
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
					["text_justify"] = "CENTER",
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
					["text_text_format_n_abbreviate_max"] = 30,
					["text_anchorYOffset"] = -14,
					["text_shadowYOffset"] = -1,
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
			["fontSize"] = 12,
			["sparkBlendMode"] = "BLEND",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["source"] = "import",
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["config"] = {
				["disableBlizzard"] = true,
			},
			["mirror"] = false,
			["compress"] = false,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = 4,
			["sparkWidth"] = 20,
			["icon_side"] = "LEFT",
			["anchorFrameType"] = "SCREEN",
			["backgroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["sparkHeight"] = 24,
			["icon"] = false,
			["sparkHidden"] = "NEVER",
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
			["semver"] = "1.0.13",
			["uid"] = "E3Nh9(gAG1l",
			["id"] = "castbar player spark",
			["startAngle"] = 0,
			["frameStrata"] = 2,
			["width"] = 207,
			["preferToUpdate"] = true,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["zoom"] = 0,
			["orientation"] = "HORIZONTAL",
			["crop_x"] = 0.7,
			["information"] = {
			},
			["slanted"] = false,
		},
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
						["names"] = {
						},
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
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
			["id"] = "Circle Class Frames (TARGET)",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["groupIcon"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Mage",
			["borderInset"] = 1,
			["uid"] = "qZaXlWpR3as",
			["config"] = {
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
		["Circle Class Frame [WARRIOR] 2"] = {
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
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Warrior\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Warrior",
			["width"] = 95,
			["authorOptions"] = {
			},
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [WARRIOR] 2",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["xOffset"] = 42,
			["uid"] = "qQyU9Qhpyxa",
			["color"] = {
				1, -- [1]
				0.9686274509803922, -- [2]
				0.9725490196078431, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
		},
		["Water Elemental Duration"] = {
			["iconSource"] = 0,
			["authorOptions"] = {
			},
			["yOffset"] = -2,
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
						["spellId"] = "31687",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["duration"] = "45",
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
			["anchorFrameFrame"] = "PetFrame",
			["regionType"] = "icon",
			["selfPoint"] = "CENTER",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["information"] = {
			},
			["conditions"] = {
			},
			["zoom"] = 0.2099999934434891,
			["icon"] = true,
			["frameStrata"] = 1,
			["id"] = "Water Elemental Duration",
			["uid"] = "lkGdLzT6(7M",
			["alpha"] = 1,
			["width"] = 30,
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = 72,
			["displayIcon"] = "Interface\\Icons\\Spell_Frost_SummonWaterElemental_2",
			["cooldown"] = false,
			["useTooltip"] = false,
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
						["custom"] = "function(event)\n    local guid = UnitGUID(\"arena1\")\n    if event == \"PLAYER_TARGET_CHANGED\" then\n        if UnitIsUnit(\"target\", \"arena1\") then\n            guid = UnitGUID(\"target\")\n        else\n            guid = nil\n        end\n    end\n    \n    if guid and cacheUnit[guid] and cacheUnit[guid].feared then\n        aura_env.maxAmount = cacheUnit[guid].maxAmount\n        aura_env.currentAmount = cacheUnit[guid].currentAmount\n        aura_env.isFeared = cacheUnit[guid].feared\n        return true\n    else\n        aura_env.maxAmount = 0\n        aura_env.currentAmount = 0\n        aura_env.isFeared = false\n        return false\n    end\nend",
						["customDuration"] = "function()\n    if aura_env.currentAmount and aura_env.currentAmount > 0 then\n        return aura_env.currentAmount, aura_env.maxAmount, true\n    end\nend",
						["customName"] = "",
						["spellIds"] = {
						},
						["events"] = "CLEU:SWING_DAMAGE, CLEU:RANGE_DAMAGE, CLEU:SPELL_DAMAGE, CLEU:SPELL_PERIODIC_DAMAGE, CLEU:SPELL_AURA_APPLIED, CLEU:SPELL_AURA_REMOVED, PLAYER_TARGET_CHANGED",
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
		["Circle Class Frame [HUNTER] 2"] = {
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
						["events"] = "PLAYER_FOCUS_CHANGED",
						["spellIds"] = {
						},
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Hunter\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Hunter",
			["width"] = 95,
			["xOffset"] = 42,
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [HUNTER] 2",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				0.5882352941176471, -- [1]
				1, -- [2]
				0.6352941176470588, -- [3]
				1, -- [4]
			},
			["uid"] = "TI5L9PmeJeh",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
		},
		["Invis additional visual"] = {
			["controlledChildren"] = {
				"Stealth Effect TOP", -- [1]
				"Stealth Effect BOTTOM", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["wagoID"] = "wdib4Sz3Z",
			["xOffset"] = -53.37686846760812,
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
			["alpha"] = 1,
			["borderOffset"] = 4,
			["semver"] = "1.0.1",
			["tocversion"] = 30300,
			["id"] = "Invis additional visual",
			["yOffset"] = -94.66684711779584,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["selfPoint"] = "CENTER",
			["config"] = {
			},
			["borderInset"] = 1,
			["uid"] = "vQTq0ZuVxji",
			["conditions"] = {
			},
			["information"] = {
				["forceEvents"] = true,
			},
			["authorOptions"] = {
			},
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Rogue\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Rogue",
			["frameStrata"] = 1,
			["xOffset"] = 42,
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [ROGUE]",
			["parent"] = "Circle Class Frames (TARGET)",
			["alpha"] = 1,
			["width"] = 95,
			["uid"] = "0CRscaaoT(h",
			["config"] = {
			},
			["anchorFrameType"] = "SELECTFRAME",
			["color"] = {
				1, -- [1]
				0.8823529411764706, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
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
						["custom"] = "function()\n    if UnitExists(\"target\") and UnitClass(\"target\") == \"Paladin\" then\n        return true\n    else\n        return false\n    end\nend",
						["events"] = "PLAYER_TARGET_CHANGED",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Paladin",
			["alpha"] = 1,
			["xOffset"] = 42,
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
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PALADIN]",
			["parent"] = "Circle Class Frames (TARGET)",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["config"] = {
			},
			["uid"] = "rIoSAeOj6u0",
			["width"] = 95,
			["color"] = {
				1, -- [1]
				0.9254901960784314, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
		},
		["Stealth Effect BOTTOM"] = {
			["wagoID"] = "wdib4Sz3Z",
			["xOffset"] = 31.99932816375952,
			["preferToUpdate"] = true,
			["yOffset"] = 76.57779421199126,
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
				["use_never"] = false,
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
			["alpha"] = 1,
			["uid"] = "kBbzhHWQpyL",
			["authorOptions"] = {
			},
			["config"] = {
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
		["Circle Class Frame [SHAMAN] 2"] = {
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
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Shaman\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Shaman",
			["anchorFrameType"] = "SELECTFRAME",
			["discrete_rotation"] = 0,
			["parent"] = "Circle Class Frames (FOCUS)",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [SHAMAN] 2",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 95,
			["xOffset"] = 42,
			["uid"] = "C3fWdU(hE3k",
			["config"] = {
			},
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
		["castbar player end text"] = {
			["outline"] = "OUTLINE",
			["wagoID"] = "Yjx7bHW6u",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["preferToUpdate"] = true,
			["shadowYOffset"] = -1,
			["anchorPoint"] = "CENTER",
			["displayText_format_n_abbreviate_max"] = 30,
			["displayText_format_p_time_format"] = 0,
			["customTextUpdate"] = "event",
			["automaticWidth"] = "Auto",
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
						["type"] = "custom",
						["custom_type"] = "event",
						["custom_hide"] = "timed",
						["duration"] = "0.1",
						["event"] = "Chat Message",
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["customName"] = "function()\n    return aura_env.text\nend",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["events"] = "CAST_FINISHED",
						["names"] = {
						},
						["custom"] = "function(event, text)\n    if event == \"CAST_FINISHED\" then\n        aura_env.text = text\n        return true\n    end\nend\n\n\n",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["displayText_format_p_time_mod_rate"] = true,
			["displayText_format_p_time_legacy_floor"] = false,
			["selfPoint"] = "CENTER",
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
			["uid"] = "(OW98pPw5Xo",
			["fontSize"] = 12,
			["source"] = "import",
			["displayText_format_n_format"] = "string",
			["shadowXOffset"] = 1,
			["xOffset"] = 4,
			["url"] = "",
			["regionType"] = "text",
			["fixedWidth"] = 200,
			["displayText_format_p_format"] = "timed",
			["yOffset"] = -14,
			["authorOptions"] = {
			},
			["displayText_format_p_time_precision"] = 1,
			["parent"] = "player",
			["displayText_format_p_time_dynamic_threshold"] = 60,
			["justify"] = "CENTER",
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player end text",
			["internalVersion"] = 66,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
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
					["colorR"] = 1,
					["duration"] = "",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["scalex"] = 1,
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["use_color"] = false,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
			["config"] = {
			},
			["displayText"] = "%n",
			["displayText_format_n_abbreviate"] = true,
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
			["wordWrap"] = "WordWrap",
		},
		["castbar player back end"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = 0,
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
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["sourceUnit"] = "player",
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["debuffType"] = "HELPFUL",
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["custom_type"] = "event",
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Spell Cast Succeeded",
						["unit"] = "player",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["custom_hide"] = "timed",
						["spellName"] = 0,
						["use_track"] = true,
						["duration"] = "0.1",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
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
					["colorA"] = 1,
					["scaley"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "",
					["easeType"] = "none",
					["use_color"] = false,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
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
			["frameStrata"] = 2,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcast.tga",
			["xOffset"] = 4,
			["rotation"] = 0,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back end",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "iN4BrN2CQJ6",
			["config"] = {
			},
			["parent"] = "player",
			["width"] = 355,
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
			["selfPoint"] = "CENTER",
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
			["icon"] = false,
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
			["crop_y"] = 0.72,
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
						["unit"] = "player",
						["castType"] = "channel",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["use_unit"] = true,
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
						["unit"] = "player",
						["type"] = "custom",
						["custom"] = "\n\nfunction(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_CHANNEL_START\" then\n        return true\n    end\nend",
						["custom_type"] = "event",
						["custom_hide"] = "timed",
						["duration"] = "0.1",
						["events"] = "UNIT_SPELLCAST_CHANNEL_START",
						["debuffType"] = "HELPFUL",
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
					["colorA"] = 1,
					["scaley"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "preset",
					["scalex"] = 1,
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["use_color"] = false,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
			["discrete_rotation"] = 0,
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
					["text_justify"] = "CENTER",
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
					["text_text_format_n_abbreviate_max"] = 30,
					["text_anchorYOffset"] = -14,
					["text_shadowYOffset"] = -1,
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
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sparkBlendMode"] = "BLEND",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["source"] = "import",
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
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n",
					["do_custom"] = false,
				},
			},
			["anchorPoint"] = "CENTER",
			["mirror"] = false,
			["tocversion"] = 30402,
			["user_y"] = 0,
			["auraRotation"] = 0,
			["anchorFrameType"] = "SCREEN",
			["icon_side"] = "LEFT",
			["config"] = {
			},
			["authorOptions"] = {
			},
			["sparkHeight"] = 35,
			["id"] = "castbar player channel start",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["adjustedMax"] = "0.5",
			["semver"] = "1.0.13",
			["fontSize"] = 12,
			["sparkHidden"] = "NEVER",
			["parent"] = "castbar player group",
			["frameStrata"] = 2,
			["width"] = 252,
			["sparkTexture"] = "Interface\\Addons\\aTextures\\spark.tga",
			["foregroundTexture"] = "Interface\\Addons\\aTextures\\blizzcast.tga",
			["inverse"] = false,
			["backgroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["orientation"] = "HORIZONTAL",
			["crop_x"] = 0.7,
			["information"] = {
			},
			["slanted"] = false,
		},
		["castbar player channel"] = {
			["user_y"] = 0,
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
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n",
					["do_custom"] = false,
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
						["unit"] = "player",
						["castType"] = "channel",
						["use_spellId"] = false,
						["spellIds"] = {
						},
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
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
					["colorA"] = 1,
					["scaley"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["scalex"] = 1,
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["use_color"] = false,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
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
					["text_justify"] = "CENTER",
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
					["text_text_format_n_abbreviate_max"] = 30,
					["text_anchorYOffset"] = -14,
					["text_shadowYOffset"] = -1,
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
			["sparkBlendMode"] = "BLEND",
			["useAdjustededMax"] = false,
			["fontSize"] = 12,
			["source"] = "import",
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<",
						["variable"] = "expirationTime",
						["value"] = "0.2",
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
			["backgroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
			},
			["mirror"] = false,
			["adjustedMax"] = "0.5",
			["anchorPoint"] = "CENTER",
			["compress"] = false,
			["sparkWidth"] = 10,
			["icon_side"] = "LEFT",
			["width"] = 207,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 10,
			["icon"] = false,
			["sparkHidden"] = "EMPTY",
			["uid"] = "kFK(6yDsl0o",
			["semver"] = "1.0.13",
			["config"] = {
			},
			["id"] = "castbar player channel",
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["authorOptions"] = {
			},
			["inverse"] = false,
			["foregroundTexture"] = "Interface\\Addons\\aTextures\\blizzcast.tga",
			["orientation"] = "HORIZONTAL",
			["crop_x"] = 0.7,
			["information"] = {
			},
			["slanted"] = false,
		},
		["Circle Class Frame [PALADIN] 2"] = {
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
						["events"] = "PLAYER_FOCUS_CHANGED",
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Paladin\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Paladin",
			["width"] = 95,
			["color"] = {
				1, -- [1]
				0.9254901960784314, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["discrete_rotation"] = 0,
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PALADIN] 2",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SELECTFRAME",
			["xOffset"] = 42,
			["uid"] = "hZI1fzlp1If",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["conditions"] = {
			},
			["information"] = {
			},
			["selfPoint"] = "CENTER",
		},
		["castbar player back end text"] = {
			["wagoID"] = "Yjx7bHW6u",
			["authorOptions"] = {
			},
			["preferToUpdate"] = true,
			["yOffset"] = -8,
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
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showOnCooldown",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["sourceUnit"] = "player",
						["use_unit"] = true,
						["use_absorbMode"] = true,
						["debuffType"] = "HELPFUL",
						["custom"] = "function(event, unitId, _, spellId)\n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_START\" then\n        aura_env.isCasted = true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_SUCCEEDED\" and aura_env.isCasted == true then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_INTERRUPTED\" then\n        aura_env.isCasted = false\n        return true\n    end \n    if unitId == \"player\" and event == \"UNIT_SPELLCAST_FAILED\" then\n        aura_env.isCasted = false\n    end \nend",
						["type"] = "custom",
						["use_absorbHealMode"] = true,
						["custom_type"] = "event",
						["events"] = "UNIT_SPELLCAST_START, UNIT_SPELLCAST_SUCCEEDED, UNIT_SPELLCAST_INTERRUPTED, UNIT_SPELLCAST_FAILED",
						["subeventSuffix"] = "_CAST_SUCCESS",
						["event"] = "Spell Cast Succeeded",
						["unit"] = "player",
						["realSpellName"] = 0,
						["use_spellName"] = false,
						["spellIds"] = {
						},
						["use_sourceUnit"] = true,
						["custom_hide"] = "timed",
						["spellName"] = 0,
						["use_track"] = true,
						["duration"] = "0.1",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
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
					["colorA"] = 1,
					["scaley"] = 1,
					["rotate"] = 0,
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["easeType"] = "none",
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["colorR"] = 1,
					["scalex"] = 1,
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["duration"] = "",
					["easeType"] = "none",
					["use_color"] = false,
					["scaley"] = 1,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["preset"] = "fade",
					["duration_type"] = "seconds",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
				},
			},
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
			["frameStrata"] = 2,
			["texture"] = "Interface\\Addons\\TextureScript\\CastBar\\blizzcastbacktext.tga",
			["xOffset"] = 4,
			["rotation"] = 0,
			["semver"] = "1.0.13",
			["tocversion"] = 30402,
			["id"] = "castbar player back end text",
			["color"] = {
				1, -- [1]
				0.7607843875885, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "qDblFlZiAD5",
			["config"] = {
			},
			["parent"] = "player",
			["width"] = 355,
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
			["selfPoint"] = "CENTER",
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
						["spellIds"] = {
						},
						["customDuration"] = "function()\n    if aura_env.currentAmount and aura_env.currentAmount > 0 then\n        return aura_env.currentAmount, aura_env.maxAmount, true\n    end\nend",
						["customName"] = "",
						["events"] = "CLEU:SWING_DAMAGE, CLEU:RANGE_DAMAGE, CLEU:SPELL_DAMAGE, CLEU:SPELL_PERIODIC_DAMAGE, CLEU:SPELL_AURA_APPLIED, CLEU:SPELL_AURA_REMOVED, PLAYER_TARGET_CHANGED",
						["custom"] = "function(event)\n    local guid = UnitGUID(\"arena3\")\n    if event == \"PLAYER_TARGET_CHANGED\" then\n        if UnitIsUnit(\"target\", \"arena3\") then\n            guid = UnitGUID(\"target\")\n        else\n            guid = nil\n        end\n    end\n    \n    if guid and cacheUnit[guid] and cacheUnit[guid].feared then\n        aura_env.maxAmount = cacheUnit[guid].maxAmount\n        aura_env.currentAmount = cacheUnit[guid].currentAmount\n        aura_env.isFeared = cacheUnit[guid].feared\n        return true\n    else\n        aura_env.maxAmount = 0\n        aura_env.currentAmount = 0\n        aura_env.isFeared = false\n        return false\n    end\nend",
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
		["AllianceProgressBar"] = {
			["sparkWidth"] = 15,
			["iconSource"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sameTexture"] = true,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "WorldStateAlwaysUpFrame:Hide()",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "WorldStateAlwaysUpFrame:Show()",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "local aura_env = aura_env;\nlocal region = aura_env.region;\n\nlocal C_Map = {};\nlocal C_PvP = {};\n\nC_Map[\"ArathiBasin\"] = {\n    progress = 3,\n    index = 1, \n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"AlteracValley\"] = {\n    progress = 3,\n    index = 1,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 600\n};\n\nC_Map[\"IsleofConquest\"] = {\n    progress = 3,\n    index = 1,\n    curr = 3,\n    find = \"(%d+)\",\n    total = 300\n};\n\nC_Map[\"NetherstormArena\"] = {\n    progress = 3,\n    index = 2,\n    curr = 4,\n    find = \"(%d+)[^%d]+(%d+)[^%d]+(%d+)\",\n    total = 2000\n};\n\nC_Map[\"WarsongGulch\"] = {\n    progress = 3,\n    index = 2,\n    curr = 3,\n    find = \"(%d+)[^%d]+(%d+)\",\n    total = 3\n};\n\nfunction C_PvP.IsPvPMap()\n    local inInstance, instanceType = IsInInstance()\n    if ( not inInstance ) then\n        return;\n    end\n    \n    return instanceType == \"pvp\" or instanceType == \"arena\";\nend\n\nfunction aura_env:OnEvent(event, ...)\n    \n    if ( not C_PvP.IsPvPMap() ) then\n        return false;\n    end\n    \n    local mapFileName = GetMapInfo();\n    \n    if ( C_Map[mapFileName] ) then\n        RequestBattlefieldScoreData()\n        \n        local number = C_Map[mapFileName]\n        local progress = select(number.progress,GetWorldStateUIInfo(number.index))\n        local curr  = select(number.curr, progress:find(number.find)) \n        \n        aura_env.zone  = mapFileName\n        aura_env.value = tonumber(curr)\n        aura_env.total = number.total\n        \n        return true\n    end\n    \nend\n-----------------------------------------------------------------------------------------------------\n\nlocal frame = WeakAuras.regions[aura_env.id].region;\n\nif ( not frame.texture ) then\n    local texture = CreateFrame(\"Frame\", nil, frame);\n    texture:SetFrameStrata(\"MEDIUM\") ;\n    frame.texture = texture;\n    frame.texture = frame.texture:CreateTexture(nil, \"Texture\");\n    frame.texture:SetTexture([[Interface\\Timer\\Alliance-Logo]]);\nend \n\nframe.texture:SetPoint(\"RIGHT\", frame, \"LEFT\", region:GetHeight() / 1.6, 0);\nframe.texture:SetSize(region:GetHeight() * 2.3, region:GetHeight() * 2.3);\n\n-----------------------------------------------------------------------------------------------------\n\naura_env.value, aura_env.total = math.random(400, 1400), 1600;",
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
			["desc"] = "Author: RomanSpector\nDiscord: https://discord.com/invite/Fm9kgfk\n",
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
						["debuffType"] = "HELPFUL",
						["custom_type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["genericShowOn"] = "showOnActive",
						["event"] = "Health",
						["unit"] = "player",
						["customDuration"] = "function()    \n    return aura_env.value, aura_env.total, true      \nend",
						["custom"] = "function(event, ...)\n    return aura_env:OnEvent(event, ...)\nend",
						["spellIds"] = {
						},
						["events"] = "UPDATE_WORLD_STATES CHAT_MSG_BATTLEGROUND CHAT_MSG_BATTLEGROUND_LEADER CHAT_MSG_BG_SYSTEM_NEUTRAL CHAT_MSG_BG_SYSTEM_ALLIANCE CHAT_MSG_BG_SYSTEM_HORDE UPDATE_BATTLEFIELD_SCORE",
						["check"] = "event",
						["names"] = {
						},
						["subeventPrefix"] = "SPELL",
						["custom_hide"] = "timed",
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
					["easeStrength"] = 3,
					["type"] = "none",
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
					["duration"] = "1",
					["type"] = "none",
					["scaleType"] = "straightScale",
					["easeType"] = "none",
					["translateFunc"] = "",
					["scaley"] = 1,
					["alpha"] = 0,
					["rotate"] = 0,
					["y"] = 0,
					["x"] = 0,
					["translateType"] = "custom",
					["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      return startX + (progress * (scaleX - startX)), startY + (progress * (scaleY - startY))\n    end\n  ",
					["use_scale"] = false,
					["easeStrength"] = 3,
					["scalex"] = 1,
					["colorB"] = 1,
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
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
					["text_visible"] = true,
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_text_format_c_format"] = "none",
				}, -- [3]
				{
					["type"] = "subborder",
					["border_offset"] = 5,
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
					["border_size"] = 20,
				}, -- [4]
			},
			["height"] = 25,
			["customTextUpdate"] = "event",
			["desaturate"] = false,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\SpellActivationOverlays\\Eclipse_Sun",
			["source"] = "import",
			["conditions"] = {
			},
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.80000001192093, -- [4]
			},
			["useAdjustedMax"] = false,
			["mirror"] = false,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["zoom"] = 0,
			["borderInFront"] = true,
			["xOffset"] = -60,
			["icon_side"] = "RIGHT",
			["borderBackdrop"] = "None",
			["width"] = 100,
			["sparkHeight"] = 60,
			["icon"] = false,
			["user_y"] = 0,
			["id"] = "AllianceProgressBar",
			["semver"] = "2.0.0",
			["backdropColor"] = {
				[4] = 0,
			},
			["sparkHidden"] = "NEVER",
			["compress"] = false,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
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
				["ingroup"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["single"] = "pvp",
					["multi"] = {
					},
				},
			},
			["uid"] = "BzfZ6IjnWwh",
			["inverse"] = false,
			["spark"] = true,
			["orientation"] = "HORIZONTAL",
			["crop_x"] = 0.41,
			["information"] = {
				["ignoreOptionsEventErrors"] = true,
			},
			["config"] = {
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
						["custom"] = "function()\n    if UnitExists(\"focus\") and UnitClass(\"focus\") == \"Priest\" then\n        return true\n    else\n        return false\n    end\nend",
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
			["texture"] = "Interface\\Addons\\TextureScript\\ClassCircleFrame\\Priest",
			["anchorFrameType"] = "SELECTFRAME",
			["authorOptions"] = {
			},
			["selfPoint"] = "CENTER",
			["tocversion"] = 30300,
			["id"] = "Circle Class Frame [PRIEST] 2",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["width"] = 95,
			["xOffset"] = 42,
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				0.9568627450980392, -- [2]
				0.9607843137254902, -- [3]
				1, -- [4]
			},
			["uid"] = "xIPPOvJrN1V",
			["conditions"] = {
			},
			["information"] = {
			},
			["discrete_rotation"] = 0,
		},
		["FF Indicator (P1)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["authorOptions"] = {
			},
			["preferToUpdate"] = false,
			["adjustedMin"] = "",
			["yOffset"] = 0.57,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["mirror"] = false,
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
						["use_debuffClass"] = false,
						["subeventSuffix"] = "_CAST_START",
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auranames"] = {
							"Faerie Fire", -- [1]
						},
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
			["crop_x"] = 0.41,
			["desc"] = "FF Indicator (P1)",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["xOffset"] = -39,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 39,
			["backgroundColor"] = {
				0.501960813999176, -- [1]
				0.501960813999176, -- [2]
				0.501960813999176, -- [3]
				0, -- [4]
			},
			["load"] = {
				["use_never"] = true,
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
			["crop_y"] = 0.41,
			["useAdjustededMax"] = false,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["source"] = "import",
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-PartyFlash-Highlight_Renew",
			["config"] = {
			},
			["startAngle"] = 0,
			["smoothProgress"] = false,
			["anchorFrameFrame"] = "PartyMemberFrame1",
			["regionType"] = "progresstexture",
			["anchorFrameType"] = "SELECTFRAME",
			["blendMode"] = "BLEND",
			["frameStrata"] = 1,
			["auraRotation"] = 0,
			["slantMode"] = "INSIDE",
			["compress"] = false,
			["foregroundColor"] = {
				0, -- [1]
				0.8588235294117647, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturateForeground"] = false,
			["useAdjustededMin"] = false,
			["tocversion"] = 40400,
			["id"] = "FF Indicator (P1)",
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["alpha"] = 1,
			["width"] = 39,
			["fontSize"] = 12,
			["uid"] = "qNFOL)6H20f",
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
		["PW: Shield (P1)"] = {
			["user_y"] = 0,
			["user_x"] = 0,
			["xOffset"] = -39,
			["preferToUpdate"] = false,
			["adjustedMin"] = "",
			["yOffset"] = 0.57,
			["anchorPoint"] = "CENTER",
			["desaturateBackground"] = false,
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
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
			["slanted"] = false,
			["selfPoint"] = "CENTER",
			["crop_x"] = 0.41,
			["desc"] = "Shield CD on Party1 indicator...",
			["rotation"] = 0,
			["font"] = "Friz Quadrata TT",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
			},
			["height"] = 43,
			["adjustedMax"] = "",
			["crop_y"] = 0.41,
			["authorOptions"] = {
			},
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
			["source"] = "import",
			["startAngle"] = 0,
			["uid"] = "nD2epxy)96V",
			["foregroundTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\UI-PartyFlash-Highlight_Shield",
			["mirror"] = false,
			["anchorFrameFrame"] = "PartyMemberFrame1",
			["regionType"] = "progresstexture",
			["anchorFrameType"] = "SELECTFRAME",
			["blendMode"] = "BLEND",
			["alpha"] = 1,
			["config"] = {
			},
			["slantMode"] = "INSIDE",
			["tocversion"] = 40400,
			["load"] = {
				["use_never"] = true,
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
			["smoothProgress"] = false,
			["useAdjustededMin"] = false,
			["compress"] = false,
			["id"] = "PW: Shield (P1)",
			["fontSize"] = 12,
			["frameStrata"] = 1,
			["width"] = 43,
			["textureWrapMode"] = "CLAMPTOBLACKADDITIVE",
			["auraRotation"] = 0,
			["inverse"] = false,
			["backgroundColor"] = {
				0.5, -- [1]
				0.5, -- [2]
				0.5, -- [3]
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
		["castbar player"] = {
			["sparkWidth"] = 30,
			["iconSource"] = -1,
			["user_x"] = 0,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = true,
					["key"] = "disableBlizzard",
					["useDesc"] = false,
					["name"] = "Disable Blizzard Castbar",
					["width"] = 1,
				}, -- [1]
			},
			["adjustedMax"] = "0.5",
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
			["crop_y"] = 0.72,
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
						["use_unit"] = true,
						["subeventPrefix"] = "SPELL",
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
					["scalex"] = 1,
					["scaley"] = 1,
					["easeStrength"] = 3,
					["rotate"] = 0,
					["colorB"] = 1,
					["duration_type"] = "seconds",
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
					["scaley"] = 1,
					["use_color"] = false,
					["alpha"] = 0,
					["colorType"] = "custom",
					["y"] = 0,
					["x"] = 0,
					["easeStrength"] = 3,
					["preset"] = "alphaPulse",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["scalex"] = 1,
					["colorA"] = 1,
				},
				["finish"] = {
					["colorR"] = 1,
					["duration"] = "",
					["colorA"] = 1,
					["colorG"] = 1,
					["type"] = "none",
					["scalex"] = 1,
					["easeType"] = "none",
					["duration_type"] = "seconds",
					["use_color"] = false,
					["alpha"] = 0,
					["easeStrength"] = 3,
					["y"] = 0,
					["x"] = 0,
					["scaley"] = 1,
					["preset"] = "fade",
					["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
					["rotate"] = 0,
					["colorType"] = "straightColor",
					["colorB"] = 1,
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
					["text_justify"] = "CENTER",
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
					["text_text_format_n_abbreviate_max"] = 30,
					["text_anchorYOffset"] = -14,
					["text_shadowYOffset"] = -1,
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
			["tocversion"] = 30402,
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["backgroundTexture"] = "Interface\\Addons\\aTextures\\blizzcastback.tga",
			["source"] = "import",
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
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
			["mirror"] = false,
			["sparkColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
					["custom"] = "aura_env.castbarEvents = {\n    \"UNIT_SPELLCAST_START\",\n    \"UNIT_SPELLCAST_STOP\",\n    \"UNIT_SPELLCAST_FAILED\",\n    \"UNIT_SPELLCAST_INTERRUPTED\",\n    \"UNIT_SPELLCAST_DELAYED\",\n    \"UNIT_SPELLCAST_CHANNEL_START\",\n    \"UNIT_SPELLCAST_CHANNEL_UPDATE\",\n    \"UNIT_SPELLCAST_CHANNEL_STOP\",\n    \"PLAYER_ENTERING_WORLD\",\n}\n\naura_env.opacity = 0\n\nif aura_env.config.disableBlizzard then\n    \n    CastingBarFrame:UnregisterAllEvents()\nelse\n    for k,v in pairs(aura_env.castbarEvents) do\n        CastingBarFrame:RegisterEvent(v)\n    end    \n    \nend",
					["do_custom"] = true,
				},
				["finish"] = {
					["custom"] = "WeakAuras.ScanEvents(\"CAST_FINISHED\", aura_env.state.name)\n\naura_env.opacity = 0",
					["do_custom"] = true,
				},
			},
			["preferToUpdate"] = true,
			["user_y"] = 0,
			["icon_side"] = "LEFT",
			["width"] = 207,
			["xOffset"] = 4,
			["sparkHeight"] = 10,
			["icon"] = false,
			["id"] = "castbar player",
			["auraRotation"] = 0,
			["semver"] = "1.0.13",
			["uid"] = "aFjHmrTgvjT",
			["sparkHidden"] = "NEVER",
			["fontSize"] = 12,
			["frameStrata"] = 2,
			["anchorFrameType"] = "SCREEN",
			["foregroundColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkTexture"] = "Interface\\Addons\\TextureScript\\CastBar\\sparkglow.tga",
			["inverse"] = false,
			["foregroundTexture"] = "Interface\\Addons\\aTextures\\blizzcast.tga",
			["orientation"] = "HORIZONTAL",
			["crop_x"] = 0.7,
			["information"] = {
			},
			["slanted"] = false,
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
		["xOffset"] = -287.9574686080346,
		["yOffset"] = -31.17712315536539,
		["height"] = 665.0000550517277,
		["width"] = 830.0000244826317,
	},
	["editor_theme"] = "Monokai",
}
