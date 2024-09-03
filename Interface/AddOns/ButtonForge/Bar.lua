--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
Notes:	':' syntax represents a function that will be called by an actual BF Bar object
		'.' syntax represents either a function with no object passed or an event that will be called by a UI object (where the Objects ParentBar member will point at the BF Bar object)

]]

BFBar 		= BFBar or {}; 		local Bar = BFBar;
BFUtil 		= BFUtil or {}; 	local Util = BFUtil;
BFConst 	= BFConst or {}; 	local Const = BFConst;
BFUILib 	= BFUILib or {}; 	local UILib = BFUILib;
BFButton	= BFButton or {}; 	local Button = BFButton;
BFKeyBinder = BFKeyBinder or {};local KeyBinder = BFKeyBinder;

Bar.__index = Bar;





--[[
		Create a New Bar
--]]
function Bar.New(BarSave)
	if (InCombatLockdown()) then
		return;
	end
	local NewBar = {};
	setmetatable(NewBar, Bar);
	
	NewBar.LeftControls = {};
	NewBar.TopControls = {};
	--[[	Frames		]]--
		--[[Master Frame for the Bar Controls, also controls positioning via drag]]--
			local ControlFrame = CreateFrame("FRAME", nil, BFConfigureLayer);
			ControlFrame:SetFrameStrata("LOW");
			ControlFrame:SetSize(1, 1);
			ControlFrame:SetClampRectInsets(Const.I, -Const.I, -Const.I, Const.I);
			ControlFrame:SetClampedToScreen(true);
			ControlFrame:EnableMouse(true);
			ControlFrame:SetMovable(true);
			ControlFrame:SetScript("OnMouseDown", NewBar.DragOnMouseDown);
			ControlFrame:SetScript("OnMouseUp", NewBar.DragOnMouseUp);
			ControlFrame:SetScript("OnEnter", NewBar.CFOnEnter);
			ControlFrame.DragOnMouseUp = NewBar.DragOnMouseUp;
			ControlFrame.ParentBar = NewBar;
			NewBar.ControlFrame = ControlFrame;
		
		--[[Destroy Frame, this is usually hidden, but will become active when the Destroy mode is enabled, if clicked it will destroy the Bar]]--
			local DestroyFrame = CreateFrame("FRAME", nil, BFDestroyBarOverlay);
			DestroyFrame:EnableMouse(true);
			DestroyFrame:SetPoint("TOPLEFT", ControlFrame, "TOPLEFT");
			DestroyFrame:SetPoint("BOTTOMRIGHT", ControlFrame, "BOTTOMRIGHT");
			DestroyFrame:SetScript("OnEnter", NewBar.DestroyFrameOnEnter);
			DestroyFrame.ParentBar = NewBar;
			NewBar.DestroyFrame = DestroyFrame;
		
		--[[Button Frame, this contains the actual buttons,	this will also control visibility through a state driver for the buttons]]--
			local ButtonFrame = CreateFrame("FRAME", nil, UIParent, "SecureHandlerShowHideTemplate");
			--Const.BarSeq = Const.BarSeq + 1; Const.BarNaming..Const.BarSeq
			--ButtonFrame:SetParent(UIParent);
			ButtonFrame:SetFrameStrata("LOW");
			ButtonFrame:SetSize(1, 1);
			ButtonFrame:SetPoint("TOPLEFT", ControlFrame, "TOPLEFT", Const.I, -Const.I);
			ButtonFrame:Execute([[Buttons = newtable();]]);
			ButtonFrame:SetAttribute("_onshow", [[local B, Key;
												for i = 1, #Buttons do
													B = Buttons[i];
													B:Enable(); 
													Key = B:GetAttribute("KeyBindValue"); 
													if (Key) then 
														B:SetBindingClick(false, Key, B);
													end
												end]]);	--When the bar is shown enable the buttons
			ButtonFrame:SetAttribute("_onhide", [[local B, Key;
												for i = 1, #Buttons do 
													B = Buttons[i];
													B:Disable();
													Key = B:GetAttribute("KeyBindValue");
													if (Key) then
														B:ClearBindings();
													end
												end]]);	--When the bar is hidden disable them
			ButtonFrame:WrapScript(BFSecureForCombatFrame, "OnAttributeChanged",
												[[local B;
												if ((not GridAlwaysOn) and value == "true") then
													for i = 1, #Buttons do
														B = Buttons[i];
														if (not B:GetAttribute("type")) then
															B:Hide();
														end
													end
												end]]);	--When the bar has grid hide and the user enters combat ensure the grid is actually hidden (unfortunately there are not many other options apart from this heavy handed approach)
			ButtonFrame.ParentBar = NewBar;
			NewBar.ButtonFrame = ButtonFrame;
		
		--[[Background Layer, this will contain all controls and is used in resizing]]--
			local Background = CreateFrame("FRAME", nil, ControlFrame);
			Background:SetSize(1, 1);
			Background:SetPoint("TOPLEFT", ControlFrame, "TOPLEFT");
			Background:SetBackdrop({bgFile = Const.ImagesDir.."Backdrop.tga", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = {left=3, right=3, bottom=3, top=3}});
			--Background:SetBackdrop({bgFile = Const.ImagesDir.."Backdrop.tga", edgeFile = "", tile = true, tileSize = 16, edgeSize = 16, insets = nil});
			Background:SetBackdropColor(unpack(Const.BarBackdrop));
			Background.ParentBar = NewBar;
			NewBar.Background = Background;
		
		--[[Advanced Layer, this will contain advanced controls]]--
			local AdvFrame = CreateFrame("FRAME", nil, BFAdvancedToolsLayer);
			AdvFrame:SetSize(1, 1);
			AdvFrame:SetScript("OnShow", NewBar.AdvFrameOnShowHide);
			AdvFrame:SetScript("OnHide", NewBar.AdvFrameOnShowHide);
			AdvFrame.ParentBar = NewBar;
			NewBar.AdvFrame = AdvFrame;
		
		--[[Left Controls]]--
			local LeftIconsFrame = CreateFrame("FRAME", nil, ControlFrame);
			LeftIconsFrame:SetSize(Const.MiniIconSize + Const.BarEdge, 1);
			LeftIconsFrame:SetPoint("TOPLEFT", Background, "TOPLEFT", 0, 0);
			LeftIconsFrame:SetClampedToScreen(true);
			NewBar.LeftIconsFrame = LeftIconsFrame;
		
		--[[Top Controls]]--
			local TopIconsFrame = CreateFrame("FRAME", nil, ControlFrame);
			TopIconsFrame:SetSize(1, Const.MiniIconSize + Const.BarEdge);
			TopIconsFrame:SetPoint("TOPLEFT", Background, "TOPLEFT", 0, 0);
			TopIconsFrame:SetPoint("TOPLEFT", LeftIconsFrame, "TOPLEFT", 0, 0);
			TopIconsFrame:SetClampedToScreen(true);
			NewBar.TopIconsFrame = TopIconsFrame;
			
		--[[Tile Texture, used to indicate where new buttons will be created when the cols and rows buttons are used]]--
			local TileTexture = Background:CreateTexture();
			TileTexture:SetTexture(Const.ImagesDir.."BarBackdrop.tga", true);
			TileTexture:SetAlpha(.3);
			TileTexture:SetPoint("TOPLEFT", Background, "TOPLEFT", Const.I, -Const.I);
			TileTexture:Hide();
			NewBar.TileTexture = TileTexture;
		
		--[[Label Frame]]--
			local LabelFrame = CreateFrame("FRAME", nil, ControlFrame);
			LabelFrame:SetSize(1, 1);
			LabelFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 8, insets = {left=1.5, right=1.5, bottom=1.5, top=1.5}});
			LabelFrame:SetBackdropColor(0, 0, 0, 1);
			LabelFrame:SetPoint("TOPLEFT", TopIconsFrame, "TOPLEFT", Const.BarInset, -Const.BarEdge); --Const.MiniIconSize + Const.MiniIconGap +Const.BarEdge, -Const.BarEdge);
			LabelFrame:Hide();
			LabelFrame.Text = LabelFrame:CreateFontString(nil, nil, "GameFontNormal");
			LabelFrame.Text:SetPoint("TOPLEFT", LabelFrame, "TOPLEFT", 2, -1);
			LabelFrame.ParentBar = NewBar;
			NewBar.LabelFrame = LabelFrame;
	--[[	]]--
	
	
	--[[	Basic Controls		]]--
		--[[Scale Button]]--
			NewBar.ScaleButton = UILib.CreateButton(Background, Const.MiniIconSize, Const.MiniIconSize,--parent, width, height
													{"BOTTOMRIGHT", Background, "BOTTOMRIGHT", -2.5, 2.5},----Const.BarEdge + 1.5, Const.BarEdge - 1.5},	--Point
													Const.ImagesDir.."DragScale.tga",		--Norm
													nil,								--Push
													nil,								--Check
													Const.ImagesDir.."DragScaleHighlight.tga", --Highlight
													Util.GetLocaleString("ScaleTooltip"),
													nil, NewBar.ScaleStart, NewBar.ScaleStop, "ANCHOR_BOTTOMRIGHT");	--OnClick, On M Down, On M Up, Tooltip anchor point
			NewBar.ScaleButton:SetClampedToScreen(true);
			NewBar.ScaleButton.ParentBar = NewBar;											

		--[[Cols Button]]--
			NewBar.ColsButton = UILib.CreateButton(Background, 16, 32,		--parent, width, height
													{"LEFT", Background, "RIGHT", -3, 0},	--Point
													Const.ImagesDir.."DragCols.tga",		--Norm
													nil,								--Push
													nil,								--Check
													Const.ImagesDir.."DragColsHighlight.tga", --"Interface\\Buttons\\ButtonHilight-Square", --Highlight
													Util.GetLocaleString("ColsTooltip"),
													nil, NewBar.ColsStart, NewBar.ColsStop, "ANCHOR_BOTTOMRIGHT");	--OnClick, On M Down, On M Up, Tooltip anchor point
			--NewBar.ColsButton:SetClampedToScreen(true);
			NewBar.ColsButton.ParentBar = NewBar;
			
		--[[Rows Button]]--
			NewBar.RowsButton = UILib.CreateButton(Background, 32, 16,		--parent, width, height
													{"TOP", Background, "BOTTOM", 0, 3},	--Point
													Const.ImagesDir.."DragRows.tga",		--Norm
													nil,								--Push
													nil,								--Check
													Const.ImagesDir.."DragRowsHighlight.tga", --Highlight
													Util.GetLocaleString("RowsTooltip"),
													nil, NewBar.RowsStart, NewBar.RowsStop, "ANCHOR_BOTTOMRIGHT");	--OnClick, On M Down, On M Up, Tooltip anchor point
			--NewBar.RowsButton:SetClampedToScreen(true);
			NewBar.RowsButton.ParentBar = NewBar;
		
	--[[	]]--
	
	
	--[[	Advanced Controls		]]--
		--[[KeyBind Mode]]--
			NewBar.KBButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height,
												{"TOPRIGHT", TopIconsFrame, "TOPRIGHT", 0 - (Const.MiniIconSize + Const.MiniIconGap) * 5 -Const.BarEdge, -Const.BarEdge},	--Point
												Const.ImagesDir.."KeyBind.tga",			--Norm
												Const.ImagesDir.."KeyBindPushed.tga", 			--Push
												"Interface/Buttons/CheckButtonHilight", 	--Check
												"Interface/Buttons/ButtonHilight-Square", --Hilight,
												Util.GetLocaleString("KeyBindModeTooltip"),
												NewBar.KeyBindMode, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.KBButton.ParentBar = NewBar;
			table.insert(NewBar.TopControls, NewBar.KBButton);

		--[[Tooltips On Off]]--
			NewBar.TooltipButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height,
												{"TOPRIGHT", TopIconsFrame, "TOPRIGHT", 0 - (Const.MiniIconSize + Const.MiniIconGap) * 4 -Const.BarEdge, -Const.BarEdge},	--Point
												Const.ImagesDir.."TooltipOn.tga",			--Norm
												nil, 			--Push
												nil,		 	--Check
												"Interface/Buttons/ButtonHilight-Square", --Hilight,
												Util.GetLocaleString("TooltipsTooltip"),
												NewBar.ToggleTooltips, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.TooltipButton.ParentBar = NewBar;
			table.insert(NewBar.TopControls, NewBar.TooltipButton);
			
		--[[ButtonLock On Off]]--
			NewBar.LockButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height,
												{"TOPRIGHT", TopIconsFrame, "TOPRIGHT", 0 - (Const.MiniIconSize + Const.MiniIconGap) * 3 -Const.BarEdge, -Const.BarEdge},	--Point
												Const.ImagesDir.."ButtonsUnlocked.tga",			--Norm
												nil, 			--Push
												nil,		 	--Check
												"Interface/Buttons/ButtonHilight-Square", --Hilight,
												Util.GetLocaleString("ButtonLockTooltip"),
												NewBar.ToggleButtonsLocked, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.LockButton.ParentBar = NewBar;
			table.insert(NewBar.TopControls, NewBar.LockButton);
			
		--[[Grid On Off]]--
			NewBar.GridButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height,
												{"TOPRIGHT", TopIconsFrame, "TOPRIGHT", 0 - (Const.MiniIconSize + Const.MiniIconGap) * 2 -Const.BarEdge, -Const.BarEdge},	--Point
												Const.ImagesDir.."GridOn.tga",			--Norm
												nil, 			--Push
												nil,		 	--Check
												"Interface/Buttons/ButtonHilight-Square", --Hilight,
												Util.GetLocaleString("GridTooltip"),
												NewBar.ToggleGrid, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.GridButton.ParentBar = NewBar;
			table.insert(NewBar.TopControls, NewBar.GridButton);			
			
		--[[Send To Front]]--
			NewBar.STFButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height
														{"TOPRIGHT", TopIconsFrame, "TOPRIGHT", 0 - Const.MiniIconSize - Const.MiniIconGap -Const.BarEdge, -Const.BarEdge},	--Point
														Const.ImagesDir.."STF.tga", --Norm
														Const.ImagesDir.."STFPushed.tga", --Push
														nil,								--Check
														"Interface/Buttons/ButtonHilight-Square", --Hilight
														Util.GetLocaleString("SendToFrontTooltip"),
														NewBar.SendToFront, nil, nil);		--OnClick, On M Down, On M Up
			NewBar.STFButton.ParentBar = NewBar;
			table.insert(NewBar.TopControls, NewBar.STFButton);

		--[[Send To Back]]--
			NewBar.STBButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height
														{"TOPRIGHT", TopIconsFrame, "TOPRIGHT", -Const.BarEdge, -Const.BarEdge},	--Point
														Const.ImagesDir.."STB.tga", --Norm
														Const.ImagesDir.."STBPushed.tga", --Push
														nil, 								--Check
														"Interface/Buttons/ButtonHilight-Square", --Hilight
														Util.GetLocaleString("SendToBackTooltip"),
														NewBar.SendToBack, nil, nil);		--OnClick, On M Down, On M Up
			NewBar.STBButton.ParentBar = NewBar;
			table.insert(NewBar.TopControls, NewBar.STBButton);


	--[[	]]--			
		--[[Label Edit]]--
			NewBar.LabelButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height,
												{"TOPLEFT", TopIconsFrame, "TOPLEFT", Const.BarEdge, -Const.BarEdge},	--Point
												Const.ImagesDir.."Label.tga",			--Norm
												Const.ImagesDir.."LabelPushed.tga", 			--Push
												"Interface/Buttons/CheckButtonHilight", 	--Check
												"Interface/Buttons/ButtonHilight-Square", --Hilight,
												Util.GetLocaleString("LabelModeTooltip"),
												NewBar.InputLabel, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.LabelButton.ParentBar = NewBar;
			--table.insert(NewBar.LeftControls, NewBar.LabelButton);

		--[[Hide On Talent 1 Button]]--
			NewBar.HSpec1Button = UILib.CreateButton(Background, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height
													{"TOPLEFT", LeftIconsFrame, "TOPLEFT", Const.BarEdge, -(Const.MiniIconSize + Const.MiniIconGap) * 1 -Const.BarEdge},	--Point
													Const.ImagesDir.."Spec1On.tga",		--Norm
													nil,								--Push
													nil,								--Check
													"Interface/Buttons/ButtonHilight-Square", --Highlight
													Util.GetLocaleString("HideSpec1Tooltip"),
													NewBar.ToggleHSpec1, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.HSpec1Button.ParentBar = NewBar;
			table.insert(NewBar.LeftControls, NewBar.HSpec1Button);

		--[[Hide On Talent 2 Button]]--
			NewBar.HSpec2Button = UILib.CreateButton(Background, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height
													{"TOPLEFT", LeftIconsFrame, "TOPLEFT", Const.BarEdge, -(Const.MiniIconSize + Const.MiniIconGap) * 2 -Const.BarEdge},	--Point
													Const.ImagesDir.."Spec2On.tga",		--Norm
													nil,								--Push
													nil,								--Check
													"Interface/Buttons/ButtonHilight-Square", --Highlight
													Util.GetLocaleString("HideSpec2Tooltip"),
													NewBar.ToggleHSpec2, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.HSpec2Button.ParentBar = NewBar;
			table.insert(NewBar.LeftControls, NewBar.HSpec2Button);
		
		--[[Hide On Vehicle Button]]--
			NewBar.HVehicleButton = UILib.CreateButton(Background, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height
													{"TOPLEFT", LeftIconsFrame, "TOPLEFT", Const.BarEdge, -(Const.MiniIconSize + Const.MiniIconGap) * 3 -Const.BarEdge},	--Point
													Const.ImagesDir.."VehicleOff.tga",		--Norm
													nil,								--Push
													nil,								--Check
													"Interface/Buttons/ButtonHilight-Square", --Highlight
													Util.GetLocaleString("HideVehicleTooltip"),
													NewBar.ToggleHVehicle, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.HVehicleButton.ParentBar = NewBar;
			table.insert(NewBar.LeftControls, NewBar.HVehicleButton);

		--[[Hide On Bonus Bar 5 (the special bar)]]--
			NewBar.HBonusBarButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height
													{"TOPLEFT", LeftIconsFrame, "TOPLEFT", Const.BarEdge, -(Const.MiniIconSize + Const.MiniIconGap) * 4 -Const.BarEdge},	--Point
													Const.ImagesDir.."BonusBarOff.tga",		--Norm
													nil,								--Push
													nil,								--Check
													"Interface/Buttons/ButtonHilight-Square", --Highlight
													Util.GetLocaleString("HideBonusBarTooltip"),
													NewBar.ToggleHBonusBar, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.HBonusBarButton.ParentBar = NewBar;
			table.insert(NewBar.LeftControls, NewBar.HBonusBarButton);
			
		--[[Visibility Driver]]--
			NewBar.VDButton = UILib.CreateButton(AdvFrame, Const.MiniIconSize, Const.MiniIconSize,		--parent, width, height,
												{"TOPLEFT", LeftIconsFrame, "TOPLEFT", Const.BarEdge, -(Const.MiniIconSize + Const.MiniIconGap) * 5 -Const.BarEdge},	--Point
												Const.ImagesDir.."VDriver.tga",			--Norm
												Const.ImagesDir.."VDriverSet.tga", 			--Push
												"Interface/Buttons/CheckButtonHilight", 	--Check
												"Interface/Buttons/ButtonHilight-Square", --Hilight,
												Util.GetLocaleString("VisibilityTooltip")..Util.GetLocaleString("VisibilityEgTooltip"),
												NewBar.InputVD, nil, nil);	--OnClick, On M Down, On M Up
			NewBar.VDButton.ParentBar = NewBar;
			table.insert(NewBar.LeftControls, NewBar.VDButton);
			
	NewBar:Configure(BarSave);

	return NewBar;
end



function Bar:Deallocate()
	if (InCombatLockdown()) then
		return;
	end
	self:SetNumButtons(0, 0);
	self.SendToFront(self.STFButton);
	self.ControlFrame:Hide();
	self.DestroyFrame:Hide();
	self.LabelFrame:ClearAllPoints();	--Not really needed but figure it will be nicer if this is not left attached to a potentially in use tab container
	UnregisterStateDriver(self.ButtonFrame, "visibility");
	self.ButtonFrame:Hide();
	self.AdvFrame:Hide();
end



--[[
		Configure the bar before using it (DO NOT call this for a bar already in use, it must first be Deallocated);
--]]
function Bar:Configure(BarSave)
	if (InCombatLockdown()) then
		return;
	end
	
	if (BarSave.BonusBar) then
		self.Background:SetBackdropColor(unpack(Const.BonusBarBackdrop));
	else
		self.Background:SetBackdropColor(unpack(Const.BarBackdrop));
	end
	
	self.BarSave = BarSave;
	self.Cols = 0;
	self.Rows = 0;	
	self.Buttons = {};
	self.ScaleClickTime = 0;
	self.TempVDSet = BFConfigureLayer:IsShown();
	
	self.ControlFrame:Show();
	self.DestroyFrame:Show();
	self.ButtonFrame:Show();
	self.AdvFrame:Show();
	
	self:SetPosition(BarSave["Left"], BarSave["Top"]);
	self:SetScale(BarSave["Scale"]);

	self:SetOrder(BarSave["Order"]);
	self:SetLabel(BarSave["Label"]);

	if (#BarSave["Buttons"] > 0) then
		self:SetButtonsFromSave();
	else
		self:SetNumButtons(BarSave["Cols"], BarSave["Rows"]);
	end
	
	self:SetHSpec1(BarSave["HSpec1"]);
	self:SetHSpec2(BarSave["HSpec2"]);
	self:SetHVehicle(BarSave["HVehicle"]);
	self:SetHBonusBar(BarSave["HBonusBar"]);
	self:SetVD(BarSave["VDriver"]);
	self:SetGridAlwaysOn(BarSave["GridAlwaysOn"]);
	self:SetButtonsLocked(BarSave["ButtonsLocked"]);
	self:SetTooltips(BarSave["TooltipsOn"]);
end

--[[
		Bar Set functions
--]]
function Bar:SetPosition(Left, Top)
	local CFrame = self.ControlFrame;
	
	Left = Left or CFrame:GetLeft();
	Top = Top or CFrame:GetTop();
	
	CFrame:ClearAllPoints();
	CFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Left, Top);
	
	Util.RefreshTab(CFrame:GetLeft(), CFrame:GetTop());
	
	self.BarSave["Left"] = Left;
	self.BarSave["Top"] = Top;
end

function Bar:SetScale(Scale, NoCheck)
	local BFrame = self.ButtonFrame;
	local Left, Top = self.ControlFrame:GetLeft(), self.ControlFrame:GetTop();
	local CurrentScale = self.BarSave["Scale"];
	Scale = Scale or CurrentScale;
	
	BFrame:SetScale(Scale);
	BFrame:ClearAllPoints();
	BFrame:SetPoint("TOPLEFT", self.ControlFrame, "TOPLEFT", Const.I / Scale, -Const.I / Scale);

	self.BarSave["Scale"] = Scale;
	
	self:UpdateSize();
	if (not NoCheck) then
		if (self.ControlFrame:GetLeft() ~= Left or self.ControlFrame:GetTop() ~= Top) then
			self:SetScale(CurrentScale, true);
			self:SetPosition(Left, Top);
		end
	end
end

function Bar:SetButtonsFromSave()
	if (InCombatLockdown()) then
		return;
	end
	local BFrame = self.ButtonFrame;
	local Buttons = self.Buttons;
	local Cols = self.BarSave["Cols"];
	local Rows = self.BarSave["Rows"];

	for r = 1, Rows do
		for c = 1, Cols do
			local i = (r-1) * Cols + c;
			local NewButton = Util.NewButton(self.ButtonFrame, self.BarSave["Buttons"][i], self.BarSave["ButtonsLocked"], self.BarSave["TooltipsOn"]);
			table.insert(self.Buttons, i, NewButton);
			NewButton.Widget:SetPoint("TOPLEFT", self.ButtonFrame, "TOPLEFT", (c-1) * Const.BSize, (1-r) * Const.BSize);
		end
	end
	
	self.Cols = Cols;
	self.Rows = Rows;
	
	BFrame:Execute([[wipe(Buttons);]]);
	for i = 1, #Buttons do
		BFrame:SetFrameRef("Button", Buttons[i].Widget);
		BFrame:Execute([[tinsert(Buttons, owner:GetFrameRef("Button"));]]);
	end
	--self.ButtonFrame:Execute("Buttons = newtable(owner:GetChildren());");
	self:UpdateSize();
end

function Bar:SetNumButtons(Cols, Rows)
	if (InCombatLockdown()) then
		return;
	end
	
	if (Cols * Rows > self.Cols * self.Rows) then
		if (Cols * Rows > Const.MaxButtonsPerBar or #Util.ActiveButtons + Cols * Rows - self.Cols * self.Rows > Const.MaxButtonsTotal) then
			return;
		end
	end
	
	local Buttons = self.Buttons;
	local BFrame = self.ButtonFrame;
	--First deallocate any buttons from removed rows
	if (self.Rows > Rows) then
		for i = self.Cols*self.Rows, self.Cols*Rows+1, -1 do
			Util.DeallocateButton(Buttons[i]);
			table.remove(Buttons);	
		end
		self.Rows = Rows;
	end
	--Now deallocate any from removed columns
	if (self.Cols > Cols) then
		for r = self.Rows, 1, - 1 do
			for c = self.Cols, Cols + 1, - 1 do
				local i = (r-1) * self.Cols + c;
				Util.DeallocateButton(Buttons[i]);
				table.remove(Buttons, i);
			end
		end
		self.Cols = Cols;
	end
	
	--Now allocate added columns
	for r = 1, self.Rows do
		for c = self.Cols+1, Cols do
			local i = (r-1) * Cols + c;
			local ButtonSave = {};
			local NewButton = Util.NewButton(BFrame, ButtonSave, self.BarSave["ButtonsLocked"], self.BarSave["TooltipsOn"]);
			table.insert(Buttons, i, NewButton);
			NewButton.Widget:SetPoint("TOPLEFT", BFrame, "TOPLEFT", (c-1) * Const.BSize, (1-r) * Const.BSize);
		end
	end
	self.Cols = Cols;
	
	--And finally allocate added rows
	for r = self.Rows+1, Rows do
		for c = 1, Cols do
			local i = (r-1) * Cols + c;
			local ButtonSave = {}; 
			local NewButton = Util.NewButton(BFrame, ButtonSave, self.BarSave["ButtonsLocked"], self.BarSave["TooltipsOn"]);
			table.insert(Buttons, i, NewButton);
			NewButton.Widget:SetPoint("TOPLEFT", BFrame, "TOPLEFT", (c-1) * Const.BSize, (1-r) * Const.BSize);			
		end
	end
	self.Rows = Rows;

	--Now create a new array for the buttons and store it to BarSave;
	BFrame:Execute([[wipe(Buttons);]]);
	local TempButtonsSave = {};
	for i = 1, #Buttons do
		if (self.BarSave["BonusBar"]) then
			if (i <= 12 and (not Buttons[i].Mode) and (not Util.BarHasButton(self, "bonusaction", i))) then
				Buttons[i]:SetCommandBonusAction(i);
				Buttons[i]:FullRefresh();
			elseif (i == 13 and (not Buttons[i].Mode) and (not Util.BarHasButton(self, "customaction", "vehicleexit"))) then
				Buttons[i]:SetCommandCustomAction("vehicleexit");
				Buttons[i]:FullRefresh();
			elseif (i == 14 and (not Buttons[i].Mode) and (not Util.BarHasButton(self, "customaction", "possesscancel"))) then
				Buttons[i]:SetCommandCustomAction("possesscancel");
				Buttons[i]:FullRefresh();
			end
		end
		tinsert(TempButtonsSave, Buttons[i].ButtonSave);
		BFrame:SetFrameRef("Button", Buttons[i].Widget);
		BFrame:Execute([[tinsert(Buttons, owner:GetFrameRef("Button"));]]);
	end
	
	self.BarSave["Cols"] = Cols;
	self.BarSave["Rows"] = Rows;
	self.BarSave["Buttons"] = TempButtonsSave;
	
--	self.ButtonFrame:Execute("Buttons = newtable(owner:GetChildren());");
	self:SetGridAlwaysOn(self.BarSave["GridAlwaysOn"]);
	self:SetTooltips(self.BarSave["TooltipsOn"]);
	self:UpdateSize();
end



--[[
		Size update functions
--]]
function Bar:UpdateSize()
	local CFrame = self.ControlFrame;
	local Left = CFrame:GetLeft();
	local Top = CFrame:GetTop();
		
	self:UpdateControlFrameSize();
	self:UpdateBackgroundSize();
	self:UpdateTileSize(self.Cols, self.Rows);
	self:ReflowUI();
	
	self.BarSave["Left"] = Left;
	self.BarSave["Top"] = Top;
end

function Bar:UpdateControlFrameSize()
	if (InCombatLockdown()) then
		return;
	end
	local CFrame = self.ControlFrame;
	local Scale = self.BarSave["Scale"];
	local BWidth = (self.Cols * Const.BSize - Const.BG) * Scale;
	local BHeight = (self.Rows * Const.BSize - Const.BG) * Scale;
	local Left = CFrame:GetLeft();
	local Top = CFrame:GetTop();
	self.ControlFrame:SetSize(BWidth + Const.I2, BHeight + Const.I2);
	CFrame:ClearAllPoints();
	CFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Left, Top);
end

function Bar:UpdateBackgroundSize()
	local CFrame = self.ControlFrame;
	local Background = self.Background;
	Background:SetSize(CFrame:GetWidth(), CFrame:GetHeight());
	Background:ClearAllPoints();
	Background:SetPoint("TOPLEFT", CFrame, "TOPLEFT");
end

function Bar:UpdateTileSize(Cols, Rows)
	local Scale = self.BarSave["Scale"];
	local Tile = self.TileTexture;
	local BWidth = (Cols * Const.BSize - Const.BG) * Scale;
	local BHeight = (Rows * Const.BSize - Const.BG) * Scale;
	
	Tile:SetSize(BWidth, BHeight);
	Tile:SetTexCoord(0, Cols - Const.GFrac, 0, Rows - Const.GFrac);
end

function Bar:ReflowUI()
	local Width, Height = self.Background:GetWidth(), self.Background:GetHeight();
	local LeftSize 		= Height - Const.BarEdge * 2 - Const.MiniIconSize;
	local BottomSize 	= Width - Const.BarInset - Const.MiniIconSize - Const.BarEdge - Const.MiniIconGap;
	local TopSize 		= Width - Const.BarInset - Const.BarEdge;
	local RightSize 	= Height - Const.BarInset - Const.MiniIconSize - Const.BarEdge - Const.MiniIconGap;
	local TopIconsWidth = Width;
	local LeftIconsHeight= Height;
	if (self.LabelFrame:GetWidth() > 0 and not self.Tabbed) then
		TopSize = TopSize - self.LabelFrame:GetWidth() - Const.MiniIconGap;
	end
	
	local LeftCapacity 		= math.max(math.floor(LeftSize / (Const.MiniIconSize + Const.MiniIconGap)), 0);	
	local BottomCapacity 	= math.max(math.floor(BottomSize / (Const.MiniIconSize + Const.MiniIconGap)), 0);	
	local TopCapacity 		= math.max(math.floor(TopSize / (Const.MiniIconSize + Const.MiniIconGap)), 0);	
	local RightCapacity 	= math.max(math.floor(RightSize / (Const.MiniIconSize + Const.MiniIconGap)), 0);	


	if (self.LeftCapacity == LeftCapacity and self.BottomCapacity == BottomCapacity and self.TopCapacity == TopCapacity and	self.RightCapacity == RightCapacity and self.AdvFrameShown == BFAdvancedToolsLayer:IsShown()) then
		return;
	end
	
	self.LeftCapacity = LeftCapacity;
	self.BottomCapacity = BottomCapacity;
	self.TopCapacity = TopCapacity;
	self.RightCapacity = RightCapacity;
	self.AdvFrameShown = BFAdvancedToolsLayer:IsShown();
	--reflow the left buttons
	local LeftCount = #self.LeftControls;
	if (not BFAdvancedToolsLayer:IsShown()) then
		LeftCount = LeftCount - 1;
	end
	
	self.LeftIconsFrame:ClearAllPoints();	
	if (LeftCapacity + BottomCapacity < LeftCount) then
		LeftIconsHeight = Const.BarEdge + (Const.MiniIconSize + Const.MiniIconGap) * LeftCount + Const.MiniIconSize;
		LeftCapacity = LeftCount;
		self.LeftIconsFrame:SetPoint("TOPLEFT", self.Background);
		self.LeftIconsFrame:SetHeight(LeftIconsHeight);
	else
		self.LeftIconsFrame:SetPoint("TOPLEFT", self.Background);
		self.LeftIconsFrame:SetPoint("BOTTOMLEFT", self.Background);
	end




	if (LeftCapacity > LeftCount) then
		LeftCapacity = LeftCount;
	end
	
	for i = 1, LeftCapacity do
		self.LeftControls[i]:ClearAllPoints();
		self.LeftControls[i]:SetPoint("TOPLEFT", self.LeftIconsFrame, "TOPLEFT", Const.BarEdge, - Const.BarEdge - i * (Const.MiniIconSize + Const.MiniIconGap));
	end
	
	for i = LeftCapacity + 1, LeftCount do
		self.LeftControls[i]:ClearAllPoints();
		self.LeftControls[i]:SetPoint("BOTTOMLEFT", self.LeftIconsFrame, "BOTTOMLEFT", Const.BarEdge + (Const.MiniIconSize + Const.MiniIconGap) * (i - LeftCapacity), Const.BarEdge);		
	end

	--reflow the upper right buttons
	local TopCount = #self.TopControls;
	self.TopIconsFrame:ClearAllPoints();
	self.TopIconsFrame:SetPoint("TOPLEFT", self.LeftIconsFrame);
	if (TopCapacity + RightCapacity < TopCount) then
		TopIconsWidth = Const.BarInset + (Const.MiniIconSize + Const.MiniIconGap) * TopCount + Const.BarEdge;
		if (self.LabelFrame:GetWidth() > 0 and not self.Tabbed) then
			TopIconsWidth = TopIconsWidth + self.LabelFrame:GetWidth() + Const.MiniIconGap;
		end
		TopCapacity = TopCount;
		--self.TopIconsFrame:SetPoint("TOPLEFT", self.Background);
		self.TopIconsFrame:SetWidth(TopIconsWidth);
	else
		self.TopIconsFrame:SetPoint("TOPLEFT", self.Background);
		self.TopIconsFrame:SetPoint("TOPRIGHT", self.Background);
	end
	
	if (TopCapacity > TopCount) then
		TopCapacity = TopCount;
	end
	for i = 1, TopCapacity do
		self.TopControls[i]:ClearAllPoints();
		self.TopControls[i]:SetPoint("TOPRIGHT", self.TopIconsFrame, "TOPRIGHT", - Const.BarEdge - (TopCapacity - i) * (Const.MiniIconSize + Const.MiniIconGap), -Const.BarEdge);
	end
	
	for i = TopCapacity + 1, TopCount do
		self.TopControls[i]:ClearAllPoints();
		self.TopControls[i]:SetPoint("TOPRIGHT", self.TopIconsFrame, "TOPRIGHT", - Const.BarEdge, - Const.BarEdge - (i - TopCapacity) * (Const.MiniIconSize + Const.MiniIconGap));
	end

end

--[[
		Control the appearance of the Mouse while over the bar
--]]
function Bar.CFOnEnter(Widget)
	local self = Widget.ParentBar;
	if (KeyBinder.SelectedBar == self and KeyBinder.SelectedButton == nil) then
		SetCursor("CAST_CURSOR");
	elseif (not UILib.GetDragInfo()) then
		SetCursor(nil);
	end
end


function Bar.AdvFrameOnShowHide(Widget)
	Widget.ParentBar:ReflowUI();
end



--[[
		Handles Dragging the bar
--]]
function Bar.DragOnMouseDown(ControlFrame, ButtonName)
	ControlFrame:StartMoving();
	ControlFrame.ParentBar.PLeft = 0;
	ControlFrame.ParentBar.PTop = 0;
	ControlFrame:SetScript("OnUpdate", Bar.DragOnUpdate);
end
function Bar.DragOnMouseUp(ControlFrame, ButtonName)
	local self = ControlFrame.ParentBar;
	ControlFrame:StopMovingOrSizing();
	self.BarSave["Left"] = ControlFrame:GetLeft();
	self.BarSave["Top"] = ControlFrame:GetTop();
	if (not InCombatLockdown()) then
		ControlFrame:ClearAllPoints();
		ControlFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", self.BarSave["Left"], self.BarSave["Top"]);
	end
	
	Util.RefreshTab(ControlFrame:GetLeft(), ControlFrame:GetTop());

	ControlFrame:SetScript("OnUpdate", nil);
	if (ButtonName == "RightButton") then
		if (KeyBinder.SelectedBar == self and KeyBinder.SelectedButton == nil) then
			KeyBinder.CancelButtonSelectorMode();
		end
	end
end
function Bar.DragOnUpdate(Widget)

	local WLeft, WTop = Widget:GetLeft(), Widget:GetTop();
	local Left, Top, Dist = Util.DockCoords(WLeft, WTop, Widget.ParentBar);
	if (InCombatLockdown()) then
		Widget.ParentBar.PLeft = 0;
		Widget.ParentBar.PTop = 0;
		if (Widget.ParentBar.Tabbed) then
			Util.RefreshTab(Left, Top);
			Util.RefreshTab(Widget:GetLeft(), Widget:GetTop());
		end
		return;
	end	
	local PDist;
	
	if (Dist < 144) then
		Widget.ParentBar.PLeft = Widget.ParentBar.PLeft + WLeft - Left;
		Widget.ParentBar.PTop = Widget.ParentBar.PTop + WTop - Top;
		PDist = (Widget.ParentBar.PLeft ^ 2) + (Widget.ParentBar.PTop ^ 2);

		if (PDist < 225) then
			Widget:ClearAllPoints();
			Widget:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Left, Top);
			if (not Widget.ParentBar.Tabbed) then
				Util.RefreshTab(Widget:GetLeft(), Widget:GetTop());
			end
		else
			Widget:ClearAllPoints();
			Widget:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", Left + Widget.ParentBar.PLeft, Top + Widget.ParentBar.PTop);
			Widget.ParentBar.PLeft = 0;
			Widget.ParentBar.PTop = 0;
			Util.RefreshTab(Left, Top);
			Util.RefreshTab(Widget:GetLeft(), Widget:GetTop());
		end
	elseif (Widget.ParentBar.Tabbed) then
		Util.RefreshTab(Left, Top);
		Util.RefreshTab(Widget:GetLeft(), Widget:GetTop());
	end
end




--[[
		Destroy the bar if clicked with the Left mouse while in destroy mode
--]]
function Bar:DestroyBar()
	if (not InCombatLockdown()) then
		PlaySoundFile("Sound\\Spells\\Meltoretarget.Wav");
		Util.DeallocateBar(self);
	end
	UILib.ToggleDestroyBarMode(true);
end
function Bar.DestroyFrameOnEnter(Widget)
	local self = Widget.ParentBar;
	UILib.SetMask(self, Bar.DestroyBar, UILib.ToggleDestroyBarMode, Widget, "CAST_CURSOR", Const.ImagesDir.."DestroyMask.tga", {0, Widget:GetWidth() / Widget:GetHeight(), 0.1, 1});
end




--[[
		Send to Front and to Back, wrapper for the Util function call that handles this operation
--]]
function Bar.SendToBack(Widget)
	if (not InCombatLockdown()) then
		Util.ReorderBar(Widget.ParentBar, 0);
		Util.RefreshTab(Widget.ParentBar.ControlFrame:GetLeft(), Widget.ParentBar.ControlFrame:GetTop());
	end
end
function Bar.SendToFront(Widget)
	if (not InCombatLockdown()) then 
		Util.ReorderBar(Widget.ParentBar, #Util.ActiveBars - 1);
		Util.RefreshTab(Widget.ParentBar.ControlFrame:GetLeft(), Widget.ParentBar.ControlFrame:GetTop());
	end
end

--[[
		Handle updating the Label for the bar
--]]
function Bar.InputLabel(Widget)
	local self = Widget.ParentBar;
	self.LabelFrame:Hide();	
	UILib.InputBox(self, self.SetLabel, self.CancelInputLabel, self.BarSave["Label"], 200, {"LEFT", Widget, "RIGHT", 5, 0});

end
function Bar:SetLabel(Text)
	Text = Text or "";
	if (Text ~= "") then
		self.LabelFrame:Show();
		self.LabelFrame.Text:SetText(Text);
		self.LabelFrame:SetSize(self.LabelFrame.Text:GetStringWidth() + 4.5, Const.MiniIconSize);
	else
		self.LabelFrame.Text:SetText("");
		self.LabelFrame:SetWidth(0);
		self.LabelFrame:Hide();
	end
	Util.RefreshTab(self.ControlFrame:GetLeft(), self.ControlFrame:GetTop());
	self.BarSave["Label"] = Text;
	self.LabelButton:SetChecked(false);
	self:ReflowUI()
end
function Bar:CancelInputLabel()
	self.LabelButton:SetChecked(false);
	self:SetLabel(self.BarSave["Label"]);
end
function Bar.LabelOnEnter(Widget)
	Widget:SetBackdropColor(.3, .3, .3, 1);
end
function Bar.LabelOnLeave(Widget)
	Widget:SetBackdropColor(0, 0, 0, 1);
end

function Bar.ToggleGrid(Widget)
	local self = Widget.ParentBar;
	
	if (not InCombatLockdown()) then
		self:SetGridAlwaysOn(not self.BarSave["GridAlwaysOn"]);
	end
end
function Bar:SetGridAlwaysOn(Value)
	if (not InCombatLockdown()) then
		self.BarSave["GridAlwaysOn"] = Value;
		if (Value) then
			self.GridButton:SetNormalTexture(Const.ImagesDir.."GridOn.tga");
			self.GridButton.Tooltip = Util.GetLocaleString("GridTooltip")..Util.GetLocaleString("Shown");
			self.ButtonFrame:Execute("GridAlwaysOn = true;");
			self:GridShow();
		else
			self.GridButton:SetNormalTexture(Const.ImagesDir.."GridOff.tga");
			self.GridButton.Tooltip = Util.GetLocaleString("GridTooltip")..Util.GetLocaleString("Hidden");
			self.ButtonFrame:Execute("GridAlwaysOn = false;");
			if (Util.GridHidden) then
				self:GridHide();
			end
		end
		UILib.RefreshTooltip(self.GridButton);
	end
end
function Bar:GridShow()
	local Buttons = self.Buttons;
	for i = 1, #Buttons do
		if (not Buttons[i].Mode) then
			Buttons[i].Widget:Show();
		end
	end
end
function Bar:GridHide()
	local Buttons = self.Buttons;
	for i = 1, #Buttons do
		if (not Buttons[i].Mode) then
			Buttons[i].Widget:Hide();
		end
	end
end


function Bar.ToggleTooltips(Widget)
	local self = Widget.ParentBar;
	self:SetTooltips(not self.BarSave["TooltipsOn"]);
end
function Bar:SetTooltips(Value)
	self.BarSave["TooltipsOn"] = Value;
	if (Value) then
		self.TooltipButton:SetNormalTexture(Const.ImagesDir.."TooltipOn.tga");
		self.TooltipButton.Tooltip = Util.GetLocaleString("TooltipsTooltip")..Util.GetLocaleString("Shown");
	else
		self.TooltipButton:SetNormalTexture(Const.ImagesDir.."TooltipOff.tga");
		self.TooltipButton.Tooltip = Util.GetLocaleString("TooltipsTooltip")..Util.GetLocaleString("Hidden");
	end
	
	for i = 1, #self.Buttons do
		self.Buttons[i]:SetTooltipEnabled(Value);
	end
	
	UILib.RefreshTooltip(self.TooltipButton);
end

function Bar.ToggleButtonsLocked(Widget)
	local self = Widget.ParentBar;
	self:SetButtonsLocked(not self.BarSave["ButtonsLocked"]);
end
function Bar:SetButtonsLocked(Value)
	self.BarSave["ButtonsLocked"] = Value;

	if (Value) then
		self.LockButton:SetNormalTexture(Const.ImagesDir.."ButtonsLocked.tga");
		self.LockButton.Tooltip = Util.GetLocaleString("ButtonLockTooltip")..Util.GetLocaleString("Locked");
	else
		self.LockButton:SetNormalTexture(Const.ImagesDir.."ButtonsUnlocked.tga");
		self.LockButton.Tooltip = Util.GetLocaleString("ButtonLockTooltip")..Util.GetLocaleString("Unlocked");
	end
	
	for i = 1, #self.Buttons do
		self.Buttons[i]:SetButtonLock(Value);
	end
	UILib.RefreshTooltip(self.LockButton);
end

function Bar.ToggleHSpec1(Widget)
	local self = Widget.ParentBar;
	
	if (not InCombatLockdown()) then
		self:SetHSpec1(not self.BarSave["HSpec1"]);
	end
end


function Bar.ToggleHSpec2(Widget)
	local self = Widget.ParentBar;
	
	if (not InCombatLockdown()) then
		self:SetHSpec2(not self.BarSave["HSpec2"]);
	end
end

function Bar.ToggleHVehicle(Widget)
	local self = Widget.ParentBar;
	
	if (not InCombatLockdown()) then
		self:SetHVehicle(not self.BarSave["HVehicle"]);
	end
end

function Bar.ToggleHBonusBar(Widget)
	local self = Widget.ParentBar;
	
	if (not InCombatLockdown()) then
		self:SetHBonusBar(not self.BarSave["HBonusBar"]);
	end
end

function Bar:SetHSpec1(Value)
	if (not InCombatLockdown()) then
		self.BarSave["HSpec1"] = Value;
		if (Value) then
			self.HSpec1Button:SetNormalTexture(Const.ImagesDir.."Spec1Off.tga");
			self.HSpec1Button.Tooltip = Util.GetLocaleString("HideSpec1Tooltip")..Util.GetLocaleString("Hidden");
		else
			self.HSpec1Button:SetNormalTexture(Const.ImagesDir.."Spec1On.tga");			
			self.HSpec1Button.Tooltip = Util.GetLocaleString("HideSpec1Tooltip")..Util.GetLocaleString("Shown");
		end
		self:SetVD(self.BarSave["VDriver"]);
		UILib.RefreshTooltip(self.HSpec1Button);
	end
end
function Bar:SetHSpec2(Value)
	if (not InCombatLockdown()) then
		self.BarSave["HSpec2"] = Value;
		if (Value) then
			self.HSpec2Button:SetNormalTexture(Const.ImagesDir.."Spec2Off.tga");
			self.HSpec2Button.Tooltip = Util.GetLocaleString("HideSpec2Tooltip")..Util.GetLocaleString("Hidden");
		else
			self.HSpec2Button:SetNormalTexture(Const.ImagesDir.."Spec2On.tga");			
			self.HSpec2Button.Tooltip = Util.GetLocaleString("HideSpec2Tooltip")..Util.GetLocaleString("Shown");
		end
		self:SetVD(self.BarSave["VDriver"]);
		UILib.RefreshTooltip(self.HSpec2Button);
	end
end
function Bar:SetHVehicle(Value)
	if (not InCombatLockdown()) then
		self.BarSave["HVehicle"] = Value;
		if (Value) then
			self.HVehicleButton:SetNormalTexture(Const.ImagesDir.."VehicleOff.tga");
			self.HVehicleButton.Tooltip = Util.GetLocaleString("HideVehicleTooltip")..Util.GetLocaleString("Hidden");
		else
			self.HVehicleButton:SetNormalTexture(Const.ImagesDir.."VehicleOn.tga");			
			self.HVehicleButton.Tooltip = Util.GetLocaleString("HideVehicleTooltip")..Util.GetLocaleString("Shown");
		end
		self:SetVD(self.BarSave["VDriver"]);
		UILib.RefreshTooltip(self.HVehicleButton);
	end
end
function Bar:SetHBonusBar(Value)
	if (not InCombatLockdown()) then
		self.BarSave["HBonusBar"] = Value;
		if (Value) then
			self.HBonusBarButton:SetNormalTexture(Const.ImagesDir.."BonusBarOff.tga");
			self.HBonusBarButton.Tooltip = Util.GetLocaleString("HideBonusBarTooltip")..Util.GetLocaleString("Hidden");
		else
			self.HBonusBarButton:SetNormalTexture(Const.ImagesDir.."BonusBarOn.tga");			
			self.HBonusBarButton.Tooltip = Util.GetLocaleString("HideBonusBarTooltip")..Util.GetLocaleString("Shown");
		end
		self:SetVD(self.BarSave["VDriver"]);
		UILib.RefreshTooltip(self.HBonusBarButton);
	end
end

--[[
		Handle updating the Visibility State Driver
--]]
function Bar.InputVD(Widget)
	local self = Widget.ParentBar;
	
	if (not InCombatLockdown()) then
		UILib.InputBox(self, self.SetVD, self.CancelInputVD, self.BarSave["VDriver"], 300, {"LEFT", Widget, "RIGHT", 5, 0});
	end

end
function Bar:SetVD(VDText)

	if (not InCombatLockdown()) then
		local Text = "";
		if (self.TempVDSet) then
			Text = Text.."[nocombat] show; "
		end
		if (self.BarSave["HSpec1"]) then
			Text = Text.."[spec:1] hide; ";
		end
		if (self.BarSave["HSpec2"]) then
			Text = Text.."[spec:2] hide; ";
		end
		if (self.BarSave["HVehicle"]) then
			Text = Text.."[vehicleui] hide; ";
		end
		if (self.BarSave["HBonusBar"]) then
			Text = Text.."[bonusbar:5] hide; ";
		end
		--UnregisterStateDriver(self.ButtonFrame, "visibility");
		VDText = VDText or "";
		if (VDText ~= "") then
			self.VDButton:SetNormalTexture(Const.ImagesDir.."VDriverSet.tga");
			RegisterStateDriver(self.ButtonFrame, "visibility", Text..VDText);
			self.VDButton.Tooltip = Util.GetLocaleString("VisibilityTooltip").."|c"..Const.DarkBlue..VDText.."|r";
		else
			self.VDButton:SetNormalTexture(Const.ImagesDir.."VDriver.tga");
			if (Text ~= "") then
				RegisterStateDriver(self.ButtonFrame, "visibility", Text.."show");
			else
				self.ButtonFrame:Show();
			end
			self.VDButton.Tooltip = Util.GetLocaleString("VisibilityTooltip")..Util.GetLocaleString("VisibilityEgTooltip");
		end
		self.BarSave["VDriver"] = VDText;
		UILib.RefreshTooltip(self.VDButton);
	end
	self.VDButton:SetChecked(false);
end
function Bar:CancelInputVD()
	self.VDButton:SetChecked(false);
end
function Bar:SetTempShowVD()
	--These functions allow the VD to be overridden (such that they work as normal while in combat) for the purposes of adjusting the UI
	if (InCombatLockdown()) then
		return;
	end
	self.TempVDSet = true;
	self:SetVD(self.BarSave["VDriver"]);
end
function Bar:ClearTempShowVD()
	if (InCombatLockdown()) then
		return;
	end
	self.TempVDSet = false;
	self:SetVD(self.BarSave["VDriver"]);
end

--[[
		Set the Bar to accept Key Binds
--]]
function Bar.KeyBindMode(Widget)
	local self = Widget.ParentBar;

	if (Widget:GetChecked()) then
		for i = 1, #self.Buttons do
			self.Buttons[i]:SetOnEnter("KeyBind");
		end
		KeyBinder.SetButtonSelectorMode(self);
		SetCursor("CAST_CURSOR");
	else
		KeyBinder.CancelButtonSelectorMode();
	end
end
function Bar:CancelKeyBindMode()
	for i = 1, #self.Buttons do
		self.Buttons[i]:SetOnEnter();
	end
	UILib.SetMask(nil);
	self.KBButton:SetChecked(false);
	SetCursor(nil);
end

--[[
		Handles Dragging the bar size to create new COLUMNS
--]]
function Bar.ColsStart(Widget)
	if (InCombatLockdown()) then
		return;
	end

	local self = Widget.ParentBar;
	local Background = self.Background;
	GameTooltip_Hide();
	
	self.TileTexture:Show();
	Background:SetScript("OnSizeChanged", self.ColsOnSizeChanged);
	Background:SetResizable(true);
	Background:StartSizing();
end
function Bar.ColsStop(Widget)
	local self = Widget.ParentBar;
	local Background = self.Background;
	local Buttons = self.Buttons;
	local Scale = self.BarSave["Scale"];
	local NumCols = max(math.floor((Background:GetWidth() - Const.I2 + Const.BG * Scale) / (Const.BSize * Scale) + 0.00001), 1);
	self.TileTexture:Hide();
	Background:SetScript("OnSizeChanged", nil);
	Background:StopMovingOrSizing();
	Background:SetResizable(false);
	for i = 1, #Buttons do
		Buttons[i]:Fade(false);
	end
	self:SetNumButtons(NumCols, self.Rows);
	
	self:UpdateSize();
end
function Bar.ColsOnSizeChanged(Widget, Width, Height)
	local self = Widget.ParentBar;
	if (InCombatLockdown()) then
		self.ColsStop(Widget);
		return;
	end
	local Scale = self.BarSave["Scale"]
	local NumCols = max(math.floor((Width - Const.I2 + Const.BG * Scale) / (Const.BSize * Scale) + 0.00001), 1);
	local i = 1;
	
	for r = 1, self.Rows do
		for c = 1, self.Cols do
			if (c > NumCols) then
				self.Buttons[i]:Fade(true);
			else
				self.Buttons[i]:Fade(false);
			end
			i = i + 1;
		end
	end
	

	if (Width < Const.BS * Scale + Const.I2) then
		self.Background:SetWidth(Const.BS * Scale + Const.I2);
	end
	self.Background:SetHeight((self.Rows * Const.BSize - Const.BG) * Scale + Const.I2);
	self:ReflowUI();
	self:UpdateTileSize(NumCols, self.Rows);
end


--[[
		Handles Dragging the bar size to create new ROWS
--]]
function Bar.RowsStart(Widget)
	if (InCombatLockdown()) then
		return;
	end

	local self = Widget.ParentBar;
	local Background = self.Background;
	GameTooltip_Hide();
	
	self.TileTexture:Show();
	Background:SetScript("OnSizeChanged", self.RowsOnSizeChanged);
	Background:SetResizable(true);
	Background:StartSizing();
end
function Bar.RowsStop(Widget)
	local self = Widget.ParentBar;
	local Background = self.Background;
	local Buttons = self.Buttons;
	local Scale = self.BarSave["Scale"];
	local NumRows = max(math.floor((Background:GetHeight() - Const.I2 + Const.BG * Scale) / (Const.BSize * Scale) + 0.00001), 1);
	self.TileTexture:Hide();
	Background:SetScript("OnSizeChanged", nil);
	Background:StopMovingOrSizing();
	Background:SetResizable(false);
	for i = 1, #Buttons do
		Buttons[i]:Fade(false);
	end
	self:SetNumButtons(self.Cols, NumRows);

	self:UpdateSize();

end
function Bar.RowsOnSizeChanged(Widget, Width, Height)
	local self = Widget.ParentBar;
	if (InCombatLockdown()) then
		self.RowsStop(Widget);
		return;
	end
	local Scale = self.BarSave["Scale"];
	local NumRows = max(math.floor((Height - Const.I2 + Const.BG * Scale) / (Const.BSize * Scale) + 0.00001), 1);
	local i = 1;
	
	for r = 1, self.Rows do
		for c = 1, self.Cols do
			if (r > NumRows) then
				self.Buttons[i]:Fade(true);
			else
				self.Buttons[i]:Fade(false);
			end
			i = i + 1;
		end
	end
	

	if (Height < Const.BS * Scale + Const.I2) then
		self.Background:SetHeight(Const.BS * Scale + Const.I2);
	end
	self.Background:SetWidth((self.Cols * Const.BSize - Const.BG) * Scale + Const.I2);
	self:ReflowUI();
	self:UpdateTileSize(self.Cols, NumRows);
end


--[[
		Handles Dragging the bar size to SCALE
--]]
function Bar.ScaleStart(Widget)
	if (InCombatLockdown()) then
		return;
	end
	GameTooltip_Hide();
	local self = Widget.ParentBar;
	local Background = self.Background;
	local Time = GetTime();	--This is for double click default

	if (self.ScaleClickTime + Const.DoubleClickSpeed > Time) then
		local CFrame = self.ControlFrame;
		local WLeft, WTop 					= CFrame:GetLeft(), CFrame:GetTop();
		local Left, Top, Dist, DockedBar 	= Util.DockCoords(WLeft, WTop, self);
		if (DockedBar) then
			if (math.floor(Dist * 1000) == 0 and self.BarSave["Scale"] ~= DockedBar.BarSave["Scale"]) then
				self:SetScale(DockedBar.BarSave["Scale"]);
				return;
			end
		end
		self:SetScale(1);
		return;
	end

	Background:SetScript("OnSizeChanged", self.ScaleOnSizeChanged);
	Background:SetResizable(true);
	Background:StartSizing();
	self.ScaleClickTime = Time;
end
function Bar.ScaleStop(Widget)
	local self = Widget.ParentBar;
	local Background = self.Background;
	Background:SetScript("OnSizeChanged", nil);
	Background:StopMovingOrSizing();
	Background:SetResizable(false);
	self:UpdateSize();
end
function Bar.ScaleOnSizeChanged(Widget, Width, Height)
	local self = Widget.ParentBar;
	if (InCombatLockdown()) then
		self.ScaleStop(Widget);
		return;
	end
	local UIScale = UIParent:GetEffectiveScale();
	local MouseX, MouseY = GetCursorPosition();
	local Left, Top = self.Background:GetLeft(), self.Background:GetTop();
	Width = MouseX / UIScale - Left;
	Height = Top - MouseY / UIScale;
	local UnscaledWidth = self.Cols * Const.BSize - Const.BG;
	local UnscaledHeight = self.Rows * Const.BSize - Const.BG;
	
	--Now calculate the scale needed to space the buttons in the bars new size in each dir	
	local ScaleX = (Width - Const.I2) / UnscaledWidth;
	local ScaleY = (Height - Const.I2) / UnscaledHeight;
	local Scale;
	--Now we choose the lower scale factor (x or y) to use
	if (ScaleX <= ScaleY) then
		Scale = ScaleX;
	else
		Scale = ScaleY;
	end
	
	if (Scale < Const.MinScale) then
		Scale = Const.MinScale;
	end
	self:SetScale(Scale);

end


function Bar:SetOrder(Order)
	if (InCombatLockdown()) then
		return;
	end
	Order = Order or self.BarSave["Order"];
	self.ControlFrame:SetFrameLevel(Order * 5 + 2);	--1
	self.ButtonFrame:SetFrameLevel(Order * 5 + 3);	--2, 3
	self.LabelFrame:SetFrameLevel(Order * 5 + 4);	--3
	self.AdvFrame:SetFrameLevel(Order * 5 + 4);		--3, 4
	self.DestroyFrame:SetFrameLevel(Order * 5 + 6);	--

	self.BarSave["Order"] = Order;
end


