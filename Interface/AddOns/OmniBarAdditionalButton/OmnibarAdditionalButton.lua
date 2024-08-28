local OABframe

OABframe = CreateFrame("Button", "OBframe", UIParent, "UIPanelButtonTemplate")
OABframe:SetClampedToScreen(true)
OABframe:EnableMouse(true)
OABframe:SetAlpha(0.25)
OABframe:SetSize(10, 10)
OABframe:SetPoint("TOPRIGHT", 0, 0) -- position it wherever u want FeelsOkayMan
OABframe:RegisterForClicks("RightButtonUp", "LeftButtonUp");
OABframe:RegisterEvent("PLAYER_ENTERING_WORLD")
OABframe:SetScript("OnEvent", function()
    if OmniBar16 then OmniBar16:SetAlpha(0) end -- change OmniBarX where X is the number of the omnibar frame (/fstack) that you want to switch between
end)

OABframe:SetScript("OnClick", function(self)
    if OmniBar16 then
        if OmniBar16:GetAlpha() > 0 then
            OmniBar16:SetAlpha(0)
            OmniBar1:SetAlpha(1)
			ChatFrame1:AddMessage("Additional OmniBar OFF", 255, 0, 0)
        else
            OmniBar16:SetAlpha(1)
            OmniBar1:SetAlpha(0)
			ChatFrame1:AddMessage("Additional OmniBar ON", 0, 205, 255)
        end
    end
end)