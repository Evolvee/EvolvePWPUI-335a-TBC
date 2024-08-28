local JaxPartyCastBars = LibStub("AceAddon-3.0"):GetAddon("JaxPartyCastBars")
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata

function JaxPartyCastBars:UpdateOptions()
end

local attachValues = {
    ["CENTER"] = "CENTER",
    ["TOP"] = "TOP",
    ["RIGHT"] = "RIGHT",
    ["BOTTOM"] = "BOTTOM",
    ["LEFT"] = "LEFT",
    ["TOPRIGHT"] = "TOPRIGHT",
    ["TOPLEFT"] = "TOPLEFT",
    ["BOTTOMRIGHT"] = "BOTTOMRIGHT",
    ["BOTTOMLEFT"] = "BOTTOMLEFT"
};

function JaxPartyCastBars:SetupOptions()
    JaxPartyCastBars:UpdateOptions()
    self.options = {
        type = "group",
        childGroups = "tab",
        plugins = {},
        args = {
            author = {
                name = "|cff1fd700Author:|r Jax",
                type = "description"
            },
            version = {
                name = "|cff1fd700Version:|r " .. GetAddOnMetadata("JaxPartyCastBars", "Version") .. "\n",
                type = "description"
            },
            moreoptions = {
                name = "General",
                type = "group",
                args = {
                    xOff = {
                        order = 1,
                        width = "full",
                        name = "X Offset",
                        desc = "",
                        type = "range",
                        min = -1000,
                        max = 1000,
                        set = function(info, val)
                            self.db.profile.offsetX = val;
                            JPC:UpdateBars();
                        end,
                        get = function(info)
                            return self.db.profile.offsetX
                        end
                    },
                    yOff = {
                        order = 2,
                        width = "full",
                        name = "Y Offset",
                        desc = "",
                        type = "range",
                        min = -1000,
                        max = 1000,
                        set = function(info, val)
                            self.db.profile.offsetY = val;
                            JPC:UpdateBars();
                        end,
                        get = function(info)
                            return self.db.profile.offsetY
                        end
                    },
                    scale = {
                        order = 3,
                        width = "full",
                        name = "Scale",
                        desc = "",
                        type = "range",
                        min = 0.1,
                        max = 3,
                        set = function(info, val)
                            self.db.profile.scale = val;
                            JPC:UpdateBars();
                        end,
                        get = function(info)
                            return self.db.profile.scale
                        end
                    },
                    color = {
                        order = 4,
                        width = "full",
                        name = "Castbar border color",
                        desc = "Darken the border of the castbar",
                        type = "range",
                        min = 0.05,
                        max = 1,
                        step = 0.05,
                        set = function(info, val)
                            self.db.profile.color = val;
                            JPC:UpdateBorderColor()
                        end,
                        get = function(info)
                            return self.db.profile.color;
                        end,
                    },
                    h1 = {
                        order = 5,
                        width = "full",
                        type = "header",
                        name = ""
                    },
                    spellBarAttach = {
                        order = 6,
                        width = 1.8,
                        type = "select",
                        name = "Raid Frame Attach Point",
                        desc = "Desc",
                        values = attachValues,
                        style = "dropdown",
                        get = function()
                            return self.db.profile.attachPointBar
                        end,
                        set = function(info, val)
                            self.db.profile.attachPointBar = val;
                            JPC:UpdateBars();
                        end,
                    },
                    h2 = {
                        order = 7,
                        width = "full",
                        type = "header",
                        name = ""
                    },
                    raidAttach = {
                        order = 8,
                        width = 1.8,
                        type = "select",
                        name = "Spell Bar Attach Point",
                        desc = "Desc",
                        values = attachValues,
                        style = "dropdown",
                        get = function()
                            return self.db.profile.attachPointFrame
                        end,
                        set = function(info, val)
                            self.db.profile.attachPointFrame = val;
                            JPC:UpdateBars();
                        end,
                    },
                    h3 = {
                        order = 9,
                        width = "full",
                        type = "header",
                        name = ""
                    },
                    showBtn = {
                        order = 10,
                        width = 1.5,
                        name = "Test Mode (only in party)",
                        desc = "Shows a fake cast bar for the current raid frames shown",
                        type = "toggle",
                        get = function(info)
                            return not JPC.locked
                        end,
                        set = JPC_Unlock
                    },
                    HideIcon = {
                        type = "toggle",
                        order = 10,
                        width = "1.5",
                        name = "Hide spellbar icon",
                        set = function(info, val)
                            self.db.profile.icon = val
                        end,
                        get = function()
                            return self.db.profile.icon
                        end,
                    },
                }
            }
        }
    }
    LibStub("AceConfig-3.0"):RegisterOptionsTable("|cff1fd700JaxPartyCastBars|r", self.options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("|cff1fd700JaxPartyCastBars|r", "|cff1fd700JaxPartyCastBars|r")
    self:RegisterChatCommand("jpcb", function()
        InterfaceOptionsFrame_OpenToCategory("|cff1fd700JaxPartyCastBars|r")
        InterfaceOptionsFrame_OpenToCategory("|cff1fd700JaxPartyCastBars|r")
    end)
    self:RegisterChatCommand("jaxpartycastbars", function()
        InterfaceOptionsFrame_OpenToCategory("|cff1fd700JaxPartyCastBars|r")
        InterfaceOptionsFrame_OpenToCategory("|cff1fd700JaxPartyCastBars|r")
    end)
end
