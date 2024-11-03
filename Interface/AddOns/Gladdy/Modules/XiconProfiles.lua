local Gladdy = LibStub("Gladdy")
local L = Gladdy.L

local XiconProfiles = Gladdy:NewModule("XiconProfiles", nil, {
})

local function applyProfile(profileString)
    local deserialized = Gladdy.modules["Export Import"]:Decode(profileString)
    if deserialized then
        Gladdy.modules["Export Import"]:ApplyImport(deserialized, Gladdy.db)
    end
    Gladdy:Reset()
    Gladdy:HideFrame()
    Gladdy:ToggleFrame(3)
    Gladdy.options.args.lock.name = Gladdy.db.locked and L["Unlock frame"] or L["Lock frame"]
    Gladdy.options.args.showMover.name = Gladdy.db.showMover and L["Hide Mover"] or L["Show Mover"]
    LibStub("AceConfigRegistry-3.0"):NotifyChange("Gladdy")
end

function XiconProfiles:GetOptions()
    return {
        headerProfileBlizzard = {
            type = "header",
            name = "Blizzard " .. L["Profile"],
            order = 2,
        },
        blizzardProfile = {
            type = "execute",
            func = function()
                Gladdy.dbi:ResetProfile(Gladdy.dbi:GetCurrentProfile())
                applyProfile(Gladdy:GetBlizzardProfile())
            end,
            name = " ",
            desc = "Blizzard " .. L["Profile"],
            image = "Interface\\AddOns\\Gladdy\\Images\\BasicProfiles\\Blizz1.blp",
            imageWidth = 350,
            imageHeight = 175,
            width = "full",
            order = 3,
        },
        headerProfileClassic = {
            type = "header",
            name = "Classic " .. L["Profile"],
            order = 4,
        },
        classicProfile = {
            type = "execute",
            func = function()
                Gladdy.dbi:ResetProfile(Gladdy.dbi:GetCurrentProfile())
                applyProfile(Gladdy:GetClassicProfile())
            end,
            name = " ",
            desc = "Classic " .. L["Profile"],
            image = "Interface\\AddOns\\Gladdy\\Images\\BasicProfiles\\Classic1.blp",
            imageWidth = 350,
            imageHeight = 175,
            width = "full",
            order = 5,
        },
        headerProfileClassicNoPet = {
            type = "header",
            name = "Classic " .. L["Profile"] .. L[" No Pet"],
            order = 6,
        },
        classicProfileNoPet = {
            type = "execute",
            func = function()
                Gladdy.dbi:ResetProfile(Gladdy.dbi:GetCurrentProfile())
                applyProfile(Gladdy:GetClassicProfileNoPet())
            end,
            name = " ",
            desc = "Classic " .. L["Profile"] .. L[" No Pet"],
            image = "Interface\\AddOns\\Gladdy\\Images\\BasicProfiles\\Classic2.blp",
            imageWidth = 350,
            imageHeight = 175,
            width = "full",
            order = 7,
        },
    }
end