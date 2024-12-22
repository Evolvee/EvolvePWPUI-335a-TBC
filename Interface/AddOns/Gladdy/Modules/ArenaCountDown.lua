local str_find, pairs = string.find, pairs
local CreateFrame = CreateFrame
local RaidBossEmoteFrame = RaidBossEmoteFrame

local Gladdy = LibStub("Gladdy")
local L = Gladdy.L
local ACDFrame = Gladdy:NewModule("Arena Countdown", nil, {
    countdown = true,
    arenaCountdownSize = 256,
    arenaCountdownFrameStrata = "HIGH",
    arenaCountdownFrameLevel = 50,
})

function ACDFrame:OnEvent(event, ...)
    self[event](self, ...)
end

function ACDFrame:Initialize()
    self.locale = Gladdy:GetArenaTimer()
    self.texturePath = "Interface\\AddOns\\Gladdy\\Images\\Countdown\\";

    local ACDNumFrame = CreateFrame("Frame", "ACDNumFrame", UIParent)
    self.ACDNumFrame = ACDNumFrame
    self.ACDNumFrame:EnableMouse(false)
    self.ACDNumFrame:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumFrame:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumFrame:SetPoint("CENTER", 0, 128)
    self.ACDNumFrame:Hide()

    local ACDNumTens = ACDNumFrame:CreateTexture("ACDNumTens", "OVERLAY")
    self.ACDNumTens = ACDNumTens
    self.ACDNumTens:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumTens:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumTens:SetPoint("CENTER", self.ACDNumFrame, "CENTER", -(Gladdy.db.arenaCountdownSize / 8 + Gladdy.db.arenaCountdownSize / 8 / 2), 0)

    local ACDNumOnes = ACDNumFrame:CreateTexture("ACDNumOnes", "OVERLAY")
    self.ACDNumOnes = ACDNumOnes
    self.ACDNumOnes:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumOnes:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumOnes:SetPoint("CENTER", self.ACDNumFrame, "CENTER", (Gladdy.db.arenaCountdownSize / 8 + Gladdy.db.arenaCountdownSize / 8 / 2), 0)

    local ACDNumOne = ACDNumFrame:CreateTexture("ACDNumOne", "OVERLAY")
    self.ACDNumOne = ACDNumOne
    self.ACDNumOne:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumOne:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumOne:SetPoint("CENTER", self.ACDNumFrame, "CENTER", 0, 0)

    local ACDNumTwo = ACDNumFrame:CreateTexture("ACDNumTwo", "OVERLAY")
    self.ACDNumTwo = ACDNumTwo
    self.ACDNumTwo:SetWidth(128)
    self.ACDNumTwo:SetHeight(128)
    self.ACDNumTwo:SetPoint("LEFT", self.ACDNumFrame, "LEFT", -10, 0)

local ACDNumThree = ACDNumFrame:CreateTexture("ACDNumThree", "OVERLAY")
    self.ACDNumThree = ACDNumThree
    self.ACDNumThree:SetWidth(128)
    self.ACDNumThree:SetHeight(128)
    self.ACDNumThree:SetPoint("RIGHT", self.ACDNumFrame, "RIGHT", 10, 0)

    if Gladdy.db.countdown then
        self:RegisterMessage("JOINED_ARENA")
        self:RegisterMessage("ENEMY_SPOTTED")
        self:RegisterMessage("UNIT_SPEC")
    end
    self.faction = UnitFactionGroup("player")
    self:SetScript("OnEvent", ACDFrame.OnEvent)
end

