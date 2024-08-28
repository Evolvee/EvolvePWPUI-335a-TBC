local frame = CreateFrame("FRAME")   -- Attributes CreateFrame() to a variable for ease of use
local locale = GetLocale()           -- Checks the user's client language and saves it to a variable
frame:RegisterEvent("ADDON_LOADED")  -- Starts listening to the in-game ADDON_LOADED events

local function checkCombatTextStatus()  -- Returns the current state of Floating Combat Text
    return GetCVar("enableFloatingCombatText")
end

SLASH_FCTFIX1 = "/fct"  -- Creates the chat command /fct
SlashCmdList["FCTFIX"] = function()  -- Assings the chat command instructions to:
    if checkCombatTextStatus() == "0" then  -- Toggle the Floating Combat Text based on it's current state
        SetCVar("enableFloatingCombatText", 1)
        print(combatTextIsEnabledMessage[locale])
    else
        SetCVar("enableFloatingCombatText", 0)
        print(combatTextIsDisabledMessage[locale])
    end
end

local function enableCombatText()
    if checkCombatTextStatus() == "0" then  -- If the Floating Combat Text is disabled, warns the user then enables it
        print(combatTextNowEnabledMessage[locale])
        SetCVar("enableFloatingCombatText", 1)
    else  -- If it's enabled, shows a different message
        print(combatTextIsEnabledMessage[locale])
    end
end

local function handleAddonLoaded(event, addOnName)  -- All ADDON_LOADED events are handled here
    if event == "ADDON_LOADED" and addOnName == "FloatingCombatTextFix" then  -- If an addOn loads and is called FloatingCombatTextFix:
        enableCombatText()  -- Runs the function responsible for enabling the Floating Combat Text
    end
    frame:UnregisterEvent("ADDON_LOADED")  -- Stops listening to ADDON_LOADED events
end

frame:SetScript("OnEvent", function(_, event, ...)  -- Runs the function below when the addOn is loaded
    handleAddonLoaded(event, ...)
end)
