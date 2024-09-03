--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
	Notes:
]]

local UILib = BFUILib;
local Util = BFUtil;
local Const = BFConst;

local DragIcon = CreateFrame("FRAME", "ssasm", BFIconDragOverlay);
DragIcon:SetPoint("TOPLEFT", UIParent, "TOPLEFT");
DragIcon:SetFrameStrata("FULLSCREEN_DIALOG");
DragIcon.CornerTexture = DragIcon:CreateTexture();
DragIcon.CornerTexture:SetPoint("TOPLEFT", DragIcon, "TOPLEFT");
DragIcon.CornerTexture:SetPoint("BOTTOMRIGHT", DragIcon, "BOTTOMRIGHT");
DragIcon.CornerTexture:SetTexture(Const.ImagesDir.."Pickup.tga");
DragIcon.CornerTexture:SetDrawLayer("OVERLAY");
DragIcon.Texture = DragIcon:CreateTexture();
DragIcon.Texture:SetPoint("TOPLEFT", DragIcon, "TOPLEFT");
DragIcon.Texture:SetPoint("BOTTOMRIGHT", DragIcon, "BOTTOMRIGHT");

function UILib.StartDraggingIcon(Icon, Width, Height, Command, Data, Subvalue, TexCoords)
	SetCursor("");
	BFIconDragOverlay:Show();
	DragIcon.Texture:SetTexture(Icon);
	DragIcon:SetSize(Width, Height);
	if (TexCoords) then
		DragIcon.Texture:SetTexCoord(unpack(TexCoords));
	else
		DragIcon.Texture:SetTexCoord(0, 1, 0, 1);
	end
	DragIcon.CustomCommand = Command;
	DragIcon.CustomData = Data;
	DragIcon.CustomSubvalue = Subvalue;
	PlaySoundFile("Sound\\Interface\\Uspelliconpickup.Wav");
	Util.CursorAction = true;
	Util.RefreshGridStatus();
	--DragIcon:RegisterEvent("CURSOR_UPDATE");
	DragIcon.Started = true;

end

function UILib.StopDraggingIcon()
	if (DragIcon.CustomCommand) then
		DragIcon:UnregisterEvent("CURSOR_UPDATE");
		DragIcon:UnregisterEvent("CURSOR_UPDATE");
		DragIcon.CustomCommand = nil;
		DragIcon.CustomData = nil;
		DragIcon.CustomSubvalue = nil;
		PlaySoundFile("Sound\\Interface\\Uspellicondrop.Wav");
		SetCursor(nil);
		DragIcon:UnregisterEvent("CURSOR_UPDATE");	
		Util.CursorAction = false;
		Util.RefreshGridStatus();
		BFIconDragOverlay:Hide()
	end
end

function UILib.GetDragInfo()
	return DragIcon.CustomCommand, DragIcon.CustomData, DragIcon.CustomSubvalue;
end

function DragIcon:OnEvent(Event)
	UILib.StopDraggingIcon();
end

function DragIcon:OnUpdate()
	local Left, Top = GetCursorPosition();
	local Scale = UIParent:GetEffectiveScale();

	if (DragIcon.Started) then
		SetCursor("");
		DragIcon.Started = false;
		DragIcon:RegisterEvent("CURSOR_UPDATE");
	end
	if (self.Left ~= Left or self.Top ~= Top) then	
		self.Left = Left;
		self.Top = Top;
		self:ClearAllPoints();
		self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Left / Scale, Top / Scale);
	end
end


DragIcon:SetScript("OnEvent", DragIcon.OnEvent);
DragIcon:SetScript("OnUpdate", DragIcon.OnUpdate);