function ACDFrame:UpdateFrameOnce()
    if Gladdy.db.countdown then
        self:RegisterMessage("JOINED_ARENA")
        self:RegisterMessage("ENEMY_SPOTTED")
        self:RegisterMessage("UNIT_SPEC")
    else
        self:UnregisterAllMessages()
    end
    self.ACDNumFrame:SetFrameStrata(Gladdy.db.arenaCountdownFrameStrata)
    self.ACDNumFrame:SetFrameLevel(Gladdy.db.arenaCountdownFrameLevel)

    self.ACDNumFrame:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumFrame:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumFrame:SetPoint("CENTER", 0, 128)

    self.ACDNumTens:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumTens:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumTens:SetPoint("CENTER", self.ACDNumFrame, "CENTER", -(Gladdy.db.arenaCountdownSize / 8 + Gladdy.db.arenaCountdownSize / 8 / 2), 0)

    self.ACDNumOnes:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumOnes:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumOnes:SetPoint("CENTER", self.ACDNumFrame, "CENTER", (Gladdy.db.arenaCountdownSize / 8 + Gladdy.db.arenaCountdownSize / 8 / 2), 0)

    self.ACDNumOne:SetWidth(Gladdy.db.arenaCountdownSize)
    self.ACDNumOne:SetHeight(Gladdy.db.arenaCountdownSize)
    self.ACDNumOne:SetPoint("CENTER", self.ACDNumFrame, "CENTER", 0, 0)
end

function ACDFrame:HideAll()
    self.ACDNumFrame:Hide()
    self.ACDNumTens:Hide()
    self.ACDNumOnes:Hide()
    self.ACDNumOne:Hide()
    self.ACDNumTwo:Hide()
    self.ACDNumThree:Hide()
end

function ACDFrame:CreateTicker(countdown)
    self.countdown = countdown
    if self.ticker and not self.ticker:IsCancelled() then
        self.ticker:Cancel()
    end
    self.ticker = C_Timer.NewTicker(1, ACDFrame.Ticker) -- .98?
end

