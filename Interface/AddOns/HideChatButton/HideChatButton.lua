local HCBframe, hideChat
local NUM_CHAT_WINDOWS = _G.NUM_CHAT_WINDOWS

HCBframe = CreateFrame("Button", "HCBframe", UIParent, "UIPanelButtonTemplate")
HCBframe:SetClampedToScreen(true)
HCBframe:EnableMouse(true)
HCBframe:SetSize(10, 10)
HCBframe:SetAlpha(0.25)
HCBframe:SetPoint("BOTTOMLEFT", 0, 0)
HCBframe:RegisterForClicks("RightButtonUp", "LeftButtonUp");

HCBframe:SetScript("OnClick", function(self)
    hideChat = not hideChat
    for i = 1, NUM_CHAT_WINDOWS do
        for _, v in pairs { "", "Tab" } do
            local f = _G["ChatFrame" .. i .. v]
            if hideChat then
                f.v = f:IsVisible()
            end
            f.ORShow = f.ORShow or f.Show
            f.Show = hideChat and f.Hide or f.ORShow
            if f.v then
                f:Show()
            end
        end
    end
end)

