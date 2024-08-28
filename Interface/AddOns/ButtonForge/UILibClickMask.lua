--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
	Notes:
]]

local UILib = BFUILib;



--[[
		This is a little (hack) utility to allow clicking a button/bar without actually triggering the buttons secure action, it is expected that whenever the mouse moves over a button
		that we need to click without triggering, this function will be called to position itself over the button to intercept the click
--]]
local ClickButtonMask = CreateFrame("BUTTON", nil, BFConfigureLayer);
ClickButtonMask:Hide();
ClickButtonMask:RegisterForClicks("LeftButtonUp", "RightButtonUp");
ClickButtonMask.HLTexture = ClickButtonMask:CreateTexture();
ClickButtonMask.HLTexture:SetPoint("TOPLEFT", ClickButtonMask, "TOPLEFT");
ClickButtonMask.HLTexture:SetPoint("BOTTOMRIGHT", ClickButtonMask, "BOTTOMRIGHT");
ClickButtonMask.Locked = false;
ClickButtonMask.Inside = false;


--Note that If a Right click function is not set, the primary callbackfunc will be called if right is clicked
function UILib.SetMask(Ref, CallBackFunc, CallBackFuncRight, Widget, Cursor, HighlightTexture, TexCoords)
	if (Ref) then
		if (ClickButtonMask.Locked) then
			return;
		end
		ClickButtonMask.Ref 				= Ref;
		ClickButtonMask.CallBackFunc 		= CallBackFunc;
		ClickButtonMask.CallBackFuncRight 	= CallBackFuncRight;
		ClickButtonMask.Cursor 				= Cursor;
		
		ClickButtonMask:SetParent(Widget);	--I believe by setting the parent the strata and level are auto set
		ClickButtonMask:ClearAllPoints();
		ClickButtonMask:SetPoint("TOPLEFT", Widget, "TOPLEFT");
		ClickButtonMask:SetPoint("BOTTOMRIGHT", Widget, "BOTTOMRIGHT");
		ClickButtonMask:SetFrameLevel(Widget:GetFrameLevel() + 1);
		ClickButtonMask.HLTexture:SetTexture(HighlightTexture, true);
		ClickButtonMask.HLTexture:SetTexCoord(unpack(TexCoords));
		ClickButtonMask:Show();
		
	else
		if (ClickButtonMask.Locked) then
			UILib.UnlockMask();
		end
		ClickButtonMask.Ref 				= nil;
		ClickButtonMask.CallBackFunc 		= nil;
		ClickButtonMask.CallBackFuncRight 	= nil;
		ClickButtonMask.Cursor 				= nil;

		ClickButtonMask:SetParent(BFConfigureLayer);
		ClickButtonMask:ClearAllPoints();
		ClickButtonMask:Hide();
	end

end


function UILib.LockMask()
	ClickButtonMask.Locked = true;
end


function UILib.UnlockMask()
	if (not ClickButtonMask.Inside) then
		ClickButtonMask.HLTexture:Hide();
	end
	ClickButtonMask.Locked = false;
end


function ClickButtonMask:OnClick(Button)
	if (Button == "RightButton") then
		if (self.CallBackFuncRight) then
			self.CallBackFuncRight(self.Ref);
			return;
		end
	end
	
	if (self.CallBackFunc) then
		self.CallBackFunc(self.Ref);
	end
end


function ClickButtonMask:OnEnter()
	self.HLTexture:Show();
	self.Inside = true;
	if (self.Cursor) then
		SetCursor(self.Cursor);
	else
		SetCursor(nil);
	end
end


function ClickButtonMask:OnLeave()
	self.Inside = false;
	if (not self.Locked) then
		self.HLTexture:Hide();
	end
	SetCursor(nil);
end
ClickButtonMask:SetScript("OnEnter", ClickButtonMask.OnEnter);
ClickButtonMask:SetScript("OnLeave", ClickButtonMask.OnLeave);
ClickButtonMask:SetScript("OnClick", ClickButtonMask.OnClick);
