local classmarkers = {
    ["ROGUE"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Rogue",
    ["PRIEST"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Priest",
    ["WARRIOR"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Warrior",
    ["PALADIN"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Paladin",
    ["HUNTER"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Hunter",
    ["DRUID"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Druid",
    ["MAGE"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Mage",
    ["SHAMAN"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Shaman",
    ["WARLOCK"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Warlock",
	["UNKNOWN"] = "Interface\\AddOns\\TextureScript\\ClassIconsUpscaled\\Unknown",
}

local function determineClass(class1, class2)
    if (class1 == nil and class2 == nil) or (GladdyButtonFrame3 and GladdyButtonFrame3:IsShown()) then
        -- Double stealth no icons
        class1, class2 = nil, nil
    elseif (class1 == "MAGE" and class2 == nil) or (class2 == "MAGE" and class1 == nil) then
        -- Rogue/Mage
        if class1 == nil then
            class1 = "ROGUE"
        end
        if class2 == nil then
            class2 = "ROGUE"
        end
    elseif (class1 == "PRIEST" and class2 == nil) or (class2 == "PRIEST" and class1 == nil) then
        -- Priest/Rogue or Priest/Mage
        if class1 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Arcane Intellect", "arena2", "HELPFUL") or AuraUtil.FindAuraByName("Arcane Brilliance", "arena2", "HELPFUL")) then
                class1 = "MAGE"
            else
                class1 = "ROGUE"
            end
        end
        if class2 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Arcane Intellect", "arena1", "HELPFUL") or AuraUtil.FindAuraByName("Arcane Brilliance", "arena1", "HELPFUL")) then
                class2 = "MAGE"
            else
                class2 = "ROGUE"
            end
        end
    elseif (class1 == "WARRIOR" and class2 == nil) or (class2 == "WARRIOR" and class1 == nil) then
        -- Warrior/Druid
        if class1 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Mark of the Wild", "arena2", "HELPFUL") or AuraUtil.FindAuraByName("Gift of the Wild", "arena2", "HELPFUL")) then
                class1 = "DRUID"
            end
        end
        if class2 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Mark of the Wild", "arena1", "HELPFUL") or AuraUtil.FindAuraByName("Gift of the Wild", "arena1", "HELPFUL")) then
                class2 = "DRUID"
            end
        end
    elseif (class1 == "WARLOCK" and class2 == nil) or (class2 == "WARLOCK" and class1 == nil) then
        -- Warlock/Rogue or Warlock/Druid
        if class1 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Mark of the Wild", "arena2", "HELPFUL") or AuraUtil.FindAuraByName("Gift of the Wild", "arena2", "HELPFUL")) then
                class1 = "DRUID"
            else
                class1 = "ROGUE"
            end
        end
        if class2 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Mark of the Wild", "arena1", "HELPFUL") or AuraUtil.FindAuraByName("Gift of the Wild", "arena1", "HELPFUL")) then
                class2 = "DRUID"
            else
                class2 = "ROGUE"
            end
        end
    elseif (class1 == "PALADIN" and class2 == nil) or (class2 == "PALADIN" and class1 == nil) then
        -- Paladin/Mage or Paladin/Rogue
        if class1 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Arcane Intellect", "arena2", "HELPFUL") or AuraUtil.FindAuraByName("Arcane Brilliance", "arena2", "HELPFUL")) then
                class1 = "MAGE"
            else
                class1 = "ROGUE"
            end
        end
        if class2 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Arcane Intellect", "arena1", "HELPFUL") or AuraUtil.FindAuraByName("Arcane Brilliance", "arena1", "HELPFUL")) then
                class2 = "MAGE"
            else
                class2 = "ROGUE"
            end
        end
    elseif (class1 == "HUNTER" and class2 == nil) or (class2 == "HUNTER" and class1 == nil) then
        -- Hunter/Druid or Hunter/Rogue
        if class1 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Mark of the Wild", "arena2", "HELPFUL") or AuraUtil.FindAuraByName("Gift of the Wild", "arena2", "HELPFUL")) then
                class1 = "DRUID"
            else
                class1 = "ROGUE"
            end
        end
        if class2 == nil then
            if AuraUtil and (AuraUtil.FindAuraByName("Mark of the Wild", "arena1", "HELPFUL") or AuraUtil.FindAuraByName("Gift of the Wild", "arena1", "HELPFUL")) then
                class2 = "DRUID"
            else
                class2 = "ROGUE"
            end
        end
    end
    return class1, class2
end


-- Animations
local function CreateScaleAnim(group, order, duration, scaleX, scaleY, delay, smoothing, endDelay, originPoint, originOffsetX, originOffsetY)
    local anim = group:CreateAnimation("Scale")
    anim:SetOrder(order)
    anim:SetDuration(duration)
    anim:SetScale(scaleX, scaleY)

    if delay then
        anim:SetStartDelay(delay)
    end
    if endDelay then
        anim:SetEndDelay(endDelay)
    end
    if smoothing then
        anim:SetSmoothing(smoothing)
    end
    if originPoint then
        anim:SetOrigin(originPoint, originOffsetX or 0, originOffsetY or 0)
    end
end

local function CreateAlphaAnim(group, order, duration, change, delay, smoothing, endDelay)
    local anim = group:CreateAnimation("Alpha")
    anim:SetOrder(order)
    anim:SetDuration(duration)
    anim:SetChange(change)

    if delay then
        anim:SetStartDelay(delay)
    end
    if endDelay then
        anim:SetEndDelay(endDelay)
    end
    if smoothing then
        anim:SetSmoothing(smoothing)
    end
end

local AtlasInfo = {
    ["BossBanner-BgBanner-Bottom"]={440, 112, 0.00195312, 0.861328, 0.00195312, 0.220703, false, false, "1x"},
    ["BossBanner-BgBanner-Top"]={440, 112, 0.00195312, 0.861328, 0.224609, 0.443359, false, false, "1x"},
    ["BossBanner-BgBanner-Mid"]={440, 64, 0.00195312, 0.861328, 0.447266, 0.572266, false, false, "1x"},
}

local function SetAtlas(textureObject, atlasName, useAtlasSize)
    local atlas = AtlasInfo[atlasName]
    if textureObject and atlas then
        textureObject:SetTexture("Interface\\AddOns\\ArenaEnemyClass\\textures\\BossBanner") -- hardcode texture, since there is only one required for this Toast
        textureObject:SetTexCoord(atlas[3], atlas[4], atlas[5], atlas[6])
        if useAtlasSize then
            textureObject:SetSize(atlas[1], atlas[2])
        end
        return textureObject
    end
end

local BossBanner = CreateFrame("Frame", "BossBanner", UIParent)
BossBanner:Hide()
BossBanner:SetSize(128, 206)
BossBanner:SetPoint("TOP", UIParent, 0, -130)
BossBanner:EnableMouse(false)
BossBanner:SetAlpha(1)
BossBanner:SetFrameStrata("HIGH") -- cuz of TextureScript nameplate strata changes

-- ICON
local ACDNumTwo = BossBanner:CreateTexture(nil, "OVERLAY")
ACDNumTwo = ACDNumTwo
ACDNumTwo:SetWidth(80)
ACDNumTwo:SetHeight(80)
ACDNumTwo:SetPoint("LEFT", BossBanner, "LEFT", -20, -25)

local ACDNumThree = BossBanner:CreateTexture(nil, "OVERLAY")
ACDNumThree = ACDNumThree
ACDNumThree:SetWidth(80)
ACDNumThree:SetHeight(80)
ACDNumThree:SetPoint("RIGHT", BossBanner, "RIGHT", 20, -25)

-- BORDER
BossBanner.BannerTop = BossBanner:CreateTexture("BannerTop", "BORDER")
local BannerTop = BossBanner.BannerTop
BannerTop:SetBlendMode("BLEND")
BannerTop = SetAtlas(BannerTop, "BossBanner-BgBanner-Top", true)
BannerTop:SetPoint("TOP", 0, -44)

BossBanner.BannerTopGlow = BossBanner:CreateTexture("BannerTopGlow", "BORDER")
local BannerTopGlow = BossBanner.BannerTopGlow
BannerTopGlow:SetBlendMode("ADD")
BannerTopGlow = SetAtlas(BannerTopGlow, "BossBanner-BgBanner-Top", true)
BannerTopGlow:SetPoint("TOP", 0, -44)
BannerTopGlow:SetAlpha(0)

BossBanner.BannerBottom = BossBanner:CreateTexture("BannerBottom", "BORDER")
local BannerBottom = BossBanner.BannerBottom
BannerBottom:SetBlendMode("BLEND")
BannerBottom = SetAtlas(BannerBottom, "BossBanner-BgBanner-Bottom", true)
BannerBottom:SetPoint("BOTTOM", 0, 0)
--BannerBottom:SetAlpha(0)

BossBanner.BannerBottomGlow = BossBanner:CreateTexture("BannerBottomGlow", "BORDER")
local BannerBottomGlow = BossBanner.BannerBottomGlow
BannerBottomGlow:SetBlendMode("ADD")
BannerBottomGlow = SetAtlas(BannerBottomGlow, "BossBanner-BgBanner-Bottom", true)
BannerBottomGlow:SetPoint("BOTTOM", 0, 0)
BannerBottomGlow:SetAlpha(0)

-- BACKGROUND
BossBanner.BannerMiddle = BossBanner:CreateTexture("BannerMiddle", "BACKGROUND")
local BannerMiddle = BossBanner.BannerMiddle
BannerMiddle = SetAtlas(BannerMiddle, "BossBanner-BgBanner-Mid", true)
BannerMiddle:SetBlendMode("BLEND")
BannerMiddle:SetPoint("TOPLEFT", BannerTop, 0, -34)
BannerMiddle:SetPoint("BOTTOMRIGHT", BannerBottom, 0, 25)
--BannerMiddle:SetAlpha(0)

BossBanner.BannerMiddleGlow = BossBanner:CreateTexture("BannerMiddleGlow", "BACKGROUND")
local BannerMiddleGlow = BossBanner.BannerMiddleGlow
BannerMiddleGlow = SetAtlas(BannerMiddleGlow, "BossBanner-BgBanner-Mid", true)
BannerMiddleGlow:SetBlendMode("ADD")
BannerMiddleGlow:SetPoint("TOPLEFT", BannerTop, 0, -34)
BannerMiddleGlow:SetPoint("BOTTOMRIGHT", BannerBottom, 0, 25)
BannerMiddleGlow:SetAlpha(0)

BannerTop.animForAnimIn = BannerTop:CreateAnimationGroup()
BannerBottom.animForAnimIn = BannerBottom:CreateAnimationGroup()
BannerMiddle.animForAnimIn = BannerMiddle:CreateAnimationGroup()
BannerTopGlow.animForAnimIn = BannerTopGlow:CreateAnimationGroup()
BannerBottomGlow.animForAnimIn = BannerBottomGlow:CreateAnimationGroup()
BannerMiddleGlow.animForAnimIn = BannerMiddleGlow:CreateAnimationGroup()
ACDNumTwo.animForAnimIn = ACDNumTwo:CreateAnimationGroup()
ACDNumThree.animForAnimIn = ACDNumThree:CreateAnimationGroup()

-- Order 2 of AnimIn (with order 1 set to 0.15s endDelay)
CreateAlphaAnim(BannerTop.animForAnimIn, 1, 0, -1, nil, nil, 0.15)
CreateAlphaAnim(BannerTop.animForAnimIn, 2, 0.25, 1, 0.2)
CreateScaleAnim(BannerTop.animForAnimIn, 1, 0, 0.1, 1, 0.15)
CreateScaleAnim(BannerTop.animForAnimIn, 2, 0.3, 10, 1, 0.1)

CreateAlphaAnim(BannerBottom.animForAnimIn, 1, 0, -1, nil, nil, 0.15)
CreateAlphaAnim(BannerBottom.animForAnimIn, 2, 0.25, 1, 0.2)
CreateScaleAnim(BannerBottom.animForAnimIn, 1, 0, 0.1, 1, 0.15)
CreateScaleAnim(BannerBottom.animForAnimIn, 2, 0.3, 10, 1, 0.1)

CreateAlphaAnim(BannerMiddle.animForAnimIn, 1, 0, -1, nil, nil, 0.15)
CreateAlphaAnim(BannerMiddle.animForAnimIn, 2, 0.25, 1, 0.2)
CreateScaleAnim(BannerMiddle.animForAnimIn, 1, 0, 0.1, 1, 0.15)
CreateScaleAnim(BannerMiddle.animForAnimIn, 2, 0.3, 10, 1, 0.1)

CreateAlphaAnim(ACDNumTwo.animForAnimIn, 1, 0, -1, 0.25)
CreateAlphaAnim(ACDNumTwo.animForAnimIn, 2, 0.25, 1)

CreateAlphaAnim(ACDNumThree.animForAnimIn, 1, 0, -1, 0.25)
CreateAlphaAnim(ACDNumThree.animForAnimIn, 2, 0.25, 1)

CreateAlphaAnim(BannerTopGlow.animForAnimIn, 1, 0, -1, nil, nil, 0.15)
CreateAlphaAnim(BannerTopGlow.animForAnimIn, 2, 0.25, 1, 0.9)
CreateScaleAnim(BannerTopGlow.animForAnimIn, 1, 0, 0.5, 1, 0.15)
CreateScaleAnim(BannerTopGlow.animForAnimIn, 2, 0.5, 3.2, 1, 0.9)
CreateAlphaAnim(BannerTopGlow.animForAnimIn, 2, 0.6, -1, 1.1)

CreateAlphaAnim(BannerBottomGlow.animForAnimIn, 1, 0, -1, nil, nil, 0.15)
CreateAlphaAnim(BannerBottomGlow.animForAnimIn, 2, 0.25, 1, 0.9)
CreateScaleAnim(BannerBottomGlow.animForAnimIn, 1, 0, 0.5, 1, 0.15)
CreateScaleAnim(BannerBottomGlow.animForAnimIn, 2, 0.5, 3.2, 1, 0.9)
CreateAlphaAnim(BannerBottomGlow.animForAnimIn, 2, 0.6, -1, 1.1)

CreateAlphaAnim(BannerMiddleGlow.animForAnimIn, 1, 0, -1, nil, nil, 0.15)
CreateAlphaAnim(BannerMiddleGlow.animForAnimIn, 2, 0.25, 1, 0.9)
CreateScaleAnim(BannerMiddleGlow.animForAnimIn, 1, 0, 0.5, 1, 0.15)
CreateScaleAnim(BannerMiddleGlow.animForAnimIn, 2, 0.5, 3.2, 1, 0.9)
CreateAlphaAnim(BannerMiddleGlow.animForAnimIn, 2, 0.6, -1, 1.1)


BossBanner.AnimIn = {}
local AnimIn = BossBanner.AnimIn
AnimIn.BannerTop = BannerTop.animForAnimIn
AnimIn.BannerBottom = BannerBottom.animForAnimIn
AnimIn.BannerMiddle = BannerMiddle.animForAnimIn
AnimIn.BannerTopGlow = BannerTopGlow.animForAnimIn
AnimIn.BannerBottomGlow = BannerBottomGlow.animForAnimIn
AnimIn.BannerMiddleGlow = BannerMiddleGlow.animForAnimIn

BossBanner.AnimOut = BossBanner:CreateAnimationGroup()
CreateAlphaAnim(BossBanner.AnimOut, 1, 0, 1)
CreateAlphaAnim(BossBanner.AnimOut, 1, 0.5, -1)
BossBanner.AnimOut:SetScript("OnFinished", function(self)
    BossBanner:Hide()
end)

AnimIn.Play = function(self)
    if BossBanner.AnimOut:IsPlaying() then
        BossBanner.AnimOut:Stop()
    end

    for _, anim in pairs(self) do
        if type(anim) == "table" then
            anim:Stop()
            anim:Play()
        end
    end
end

AnimIn.Stop = function(self)
    for _, anim in pairs(self) do
        if type(anim) == "table" then
            anim:Stop()
        end
    end
end

local function DetectClass(class1, class2)

    -- testing
    if not class1 and not class2 then
        class1, class2 = determineClass(select(2, UnitClass("arena1")), select(2, UnitClass("arena2")))
    end
    
    if class1 then
        ACDNumTwo:SetTexture(classmarkers[class1])
        ACDNumTwo.animForAnimIn:Stop()
        ACDNumTwo.animForAnimIn:Play()
    else
        ACDNumTwo:SetTexture("")
    end
    
    if class2 then
        ACDNumThree:SetTexture(classmarkers[class2])
        ACDNumThree.animForAnimIn:Stop()
        ACDNumThree.animForAnimIn:Play()
    else
        ACDNumThree:SetTexture("")
    end

    if class1 or class2 then
        BossBanner:Show()
        AnimIn.Play(BossBanner.AnimIn)
        C_Timer.After(2, function()
            BossBanner.AnimOut:Play()
            AnimIn.Stop(BossBanner.AnimIn)
        end)
    end
end

function EICTest()
    DetectClass("ROGUE", "PRIEST")
end

BossBanner:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
BossBanner:SetScript("OnEvent", function(self, event, arg1)
    if arg1 and (string.find(arg1, "The Arena battle has begun!")) then
        PlaySoundFile("Interface\\Addons\\ArenaEnemyClass\\Finish.ogg")
        DetectClass(nil, nil)
    end
end)