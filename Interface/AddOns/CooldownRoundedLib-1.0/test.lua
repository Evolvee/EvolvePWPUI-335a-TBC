testFrame = CreateFrame("Frame", nil, nil, "CooldownRoundedFrameTemplate")
local f = testFrame 
 f:ClearAllPoints() 
 f:SetPoint("Left", nil, "Left", 510, 300)
f:Show();
SetPortraitToTexture("PlayerPortrait", f.Mask:GetTexture())