local classmarkers = {
    ["ROGUE"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Rogue",
    ["PRIEST"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Priest",
    ["WARRIOR"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Warrior",
    ["PALADIN"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Paladin",
    ["HUNTER"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Hunter",
    ["DRUID"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Druid",
    ["MAGE"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Mage",
    ["SHAMAN"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Shaman",
    ["WARLOCK"] = "Interface\\AddOns\\TextureScript\\Gladdy\\ClassIconsUpscaled\\Warlock",
}

local function determineClass(class1, class2)
    if class1 == nil and class2 == nil then -- Double stealth no icons
        class1, class2 = nil, nil
    elseif (class1 == "MAGE" and class2 == nil) or (class2 == "MAGE" and class1 == nil) then -- Rogue/Mage
        if class1 == nil then
            class1 = "ROGUE"
        end
        if class2 == nil then
            class2 = "ROGUE"
        end
    elseif (class1 == "PRIEST" and class2 == nil) or (class2 == "PRIEST" and class1 == nil) then -- DPR / DPM
        if class1 == nil then
            if AuraUtil and AuraUtil.FindAuraByName("Arcane Intellect", "arena2", "HELPFUL") then
                class1 = "MAGE"
            else
                class1 = "ROGUE"
            end
        end
        if class2 == nil then
            if AuraUtil and AuraUtil.FindAuraByName("Arcane Intellect", "arena1", "HELPFUL") then
                class2 = "MAGE"
            else
                class2 = "ROGUE"
            end
        end
    end
    return class1, class2
end

function ACDFrame.Ticker()
    local self = ACDFrame
    if (Gladdy.db.countdown) then
        self.ACDNumFrame:Show()
        if (self.countdown and self.countdown >= 10 and self.countdown <= 60) then
            -- Display has 2 digits
            local ones = self.countdown % 10
            local tens = (self.countdown / 10) % 10
            self.ACDNumOne:Hide()
            self.ACDNumTwo:Hide()
            self.ACDNumThree:Hide()
            self.ACDNumTens:Show()
            self.ACDNumOnes:Show()

            self.ACDNumTens:SetTexture(self.texturePath .. tens)
            self.ACDNumOnes:SetTexture(self.texturePath .. ones)
            self.ACDNumFrame:SetScale(0.7)
        elseif (self.countdown and self.countdown < 10 and self.countdown > 0) then
            -- Display has 1 digit for numbers 1-9
            local path = self.countdown
            self.ACDNumOne:Show()
            self.ACDNumOne:SetTexture(self.texturePath .. path)
            self.ACDNumOnes:Hide()
            self.ACDNumTens:Hide()
            self.ACDNumFrame:SetScale(1.0)

            -- Play sound for single digits (1 to 9)
            PlaySoundFile("Interface\\Addons\\TextureScript\\Gladdy\\Countdown.ogg")

        elseif (self.countdown and self.countdown == 0) then
            -- Display for countdown 0
            -- Display a random blue-haired Blizzard clASSic WoW employee of the year
            --local randomTexture = math.random(1, 10) -- Generate a random number between 1 and 10
            --self.ACDNumOne:SetTexture("Interface\\Addons\\TextureScript\\Gladdy\\BlizzardEmployees\\" .. randomTexture)
            local class1, class2 = determineClass(select(2, UnitClass("arena1")), select(2, UnitClass("arena2")))

            if class1 then
                self.ACDNumTwo:SetTexture(classmarkers[class1])
                self.ACDNumTwo:Show()
            end

            if class2 then
                self.ACDNumThree:SetTexture(classmarkers[class2])
                self.ACDNumThree:Show()
            end

            self.ACDNumOne:Hide()
            self.ACDNumOnes:Hide()
            self.ACDNumTens:Hide()
            self.ACDNumFrame:SetScale(1.0)

            -- Play a different sound when countdown reaches 0
            PlaySoundFile("Interface\\Addons\\TextureScript\\Gladdy\\Finish.ogg")

        else
            -- Hide everything when countdown is below 0
            ACDFrame:HideAll()
            if (self.countdown) then
                ACDFrame:Reset()
            end
        end

        -- Decrement the countdown after handling display and sounds
        self.countdown = self.countdown and self.countdown - 1
    else
        ACDFrame:HideAll()
    end
end

function ACDFrame:JOINED_ARENA()
    if Gladdy.db.countdown and not self.countdown then
        self:CreateTicker(nil)
        self:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
        RaidBossEmoteFrame:UnregisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
    end
end

function ACDFrame:Reset()
    if self.ticker and not self.ticker:IsCancelled() then
        self.ticker:Cancel()
    end
    self.countdown = nil
    self:UnregisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
    RaidBossEmoteFrame:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
    ACDFrame:HideAll()
end

function ACDFrame:ENEMY_SPOTTED()
    if not Gladdy.frame.testing and (self.countdown and self.countdown > 0) then
        ACDFrame:Reset()
    end
end

function ACDFrame:UNIT_SPEC()
    if not Gladdy.frame.testing and (self.countdown and self.countdown > 0) then
        ACDFrame:Reset()
    end
end

function ACDFrame:CHAT_MSG_BG_SYSTEM_NEUTRAL(msg)
    for k, v in pairs(self.locale) do
        if str_find(msg, v) then
            if self.countdown and self.countdown == 0 then
                return
            end
            self.countdown = k
        end
    end
end

function ACDFrame:TestOnce()
    self:CreateTicker(2)
end

function ACDFrame:GetOptions()
    return {
        headerArenaCountdown = {
            type = "header",
            name = L["Arena Countdown"],
            order = 2,
        },
        countdown = Gladdy:option({
            type = "toggle",
            name = L["Enabled"],
            desc = L["Turns countdown before the start of an arena match on/off."],
            order = 3,
            width = "full",
        }),
        arenaCountdownSize = Gladdy:option({
            type = "range",
            name = L["Size"],
            order = 4,
            min = 64,
            max = 512,
            step = 16,
            width = "full",
            disabled = function()
                return not Gladdy.db.countdown
            end,
        }),
        headerAuraLevel = {
            type = "header",
            name = L["Frame Strata and Level"],
            order = 5,
        },
        arenaCountdownFrameStrata = Gladdy:option({
            type = "select",
            name = L["Frame Strata"],
            order = 6,
            values = Gladdy.frameStrata,
            sorting = Gladdy.frameStrataSorting,
            disabled = function()
                return not Gladdy.db.countdown
            end,
        }),
        arenaCountdownFrameLevel = Gladdy:option({
            type = "range",
            name = L["Frame Level"],
            min = 0,
            max = 500,
            step = 1,
            order = 7,
            width = "full",
            disabled = function()
                return not Gladdy.db.countdown
            end,
        }),
    }
end
