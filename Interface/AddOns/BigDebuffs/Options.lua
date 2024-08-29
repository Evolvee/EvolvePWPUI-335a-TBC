local BigDebuffs = LibStub("AceAddon-3.0"):GetAddon("BigDebuffs")
local L = LibStub("AceLocale-3.0"):GetLocale("BigDebuffs")

local AceDialog

local select, pairs = select, pairs
local GetSpellInfo = GetSpellInfo

local SML

local order = {
	immunities = 1,
	cc = 2,
	silence = 3,
	interrupts = 4,
	roots = 5,
	disarm = 6,
	buffs_defensive = 7,
	buffs_offensive = 8,
	buffs_other = 9,
	snare = 10,
}

local SpellNames = {}
local SpellIcons = {}
local Spells = {}

for spellID, spell in pairs(BigDebuffs.Spells) do
	if not spell.parent then
		Spells[spell.type] = Spells[spell.type] or {
			name = L[spell.type],
			type = "group",
			order = order[spell.type],
			args = {},
		}
		local key = "spell" .. spellID
		Spells[spell.type].args[key] = {
			type = "group",
			get = function(info)
				local name = info[#info]
				return BigDebuffs.db.profile.spells[spellID] and BigDebuffs.db.profile.spells[spellID][name]
			end,
			set = function(info, value)
				local name = info[#info]
				BigDebuffs.db.profile.spells[spellID] = BigDebuffs.db.profile.spells[spellID] or {}
				BigDebuffs.db.profile.spells[spellID][name] = value
				BigDebuffs:Refresh()
			end,
			name = function(info) local name = SpellNames[spellID] or GetSpellInfo(spellID) or spellID SpellNames[spellID] = name return name end,
			icon = function() local icon = SpellIcons[spellID] or select(3,GetSpellInfo(spellID)) SpellIcons[spellID] = icon return icon end,
			desc = function() local extra = "|cffFFD100Parent Spell ID: |r" .. spellID return extra end,
			args = {
				visibility = {
					order = 1,
					type = "group",
					name = L["Visibility"],
					inline = true,
					get = function(info)
						local name = info[#info]
						local value = (BigDebuffs.db.profile.spells[spellID] and BigDebuffs.db.profile.spells[spellID][name]) or
							(not BigDebuffs.Spells[spellID]["no"..name] and 1)
						return value and value == 1
					end,
					set = function(info, value)
						local name = info[#info]
						BigDebuffs.db.profile.spells[spellID] = BigDebuffs.db.profile.spells[spellID] or {}
						value = value and 1 or 0
						BigDebuffs.db.profile.spells[spellID][name] = value

						-- unset if default visibility
						local no = BigDebuffs.Spells[spellID]["no"..name]
						if (value == 1 and not no) or
							(value == 0 and no) then
							BigDebuffs.db.profile.spells[spellID][name] = nil
						end
						BigDebuffs:Refresh()
					end,
					args = {
						unitFrames = {
							type = "toggle",
							name = L["Enabled"],
							desc = L["Show this spell on the unit frames"],
							width = "normal",
							order = 2
						},
					},
				},
				priority = {
					type = "group",
					inline = true,
					name = L["Spell Priority"],
					args = {
						customPriority = {
							name = L["Custom Priority"],
							type = "toggle",
							order = 2,
							set = function(info, value)
								BigDebuffs.db.profile.spells[spellID] = BigDebuffs.db.profile.spells[spellID] or {}
								BigDebuffs.db.profile.spells[spellID].customPriority = value
								if not value then
									BigDebuffs.db.profile.spells[spellID].priority = nil
								end
								BigDebuffs:Refresh()
							end,
						},
						priority = {
							name = L["Priority"],
							desc = L["Higher priority spells will take precedence regardless of duration"],
							type = "range",
							min = 1,
							max = 100,
							step = 1,
							order = 3,
							disabled = function() return not BigDebuffs.db.profile.spells[spellID] or not BigDebuffs.db.profile.spells[spellID].customPriority end,
							get = function(info)
								-- Pull the category priority
								return BigDebuffs.db.profile.spells[spellID] and BigDebuffs.db.profile.spells[spellID].priority and
									BigDebuffs.db.profile.spells[spellID].priority or
									BigDebuffs.db.profile.priority[spell.type]
							end,
						},
					},
				},
			},
		}
	end
end

function BigDebuffs:SetupOptions()

	SML = SML or LibStub:GetLibrary("LibSharedMedia-3.0")
	local MediaList = {}

	local function getMediaData(info)
		local mediaType = info[#(info)]

		MediaList[mediaType] = MediaList[mediaType] or {}

		for k in pairs(MediaList[mediaType]) do	MediaList[mediaType][k] = nil end

		for _, name in pairs(SML:List(mediaType)) do
			MediaList[mediaType][name] = name
		end

		return MediaList[mediaType]
	end

	self.options = {
		name = "BigDebuffs",
		descStyle = "inline",
		type = "group",
		plugins = {},
		childGroups = "tab",
		args = {
			--[[vers = {
				order = 1,
				type = "description",
				name = "|cffffd700 "..L["Version"].."|r "..GetAddOnMetadata("BigDebuffs", "Version").."\n",
				cmdHidden = true
			},
			desc = {
				order = 2,
				type = "description",
				name = "|cffffd700 "..L["Author"].."|r Jordon, WotLK backport by Konjunktur, modify by Friskes.\n",
				cmdHidden = true
			},]]
			test = {
				type = "execute",
				name = L["Toggle Test Mode"],
				order = 3,
				func = "Test",
				handler = BigDebuffs,
			},
			unitFrames = {
				name = L["Display setting"],
				type = "group",
				order = 20,
				disabled = function(info) return info[2] and not self.db.profile[info[1]].enabled end,
				childGroups = "tab",
				get = function(info) local name = info[#info] return self.db.profile.unitFrames[name] end,
				set = function(info, value) local name = info[#info] self.db.profile.unitFrames[name] = value self:Refresh() end,
				args = {
					general = {
						name = L["General"],
						type = "group",
						order = 10,
						inline = true,
						args = {
							enabled = {
								type = "toggle",
								disabled = false,
								width = "normal",
								name = L["Enabled BigDebuffs"],
								desc = L["Enable BigDebuffs on unit frames"],
								order = 1,
							},
							circleCooldown = {
								type = "toggle",
								width = "normal",
								name = L["Circle Cooldown Texture"],
								desc = L["Show circle cooldown texture on the icons"],
								order = 2,
							},
							hideCDanimation = {
								type = "toggle",
								width = "normal",
								name = L["Hide CD Animation"],
								desc = L["Hide Cooldown Animation on the icons"],
								order = 3,
							},
							drawEdge = {
								type = "toggle",
								width = "normal",
								name = L["Draw Edge"],
								desc = L["Show Draw Edge texture on the icons"],
								order = 4,
							},
							cooldownCount = {
								type = "toggle",
								width = "normal",
								name = L["Cooldown Count"],
								desc = L["Allow Blizzard and other addons to display countdown text on the icons"],
								order = 5,
							},
							customTimer = {
								type = "toggle",
								width = "normal",
								name = L["Custom Timer"],
								desc = L["Show custom timer text on the icons"],
								order = 6,
							},
							hideBorder = {
								type = "toggle",
								width = "normal",
								name = L["Hide border"],
								desc = L["Hide border on the icons"],
								order = 7,
							},
							interruptIcon = {
								type = "toggle",
								width = "normal",
								name = L["Interrupt Icon"],
								desc = L["Show interrupted spell icon instead of interrupt spell icon"],
								order = 8,
							},
							timeThreshold = {
								type = "range",
								name = L["Time Threshold"],
								desc = L["Time Threshold for displaying tenths of seconds"],
								min = 0,
								max = 60,
								step = 1,
								order = 9,
							},
							customTimerSize = {
								type = "range",
								name = L["Custom Timer Size"],
								desc = L["Modifies the size of the cooldown spiral"],
								min = 1.9,
								max = 6,
								step = 0.1,
								order = 10,
							},
							font = {
								type = "select",
								name = L["Font"],
								desc = L["Choose font for the custom timer"],
								dialogControl = "LSM30_Font",
								values = getMediaData,
								order = 11,
							},
							outline = {
								type = "select",
								name = L["Outline"],
								desc = L["Choose font outline for the custom timer"],
								values = {["OUTLINE"] = L["Thin outline"], ["THICKOUTLINE"] = L["Thick outline"], [""] = L["Shadow"]},
								order = 12,
							},
						},
					},
					player = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.player[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.player[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the player frame"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							inArena = {
								type = "toggle",
								name = L["Only In Arena"],
								order = 5,
								width = "normal",
								desc = L["Enable BigDebuffs Only In Arena on the player frame"],
							},
							duplicatePlayer = {
								type = "toggle",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Duplicate player"],
								order = 6,
								width = "normal",
								desc = L["Duplicate player tooltip"],
							},
							spells = {
								order = 7,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["Player Frame"],
						desc = L["Enable BigDebuffs on the player frame"],
						order = 1,
					},
					pet = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.pet[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.pet[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the pet frame"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							inArena = {
								type = "toggle",
								name = L["Only In Arena"],
								order = 5,
								width = "normal",
								desc = L["Enable BigDebuffs Only In Arena on the player frame"],
							},
							spells = {
								order = 6,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["Pet Frame"],
						desc = L["Enable BigDebuffs on the pet frame"],
						order = 2,
					},
					target = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.target[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.target[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the target frame"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							inArena = {
								type = "toggle",
								name = L["Only In Arena"],
								order = 5,
								width = "normal",
								desc = L["Enable BigDebuffs Only In Arena on the player frame"],
							},
							enabledtargettarget = {
								type = "toggle",
								name = L["Enable target of target"],
								order = 6,
								width = "normal",
								desc = L["Enable target of target tooltip"],
							},
							spells = {
								order = 7,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["Target Frame"],
						desc = L["Enable BigDebuffs on the target frame"],
						order = 3,
					},
					focus = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.focus[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.focus[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the focus frame"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							inArena = {
								type = "toggle",
								name = L["Only In Arena"],
								order = 5,
								width = "normal",
								desc = L["Enable BigDebuffs Only In Arena on the player frame"],
							},
							enabledfocustarget = {
								type = "toggle",
								name = L["Enable target of focus"],
								order = 6,
								width = "normal",
								desc = L["Enable target of focus tooltip"],
							},
							spells = {
								order = 7,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["Focus Frame"],
						desc = L["Enable BigDebuffs on the focus frame"],
						order = 4,
					},
					party = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.party[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.party[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the party frames"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							inArena = {
								type = "toggle",
								name = L["Only In Arena"],
								order = 5,
								width = "normal",
								desc = L["Enable BigDebuffs Only In Arena on the player frame"],
							},
							spells = {
								order = 6,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["Party Frames"],
						desc = L["Enable BigDebuffs on the party frames"],
						order = 5,
					},
					partypet = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.partypet[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.partypet[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the partypet frames"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							inArena = {
								type = "toggle",
								name = L["Only In Arena"],
								order = 5,
								width = "normal",
								desc = L["Enable BigDebuffs Only In Arena on the player frame"],
							},
							spells = {
								order = 6,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["PartyPet Frames"],
						desc = L["Enable BigDebuffs on the partypet frames"],
						order = 6,
					},
					arena = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.arena[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.arena[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the arena frames"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							spells = {
								order = 5,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["Arena Frames"],
						desc = L["Enable BigDebuffs on the arena frames"],
						order = 7,
					},
					arenapet = {
						type = "group",
						disabled = function(info) return not self.db.profile[info[1]].enabled or (info[3] and not self.db.profile.unitFrames[info[2]].enabled) end,
						get = function(info) local name = info[#info] return self.db.profile.unitFrames.arenapet[name] end,
						set = function(info, value) local name = info[#info] self.db.profile.unitFrames.arenapet[name] = value self:Refresh() self:Refresh() end,
						args = {
							enabled = {
								type = "toggle",
								disabled = function(info) return not self.db.profile[info[1]].enabled end,
								name = L["Enabled"],
								order = 1,
								width = "normal",
								desc = L["Enable BigDebuffs on the arenapet frames"],
							},
							anchor = {
								name = L["Anchor"],
								desc = L["Anchor to attach the BigDebuffs frames"],
								type = "select",
								values = {
									["auto"] = L["Automatic"],
									["manual"] = L["Manual"],
								},
								order = 2,
							},
							size = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled or self.db.profile.unitFrames[name].anchor == "auto" end,
								name = L["Size"],
								desc = L["Set the size of the frame"],
								min = 20,
								max = 70,
								step = 0.1,
								order = 3,
							},
							alpha = {
								type = "range",
								disabled = function(info) local name = info[2] return not self.db.profile.unitFrames[name].enabled end,
								name = L["Alpha"],
								desc = L["Set the alpha of the frame"],
								min = 0,
								max = 1,
								step = 0.01,
								order = 4,
							},
							spells = {
								order = 5,
								name = L["Spells"],
								type = "group",
								inline = true,
								args = {
									immunities = {
										type = "toggle",
										width = "normal",
										name = L["immunities"],
										desc = L["Show Immunities on the unit frames"],
										order = 1,
									},
									cc = {
										type = "toggle",
										width = "normal",
										name = L["cc"],
										desc = L["Show Crowd Control on the unit frames"],
										order = 2,
									},
									silence = {
										type = "toggle",
										width = "normal",
										name = L["silence"],
										desc = L["Show Silence on the unit frames"],
										order = 3,
									},
									interrupts = {
										type = "toggle",
										width = "normal",
										name = L["interrupts"],
										desc = L["Show Interrupts on the unit frames"],
										order = 4,
									},
									roots = {
										type = "toggle",
										width = "normal",
										name = L["roots"],
										desc = L["Show Roots on the unit frames"],
										order = 5,
									},
									disarm = {
										type = "toggle",
										width = "normal",
										name = L["disarm"],
										desc = L["Show Disarm on the unit frames"],
										order = 6,
									},
									buffs_defensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_defensive"],
										desc = L["Show Defensive Buffs on the unit frames"],
										order = 7,
									},
									buffs_offensive = {
										type = "toggle",
										width = "normal",
										name = L["buffs_offensive"],
										desc = L["Show Offensive Buffs on the unit frames"],
										order = 8,
									},
									buffs_other = {
										type = "toggle",
										width = "normal",
										name = L["buffs_other"],
										desc = L["Show Other Buffs on the unit frames"],
										order = 9,
									},
									snare = {
										type = "toggle",
										width = "normal",
										name = L["snare"],
										desc = L["Show Spell Immunities on the unit frames"],
										order = 10,
									},
								},
							},
						},
						name = L["ArenaPet Frames"],
						desc = L["Enable BigDebuffs on the arenapet frames"],
						order = 8,
					},
				},
			},
			spells = {
				name = L["Spell Settings"],
				type = "group",
				childGroups = "tab",
				order = 40,
				args = Spells,
			},
		},
	}

	self.options.args.priority = {
		name = L["Category Priority"],
		type = "group",
		get = function(info) local name = info[#info] return self.db.profile.priority[name] end,
		set = function(info, value) local name = info[#info] self.db.profile.priority[name] = value self:Refresh() end,
		order = 30,
		args = {
			immunities = {
				type = "range",
				width = "double",
				name = L["immunities"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 11,
			},
			cc = {
				type = "range",
				width = "double",
				name = L["cc"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 12,
			},
			silence = {
				type = "range",
				width = "double",
				name = L["silence"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 13,
			},
			interrupts = {
				type = "range",
				width = "double",
				name = L["interrupts"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 14,
			},
			roots = {
				type = "range",
				width = "double",
				name = L["roots"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 15,
			},
			disarm = {
				type = "range",
				width = "double",
				name = L["disarm"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 16,
			},
			buffs_defensive = {
				type = "range",
				width = "double",
				name = L["buffs_defensive"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 17,
			},
			buffs_offensive = {
				type = "range",
				width = "double",
				name = L["buffs_offensive"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 18,
			},
			buffs_other = {
				type = "range",
				width = "double",
				name = L["buffs_other"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 19,
			},
			snare = {
				type = "range",
				width = "double",
				name = L["snare"],
				desc = L["Higher priority spells will take precedence regardless of duration"],
				min = 1,
				max = 100,
				step = 1,
				order = 20,
			},
		},
	}

	self.options.plugins.profiles = { profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) }

	local LibDualSpec = LibStub('LibDualSpec-1.0')
	LibDualSpec:EnhanceDatabase(self.db, "BigDebuffsDB")
	LibDualSpec:EnhanceOptions(self.options.plugins.profiles.profiles, self.db)

	LibStub("AceConfig-3.0"):RegisterOptionsTable("BigDebuffs", self.options)

	AceDialog = AceDialog or LibStub("AceConfigDialog-3.0")
	AceDialog:SetDefaultSize("BigDebuffs", 799, 552)

	--AceDialog:AddToBlizOptions("BigDebuffs")
end
