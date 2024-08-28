--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
	Notes:
]]

BFUILib = BFUILib or nil; local UILib = BFUILib;



--[[
		Input Box element to allow getting user input
--]]
local InputBox = CreateFrame("EDITBOX", "BFInputLine", BFConfigureLayer, "InputBoxTemplate");
InputBox:SetFrameStrata("FULLSCREEN_DIALOG");
InputBox:Hide();

function UILib.InputBox(Ref, AcceptFunc, CancelFunc, Text, Width, Point)

	if (Ref == nil or (InputBox.AcceptFunc == AcceptFunc and InputBox.CancelFunc == CancelFunc and InputBox.Ref == Ref)) then
		--It would appear that the same caller is requesting an inputbox, treat this as a cancel toggle
		InputBox:Cancel();
		return;
	end
	
	InputBox:Cancel();	--Trigger a cancel in the case that we are already editing something else
	
	InputBox.Ref = Ref;	
	InputBox.AcceptFunc = AcceptFunc;
	InputBox.CancelFunc = CancelFunc;	
	InputBox:SetSize(Width, 20); --Height can't be set, although we need to set height to init it	
	InputBox:ClearAllPoints();
	InputBox:SetPoint(unpack(Point));
	InputBox:SetText(Text or "");

	InputBox:Show();
end


function InputBox:Accept()
	if (self.AcceptFunc) then
		self.AcceptFunc(self.Ref, self:GetText());
	end
	
	self.Ref = nil;
	self.AcceptFunc = nil;
	self.CancelFunc = nil;
	self:SetText("");
	
	self:Hide();
end


function InputBox:Cancel()
	if (self.CancelFunc) then
		self.CancelFunc(self.Ref, self:GetText());
	end
	
	self.Ref = nil;
	self.AcceptFunc = nil;
	self.CancelFunc = nil;
	self:SetText("");
	
	self:Hide();
end
InputBox:SetScript("OnEscapePressed", InputBox.Cancel);
InputBox:SetScript("OnEnterPressed", InputBox.Accept);
