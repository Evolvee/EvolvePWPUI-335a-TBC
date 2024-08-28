C_UIDROPDOWNMENU_MINBUTTONS = 8;
C_UIDROPDOWNMENU_MAXBUTTONS = 8;
C_UIDROPDOWNMENU_MAXLEVELS = 2;
C_UIDROPDOWNMENU_BUTTON_HEIGHT = 16;
C_UIDROPDOWNMENU_BORDER_HEIGHT = 15;
-- The current open menu
C_UIDROPDOWNMENU_OPEN_MENU = nil;
-- The current menu being initialized
C_UIDROPDOWNMENU_INIT_MENU = nil;
-- Current level shown of the open menu
C_UIDROPDOWNMENU_MENU_LEVEL = 1;
-- Current value of the open menu
C_UIDROPDOWNMENU_MENU_VALUE = nil;
-- Time to wait to hide the menu
C_UIDROPDOWNMENU_SHOW_TIME = 2;
-- Default dropdown text height
C_UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = nil;
-- List of open menus
C_OPEN_DROPDOWNMENUS = {};

local C_UIDropDownMenuDelegate = CreateFrame("FRAME");

-- UIDropDownMenu.xml -> Lua
	-- DropDownList1
	local f = CreateFrame("Button", "C_DropDownList1", nil, "C_UIDropDownListTemplate");
	f:SetID(1);
	f:SetSize(180, 10);
	f:SetToplevel(true);
	f:SetFrameStrata("FULLSCREEN_DIALOG");
	f:Hide();
	local fontName, fontHeight, fontFlags = _G["C_DropDownList1Button1NormalText"]:GetFont();
	C_UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = fontHeight;

	-- DropDownList2
	local f = CreateFrame("Button", "C_DropDownList2", nil, "C_UIDropDownListTemplate");
	f:SetID(2);
	f:SetSize(180, 10);
	f:SetToplevel(true);
	f:SetFrameStrata("FULLSCREEN_DIALOG");
	f:Hide();

	UIMenus[#UIMenus+1] = "C_DropDownList1"
	UIMenus[#UIMenus+1] = "C_DropDownList2"

function C_UIDropDownMenuDelegate_OnAttributeChanged (self, attribute, value)
	if ( attribute == "createframes" and value == true ) then
		C_UIDropDownMenu_CreateFrames(self:GetAttribute("createframes-level"), self:GetAttribute("createframes-index"));
	elseif ( attribute == "initmenu" ) then
		C_UIDROPDOWNMENU_INIT_MENU = value;
	elseif ( attribute == "openmenu" ) then
		C_UIDROPDOWNMENU_OPEN_MENU = value;
	end
end

C_UIDropDownMenuDelegate:SetScript("OnAttributeChanged", C_UIDropDownMenuDelegate_OnAttributeChanged);

function C_UIDropDownMenu_InitializeHelper (frame)
	-- This deals with the potentially tainted stuff!
	if ( frame ~= C_UIDROPDOWNMENU_OPEN_MENU ) then
		C_UIDROPDOWNMENU_MENU_LEVEL = 1;
	end

	-- Set the frame that's being intialized
	C_UIDropDownMenuDelegate:SetAttribute("initmenu", frame);
	
	-- Hide all the buttons
	local button, dropDownList;
	for i = 1, C_UIDROPDOWNMENU_MAXLEVELS, 1 do
		dropDownList = _G["C_DropDownList"..i];
		if ( i >= C_UIDROPDOWNMENU_MENU_LEVEL or frame ~= C_UIDROPDOWNMENU_OPEN_MENU ) then
			dropDownList.numButtons = 0;
			dropDownList.maxWidth = 0;
			for j=1, C_UIDROPDOWNMENU_MAXBUTTONS, 1 do
				button = _G["C_DropDownList"..i.."Button"..j];
				button:Hide();
			end
			dropDownList:Hide();
		end
	end
	frame:SetHeight(C_UIDROPDOWNMENU_BUTTON_HEIGHT * 2);
end

function C_UIDropDownMenu_Initialize(frame, initFunction, displayMode, level, menuList)
	frame.menuList = menuList;

	securecall("C_UIDropDownMenu_InitializeHelper", frame);
	
	-- Set the initialize function and call it.  The initFunction populates the dropdown list.
	if ( initFunction ) then
		frame.initialize = initFunction;
		initFunction(frame, level, frame.menuList);
	end

	-- Change appearance based on the displayMode
	if ( displayMode == "MENU" ) then
		local name = frame:GetName();
		_G[name.."Left"]:Hide();
		_G[name.."Middle"]:Hide();
		_G[name.."Right"]:Hide();
		_G[name.."ButtonNormalTexture"]:SetTexture("");
		_G[name.."ButtonDisabledTexture"]:SetTexture("");
		_G[name.."ButtonPushedTexture"]:SetTexture("");
		_G[name.."ButtonHighlightTexture"]:SetTexture("");
		_G[name.."Button"]:ClearAllPoints();
		_G[name.."Button"]:SetPoint("LEFT", name.."Text", "LEFT", -9, 0);
		_G[name.."Button"]:SetPoint("RIGHT", name.."Text", "RIGHT", 6, 0);
		frame.displayMode = "MENU";
	end

end

-- If dropdown is visible then see if its timer has expired, if so hide the frame
function C_UIDropDownMenu_OnUpdate(self, elapsed)
	if ( not self.showTimer or not self.isCounting ) then
		return;
	elseif ( self.showTimer < 0 ) then
		self:Hide();
		self.showTimer = nil;
		self.isCounting = nil;
	else
		self.showTimer = self.showTimer - elapsed;
	end
end

-- Start the countdown on a frame
function C_UIDropDownMenu_StartCounting(frame)
	if ( frame.parent ) then
		C_UIDropDownMenu_StartCounting(frame.parent);
	else
		frame.showTimer = C_UIDROPDOWNMENU_SHOW_TIME;
		frame.isCounting = 1;
	end
end

-- Stop the countdown on a frame
function C_UIDropDownMenu_StopCounting(frame)
	if ( frame.parent ) then
		C_UIDropDownMenu_StopCounting(frame.parent);
	else
		frame.isCounting = nil;
	end
end

--[[
List of button attributes
======================================================
info.text = [STRING]  --  The text of the button
info.value = [ANYTHING]  --  The value that C_UIDROPDOWNMENU_MENU_VALUE is set to when the button is clicked
info.func = [function()]  --  The function that is called when you click the button
info.checked = [nil, true, function]  --  Check the button if true or function returns true
info.isTitle = [nil, true]  --  If it's a title the button is disabled and the font color is set to yellow
info.disabled = [nil, true]  --  Disable the button and show an invisible button that still traps the mouseover event so menu doesn't time out
info.tooltipWhileDisabled = [nil, 1] -- Show the tooltip, even when the button is disabled.
info.hasArrow = [nil, true]  --  Show the expand arrow for multilevel menus
info.hasColorSwatch = [nil, true]  --  Show color swatch or not, for color selection
info.r = [1 - 255]  --  Red color value of the color swatch
info.g = [1 - 255]  --  Green color value of the color swatch
info.b = [1 - 255]  --  Blue color value of the color swatch
info.colorCode = [STRING] -- "|cAARRGGBB" embedded hex value of the button text color. Only used when button is enabled
info.swatchFunc = [function()]  --  Function called by the color picker on color change
info.hasOpacity = [nil, 1]  --  Show the opacity slider on the colorpicker frame
info.opacity = [0.0 - 1.0]  --  Percentatge of the opacity, 1.0 is fully shown, 0 is transparent
info.opacityFunc = [function()]  --  Function called by the opacity slider when you change its value
info.cancelFunc = [function(previousValues)] -- Function called by the colorpicker when you click the cancel button (it takes the previous values as its argument)
info.notClickable = [nil, 1]  --  Disable the button and color the font white
info.notCheckable = [nil, 1]  --  Shrink the size of the buttons and don't display a check box
info.owner = [Frame]  --  Dropdown frame that "owns" the current dropdownlist
info.keepShownOnClick = [nil, 1]  --  Don't hide the dropdownlist after a button is clicked
info.tooltipTitle = [nil, STRING] -- Title of the tooltip shown on mouseover
info.tooltipText = [nil, STRING] -- Text of the tooltip shown on mouseover
info.tooltipOnButton = [nil, 1] -- Show the tooltip attached to the button instead of as a Newbie tooltip.
info.justifyH = [nil, "CENTER"] -- Justify button text
info.arg1 = [ANYTHING] -- This is the first argument used by info.func
info.arg2 = [ANYTHING] -- This is the second argument used by info.func
info.fontObject = [FONT] -- font object replacement for Normal and Highlight
info.menuTable = [TABLE] -- This contains an array of info tables to be displayed as a child menu
info.noClickSound = [nil, 1]  --  Set to 1 to suppress the sound when clicking the button. The sound only plays if .func is set.
info.padding = [nil, NUMBER] -- Number of pixels to pad the text on the right side
]]

local UIDropDownMenu_ButtonInfo = {};

--Until we get around to making this betterz...
local UIDropDownMenu_SecureInfo = {};

function C_UIDropDownMenu_CreateInfo()
	-- Reuse the same table to prevent memory churn
	local info;
	local secure = issecure();
	
	if ( secure ) then
		info = UIDropDownMenu_SecureInfo;
	else
		info = UIDropDownMenu_ButtonInfo;
	end

	for k,v in pairs(info) do
		info[k] = nil;
	end

	return info;
end

function C_UIDropDownMenu_CreateFrames(level, index)
	while ( level > C_UIDROPDOWNMENU_MAXLEVELS ) do
		C_UIDROPDOWNMENU_MAXLEVELS = C_UIDROPDOWNMENU_MAXLEVELS + 1;
		local newList = CreateFrame("Button", "C_DropDownList"..C_UIDROPDOWNMENU_MAXLEVELS, nil, "C_UIDropDownListTemplate");
		newList:SetFrameStrata("FULLSCREEN_DIALOG");
		newList:SetToplevel(1);
		newList:Hide();
		newList:SetID(C_UIDROPDOWNMENU_MAXLEVELS);
		newList:SetWidth(180)
		newList:SetHeight(10)
		for i=C_UIDROPDOWNMENU_MINBUTTONS+1, C_UIDROPDOWNMENU_MAXBUTTONS do
			local newButton = CreateFrame("Button", "C_DropDownList"..C_UIDROPDOWNMENU_MAXLEVELS.."Button"..i, newList, "C_UIDropDownMenuButtonTemplate");
			newButton:SetID(i);
		end
	end

	while ( index > C_UIDROPDOWNMENU_MAXBUTTONS ) do
		C_UIDROPDOWNMENU_MAXBUTTONS = C_UIDROPDOWNMENU_MAXBUTTONS + 1;
		for i=1, C_UIDROPDOWNMENU_MAXLEVELS do
			local newButton = CreateFrame("Button", "C_DropDownList"..i.."Button"..C_UIDROPDOWNMENU_MAXBUTTONS, _G["C_DropDownList"..i], "C_UIDropDownMenuButtonTemplate");
			newButton:SetID(C_UIDROPDOWNMENU_MAXBUTTONS);
		end
	end
end

function C_UIDropDownMenu_AddButton(info, level)
	--[[ Might to uncomment this if there are performance issues
	if ( not C_UIDROPDOWNMENU_OPEN_MENU ) then
		return;
	end]]

	if ( not level ) then
		level = 1;
	end
	
	local listFrame = _G["C_DropDownList"..level];
	local index = listFrame and (listFrame.numButtons + 1) or 1;
	local width;

	C_UIDropDownMenuDelegate:SetAttribute("createframes-level", level);
	C_UIDropDownMenuDelegate:SetAttribute("createframes-index", index);
	C_UIDropDownMenuDelegate:SetAttribute("createframes", true);
	
	listFrame = listFrame or _G["C_DropDownList"..level];
	local listFrameName = listFrame:GetName();
	
	-- Set the number of buttons in the listframe
	listFrame.numButtons = index;
	
	local button = _G[listFrameName.."Button"..index];
	local normalText = _G[button:GetName().."NormalText"];
	local icon = _G[button:GetName().."Icon"];
	-- This button is used to capture the mouse OnEnter/OnLeave events if the dropdown button is disabled, since a disabled button doesn't receive any events
	-- This is used specifically for drop down menu time outs
	local invisibleButton = _G[button:GetName().."InvisibleButton"];
	
	-- Default settings
	button:SetDisabledFontObject(GameFontDisableSmallLeft);
	invisibleButton:Hide();
	button:Enable();
	
	-- If not clickable then disable the button and set it white
	if ( info.notClickable ) then
		info.disabled = 1;
		button:SetDisabledFontObject(GameFontHighlightSmallLeft);
	end

	-- Set the text color and disable it if its a title
	if ( info.isTitle ) then
		info.disabled = 1;
		button:SetDisabledFontObject(GameFontNormalSmallLeft);
	end
	
	-- Disable the button if disabled and turn off the color code
	if ( info.disabled ) then
		button:Disable();
		invisibleButton:Show();
		info.colorCode = nil;
	end

	-- Configure button
	if ( info.text ) then
		-- look for inline color code this is only if the button is enabled
		if ( info.colorCode ) then
			button:SetText(info.colorCode..info.text.."|r");
		else
			button:SetText(info.text);
		end
		-- Determine the width of the button
		width = normalText:GetWidth() + 40;
		-- Add padding if has and expand arrow or color swatch
		if ( info.hasArrow or info.hasColorSwatch ) then
			width = width + 10;
		end
		if ( info.notCheckable ) then
			width = width - 30;
		end
		-- Set icon
		if ( info.icon ) then
			icon:SetTexture(info.icon);
			if ( info.tCoordLeft ) then
				icon:SetTexCoord(info.tCoordLeft, info.tCoordRight, info.tCoordTop, info.tCoordBottom);
			else
				icon:SetTexCoord(0, 1, 0, 1);
			end
			icon:Show();
			-- Add padding for the icon
			width = width + 10;
		else
			icon:Hide();
		end
		if ( info.padding ) then
			width = width + info.padding;
		end
		-- Set maximum button width
		if ( width > listFrame.maxWidth ) then
			listFrame.maxWidth = width;
		end
		-- Check to see if there is a replacement font
		if ( info.fontObject ) then
			button:SetNormalFontObject(info.fontObject);
			button:SetHighlightFontObject(info.fontObject);
		else
			button:SetNormalFontObject(GameFontHighlightSmallLeft);
			button:SetHighlightFontObject(GameFontHighlightSmallLeft);
		end
	else
		button:SetText("");
		icon:Hide();
	end

	-- Pass through attributes
	button.func = info.func;
	button.owner = info.owner;
	button.hasOpacity = info.hasOpacity;
	button.opacity = info.opacity;
	button.opacityFunc = info.opacityFunc;
	button.cancelFunc = info.cancelFunc;
	button.swatchFunc = info.swatchFunc;
	button.keepShownOnClick = info.keepShownOnClick;
	button.tooltipTitle = info.tooltipTitle;
	button.tooltipText = info.tooltipText;
	button.arg1 = info.arg1;
	button.arg2 = info.arg2;
	button.hasArrow = info.hasArrow;
	button.hasColorSwatch = info.hasColorSwatch;
	button.notCheckable = info.notCheckable;
	button.menuList = info.menuList;
	button.tooltipWhileDisabled = info.tooltipWhileDisabled;
	button.tooltipOnButton = info.tooltipOnButton;
	button.noClickSound = info.noClickSound;
	button.padding = info.padding;
	
	if ( info.value ) then
		button.value = info.value;
	elseif ( info.text ) then
		button.value = info.text;
	else
		button.value = nil;
	end
	
	-- Show the expand arrow if it has one
	if ( info.hasArrow ) then
		_G[listFrameName.."Button"..index.."ExpandArrow"]:Show();
	else
		_G[listFrameName.."Button"..index.."ExpandArrow"]:Hide();
	end
	button.hasArrow = info.hasArrow;
	
	-- If not checkable move everything over to the left to fill in the gap where the check would be
	local xPos = 5;
	local yPos = -((button:GetID() - 1) * C_UIDROPDOWNMENU_BUTTON_HEIGHT) - C_UIDROPDOWNMENU_BORDER_HEIGHT;
	normalText:ClearAllPoints();
	if ( info.notCheckable ) then
		if ( info.justifyH and info.justifyH == "CENTER" ) then
			normalText:SetPoint("CENTER", button, "CENTER", -7, 0);
		else
			normalText:SetPoint("LEFT", button, "LEFT", 0, 0);
		end
		xPos = xPos + 10;
		
	else
		xPos = xPos + 12;
		normalText:SetPoint("LEFT", button, "LEFT", 20, 0);
	end

	-- Adjust offset if displayMode is menu
	local frame = C_UIDROPDOWNMENU_OPEN_MENU;
	if ( frame and frame.displayMode == "MENU" ) then
		if ( not info.notCheckable ) then
			xPos = xPos - 6;
		end
	end
	
	-- If no open frame then set the frame to the currently initialized frame
	frame = frame or C_UIDROPDOWNMENU_INIT_MENU;

	button:SetPoint("TOPLEFT", button:GetParent(), "TOPLEFT", xPos, yPos);

	-- See if button is selected by id or name
	if ( frame ) then
		if ( C_UIDropDownMenu_GetSelectedName(frame) ) then
			if ( button:GetText() == C_UIDropDownMenu_GetSelectedName(frame) ) then
				info.checked = 1;
			end
		elseif ( C_UIDropDownMenu_GetSelectedID(frame) ) then
			if ( button:GetID() == C_UIDropDownMenu_GetSelectedID(frame) ) then
				info.checked = 1;
			end
		elseif ( C_UIDropDownMenu_GetSelectedValue(frame) ) then
			if ( button.value == C_UIDropDownMenu_GetSelectedValue(frame) ) then
				info.checked = 1;
			end
		end
	end

	-- Checked can be a function now
	local checked = info.checked;
	if ( type(checked) == "function" ) then
		checked = checked();
	end

	local check = _G[listFrameName.."Button"..index.."Check"]

	-- Show the check if checked
	if ( checked ) then
		button:LockHighlight();
		check:Show();
	else
		button:UnlockHighlight();
		check:Hide();
	end
	button.checked = info.checked;

	-- Allow radio buttons within UIDropDownMenu.
	if ( C_UIDROPDOWNMENU_OPEN_MENU and not button.notCheckable ) then
		if ( info.disabled or (info.isRadio and not info.checked) ) then
			check:SetDesaturated(true)
			check:SetAlpha(.25)
		else
			check:SetDesaturated(false)
			check:SetAlpha(1)
		end

		if ( info.isRadio ) then
			check:SetTexture("Interface\\Buttons\\UI-RadioButton")
			check:Show()

			if ( info.checked ) then
				check:SetTexCoord(.25, .5, 0, 1)
			else
				check:SetTexCoord(0, .25, 0, 1)
			end
		else
			check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
			check:SetTexCoord(0, 1, 0, 1)
		end
	end

	-- If has a colorswatch, show it and vertex color it
	local colorSwatch = _G[listFrameName.."Button"..index.."ColorSwatch"];
	if ( info.hasColorSwatch ) then
		_G["C_DropDownList"..level.."Button"..index.."ColorSwatch".."NormalTexture"]:SetVertexColor(info.r, info.g, info.b);
		button.r = info.r;
		button.g = info.g;
		button.b = info.b;
		colorSwatch:Show();
	else
		colorSwatch:Hide();
	end

	-- Set the height of the listframe
	listFrame:SetHeight((index * C_UIDROPDOWNMENU_BUTTON_HEIGHT) + (C_UIDROPDOWNMENU_BORDER_HEIGHT * 2));

	button:Show();
end

function C_UIDropDownMenu_Refresh(frame, useValue, dropdownLevel)
	local button, checked, checkImage, normalText, width;
	local maxWidth = 0;
	if ( not dropdownLevel ) then
		dropdownLevel = C_UIDROPDOWNMENU_MENU_LEVEL;
	end
	
	-- Just redraws the existing menu
	for i=1, C_UIDROPDOWNMENU_MAXBUTTONS do
		button = _G["C_DropDownList"..dropdownLevel.."Button"..i];
		checked = nil;
		-- See if checked or not
		if ( C_UIDropDownMenu_GetSelectedName(frame) ) then
			if ( button:GetText() == C_UIDropDownMenu_GetSelectedName(frame) ) then
				checked = 1;
			end
		elseif ( C_UIDropDownMenu_GetSelectedID(frame) ) then
			if ( button:GetID() == C_UIDropDownMenu_GetSelectedID(frame) ) then
				checked = 1;
			end
		elseif ( C_UIDropDownMenu_GetSelectedValue(frame) ) then
			if ( button.value == C_UIDropDownMenu_GetSelectedValue(frame) ) then
				checked = 1;
			end
		end

		-- If checked show check image
		checkImage = _G["C_DropDownList"..dropdownLevel.."Button"..i.."Check"];
		if ( checked ) then
			if ( useValue ) then
				C_UIDropDownMenu_SetText(frame, button.value);
			else
				C_UIDropDownMenu_SetText(frame, button:GetText());
			end
			button:LockHighlight();
			checkImage:Show();
		else
			button:UnlockHighlight();
			checkImage:Hide();
		end

		if ( button:IsShown() ) then
			normalText = _G[button:GetName().."NormalText"];
			-- Determine the maximum width of a button
			width = normalText:GetWidth() + 40;
			-- Add padding if has and expand arrow or color swatch
			if ( button.hasArrow or button.hasColorSwatch ) then
				width = width + 10;
			end
			if ( button.notCheckable ) then
				width = width - 30;
			end
			if ( button.padding ) then
				width = width + button.padding;
			end
			if ( width > maxWidth ) then
				maxWidth = width;
			end
		end
	end
	for i=1, C_UIDROPDOWNMENU_MAXBUTTONS do
		button = _G["C_DropDownList"..dropdownLevel.."Button"..i];
		button:SetWidth(maxWidth);
	end
	_G["C_DropDownList"..dropdownLevel]:SetWidth(maxWidth+25);
end

function C_UIDropDownMenu_SetSelectedName(frame, name, useValue)
	frame.selectedName = name;
	frame.selectedID = nil;
	frame.selectedValue = nil;
	C_UIDropDownMenu_Refresh(frame, useValue);
end

function C_UIDropDownMenu_SetSelectedValue(frame, value, useValue)
	-- useValue will set the value as the text, not the name
	frame.selectedName = nil;
	frame.selectedID = nil;
	frame.selectedValue = value;
	C_UIDropDownMenu_Refresh(frame, useValue);
end

function C_UIDropDownMenu_SetSelectedID(frame, id, useValue)
	frame.selectedID = id;
	frame.selectedName = nil;
	frame.selectedValue = nil;
	C_UIDropDownMenu_Refresh(frame, useValue);
end

function C_UIDropDownMenu_GetSelectedName(frame)
	return frame.selectedName;
end

function C_UIDropDownMenu_GetSelectedID(frame)
	if ( frame.selectedID ) then
		return frame.selectedID;
	else
		-- If no explicit selectedID then try to send the id of a selected value or name
		local button;
		for i=1, C_UIDROPDOWNMENU_MAXBUTTONS do
			button = _G["C_DropDownList"..C_UIDROPDOWNMENU_MENU_LEVEL.."Button"..i];
			-- See if checked or not
			if ( C_UIDropDownMenu_GetSelectedName(frame) ) then
				if ( button:GetText() == C_UIDropDownMenu_GetSelectedName(frame) ) then
					return i;
				end
			elseif ( C_UIDropDownMenu_GetSelectedValue(frame) ) then
				if ( button.value == C_UIDropDownMenu_GetSelectedValue(frame) ) then
					return i;
				end
			end
		end
	end
end

function C_UIDropDownMenu_GetSelectedValue(frame)
	return frame.selectedValue;
end

function C_UIDropDownMenuButton_OnClick(self)
	local checked = self.checked;
	if ( type (checked) == "function" ) then
		checked = checked();
	end
	
	if ( self.keepShownOnClick ) then
		if ( checked ) then
			_G[self:GetName().."Check"]:Hide();
			checked = false;
		else
			_G[self:GetName().."Check"]:Show();
			checked = true;
		end
	else
		self:GetParent():Hide();
	end

	if ( type (self.checked) ~= "function" ) then 
		self.checked = checked;
	end

	-- saving this here because func might use a dropdown, changing this self's attributes
	local playSound = true;
	if ( self.noClickSound ) then
		playSound = false;
	end

	local func = self.func;
	if ( func ) then
		func(self, self.arg1, self.arg2, checked);
	else
		return;
	end

	if ( playSound ) then
		PlaySound("UChatScrollButton");
	end
end

function C_HideDropDownMenu(level)
	local listFrame = _G["C_DropDownList"..level];
	listFrame:Hide();
end

function C_ToggleDropDownMenu(level, value, dropDownFrame, anchorName, xOffset, yOffset, menuList, button)
	if ( not level ) then
		level = 1;
	end
	C_UIDropDownMenuDelegate:SetAttribute("createframes-level", level);
	C_UIDropDownMenuDelegate:SetAttribute("createframes-index", 0);
	C_UIDropDownMenuDelegate:SetAttribute("createframes", true);
	C_UIDROPDOWNMENU_MENU_LEVEL = level;
	C_UIDROPDOWNMENU_MENU_VALUE = value;
	local listFrame = _G["C_DropDownList"..level];
	local listFrameName = "C_DropDownList"..level;
	local tempFrame;
	local point, relativePoint, relativeTo;
	if ( not dropDownFrame ) then
		tempFrame = button:GetParent();
	else
		tempFrame = dropDownFrame;
	end
	if ( listFrame:IsShown() and (C_UIDROPDOWNMENU_OPEN_MENU == tempFrame) ) then
		listFrame:Hide();
	else
		-- Set the dropdownframe scale
		local uiScale;
		local uiParentScale = UIParent:GetScale();
		if ( tempFrame ~= WorldMapContinentDropDown and tempFrame ~= WorldMapZoneDropDown ) then
			if ( GetCVar("useUIScale") == "1" ) then
				uiScale = tonumber(GetCVar("uiscale"));
				if ( uiParentScale < uiScale ) then
					uiScale = uiParentScale;
				end
			else
				uiScale = uiParentScale;
			end
		else
			uiScale = 1;
		end
		listFrame:SetScale(uiScale);
		
		-- Hide the listframe anyways since it is redrawn OnShow() 
		listFrame:Hide();
		
		-- Frame to anchor the dropdown menu to
		local anchorFrame;

		-- Display stuff
		-- Level specific stuff
		if ( level == 1 ) then	
			C_UIDropDownMenuDelegate:SetAttribute("openmenu", dropDownFrame);
			listFrame:ClearAllPoints();
			-- If there's no specified anchorName then use left side of the dropdown menu
			if ( not anchorName ) then
				-- See if the anchor was set manually using setanchor
				if ( dropDownFrame.xOffset ) then
					xOffset = dropDownFrame.xOffset;
				end
				if ( dropDownFrame.yOffset ) then
					yOffset = dropDownFrame.yOffset;
				end
				if ( dropDownFrame.point ) then
					point = dropDownFrame.point;
				end
				if ( dropDownFrame.relativeTo ) then
					relativeTo = dropDownFrame.relativeTo;
				else
					relativeTo = C_UIDROPDOWNMENU_OPEN_MENU:GetName().."Left";
				end
				if ( dropDownFrame.relativePoint ) then
					relativePoint = dropDownFrame.relativePoint;
				end
			elseif ( anchorName == "cursor" ) then
				relativeTo = nil;
				local cursorX, cursorY = GetCursorPosition();
				cursorX = cursorX/uiScale;
				cursorY =  cursorY/uiScale;

				if ( not xOffset ) then
					xOffset = 0;
				end
				if ( not yOffset ) then
					yOffset = 0;
				end
				xOffset = cursorX + xOffset;
				yOffset = cursorY + yOffset;
			else
				-- See if the anchor was set manually using setanchor
				if ( dropDownFrame.xOffset ) then
					xOffset = dropDownFrame.xOffset;
				end
				if ( dropDownFrame.yOffset ) then
					yOffset = dropDownFrame.yOffset;
				end
				if ( dropDownFrame.point ) then
					point = dropDownFrame.point;
				end
				if ( dropDownFrame.relativeTo ) then
					relativeTo = dropDownFrame.relativeTo;
				else
					relativeTo = anchorName;
				end
				if ( dropDownFrame.relativePoint ) then
					relativePoint = dropDownFrame.relativePoint;
				end
			end
			if ( not xOffset or not yOffset ) then
				xOffset = 8;
				yOffset = 22;
			end
			if ( not point ) then
				point = "TOPLEFT";
			end
			if ( not relativePoint ) then
				relativePoint = "BOTTOMLEFT";
			end
			listFrame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset);
		else
			if ( not dropDownFrame ) then
				dropDownFrame = C_UIDROPDOWNMENU_OPEN_MENU;
			end
			listFrame:ClearAllPoints();
			-- If this is a dropdown button, not the arrow anchor it to itself
			if ( strsub(button:GetParent():GetName(), 0,12) == "C_DropDownList" and strlen(button:GetParent():GetName()) == 13 ) then
				anchorFrame = button;
			else
				anchorFrame = button:GetParent();
			end
			point = "TOPLEFT";
			relativePoint = "TOPRIGHT";
			listFrame:SetPoint(point, anchorFrame, relativePoint, 0, 0);
		end
		
		-- Change list box appearance depending on display mode
		if ( dropDownFrame and dropDownFrame.displayMode == "MENU" ) then
			_G[listFrameName.."Backdrop"]:Hide();
			_G[listFrameName.."MenuBackdrop"]:Show();
		else
			_G[listFrameName.."Backdrop"]:Show();
			_G[listFrameName.."MenuBackdrop"]:Hide();
		end
		dropDownFrame.menuList = menuList;
		C_UIDropDownMenu_Initialize(dropDownFrame, dropDownFrame.initialize, nil, level, menuList);
		-- If no items in the drop down don't show it
		if ( listFrame.numButtons == 0 ) then
			return;
		end

		-- Check to see if the dropdownlist is off the screen, if it is anchor it to the top of the dropdown button
		listFrame:Show();
		-- Hack since GetCenter() is returning coords relative to 1024x768
		local x, y = listFrame:GetCenter();
		-- Hack will fix this in next revision of dropdowns
		if ( not x or not y ) then
			listFrame:Hide();
			return;
		end

		listFrame.onHide = dropDownFrame.onHide;
		
		-- Determine whether the menu is off the screen or not
		local offscreenY, offscreenX;
		if ( (y - listFrame:GetHeight()/2) < 0 ) then
			offscreenY = 1;
		end
		if ( listFrame:GetRight() > GetScreenWidth() ) then
			offscreenX = 1;	
		end
		
		--  If level 1 can only go off the bottom of the screen
		if ( level == 1 ) then
			if ( offscreenY and offscreenX ) then
				point = gsub(point, "TOP(.*)", "BOTTOM%1");
				point = gsub(point, "(.*)LEFT", "%1RIGHT");
				relativePoint = gsub(relativePoint, "TOP(.*)", "BOTTOM%1");
				relativePoint = gsub(relativePoint, "(.*)RIGHT", "%1LEFT");
			elseif ( offscreenY ) then
				point = gsub(point, "TOP(.*)", "BOTTOM%1");
				relativePoint = gsub(relativePoint, "(.*)RIGHT", "%1LEFT");
			elseif ( offscreenX ) then
				point = gsub(point, "(.*)LEFT", "%1RIGHT");
				relativePoint = gsub(relativePoint, "(.*)RIGHT", "%1LEFT");
			end
			
			listFrame:ClearAllPoints();
			if ( anchorName == "cursor" ) then
				listFrame:SetPoint(point, relativeTo, "BOTTOMLEFT", xOffset, yOffset);
			else
				listFrame:SetPoint(point, relativeTo, relativePoint, xOffset, yOffset);
			end
		else
			if ( offscreenY and offscreenX ) then
				point = gsub(point, "TOP(.*)", "BOTTOM%1");
				point = gsub(point, "(.*)LEFT", "%1RIGHT");
				relativePoint = gsub(relativePoint, "TOP(.*)", "BOTTOM%1");
				relativePoint = gsub(relativePoint, "(.*)RIGHT", "%1LEFT");
				xOffset = -11;
				yOffset = -14;
			elseif ( offscreenY ) then
				point = gsub(point, "TOP(.*)", "BOTTOM%1");
				relativePoint = gsub(relativePoint, "TOP(.*)", "BOTTOM%1");
				xOffset = 0;
				yOffset = -14;
			elseif ( offscreenX ) then
				point = gsub(point, "(.*)LEFT", "%1RIGHT");
				relativePoint = gsub(relativePoint, "(.*)RIGHT", "%1LEFT");
				xOffset = -11;
				yOffset = 14;
			else
				xOffset = 0;
				yOffset = 14;
			end
			
			listFrame:ClearAllPoints();
			listFrame.parentLevel = tonumber(strmatch(anchorFrame:GetName(), "C_DropDownList(%d+)"));
			listFrame.parentID = anchorFrame:GetID();
			listFrame:SetPoint(point, anchorFrame, relativePoint, xOffset, yOffset);
		end
	end
end

function C_CloseDropDownMenus(level)
	if ( not level ) then
		level = 1;
	end
	for i=level, C_UIDROPDOWNMENU_MAXLEVELS do
		_G["C_DropDownList"..i]:Hide();
	end
end

function C_UIDropDownMenu_OnHide(self)
	local id = self:GetID()
	if ( self.onHide ) then
		self.onHide(id+1);
		self.onHide = nil;
	end
	C_CloseDropDownMenus(id+1);
	C_OPEN_DROPDOWNMENUS[id] = nil;
end

function C_UIDropDownMenu_SetWidth(frame, width, padding)
	_G[frame:GetName().."Middle"]:SetWidth(width);
	local defaultPadding = 25;
	if ( padding ) then
		frame:SetWidth(width + padding);
	else
		frame:SetWidth(width + defaultPadding + defaultPadding);
	end
	if ( padding ) then
		_G[frame:GetName().."Text"]:SetWidth(width);
	else
		_G[frame:GetName().."Text"]:SetWidth(width - defaultPadding);
	end
	frame.noResize = 1;
end

function C_UIDropDownMenu_SetButtonWidth(frame, width)
	if ( width == "TEXT" ) then
		width = _G[frame:GetName().."Text"]:GetWidth();
	end
	
	_G[frame:GetName().."Button"]:SetWidth(width);
	frame.noResize = 1;
end

function C_UIDropDownMenu_SetText(frame, text)
	local filterText = _G[frame:GetName().."Text"];
	filterText:SetText(text);
end

function C_UIDropDownMenu_GetText(frame)
	local filterText = _G[frame:GetName().."Text"];
	return filterText:GetText();
end

function C_UIDropDownMenu_ClearAll(frame)
	-- Previous code refreshed the menu quite often and was a performance bottleneck
	frame.selectedID = nil;
	frame.selectedName = nil;
	frame.selectedValue = nil;
	C_UIDropDownMenu_SetText(frame, "");

	local button, checkImage;
	for i=1, C_UIDROPDOWNMENU_MAXBUTTONS do
		button = _G["C_DropDownList"..C_UIDROPDOWNMENU_MENU_LEVEL.."Button"..i];
		button:UnlockHighlight();

		checkImage = _G["C_DropDownList"..C_UIDROPDOWNMENU_MENU_LEVEL.."Button"..i.."Check"];
		checkImage:Hide();
	end
end

function C_UIDropDownMenu_JustifyText(frame, justification)
	local text = _G[frame:GetName().."Text"];
	text:ClearAllPoints();
	if ( justification == "LEFT" ) then
		text:SetPoint("LEFT", frame:GetName().."Left", "LEFT", 27, 2);
		text:SetJustifyH("LEFT");
	elseif ( justification == "RIGHT" ) then
		text:SetPoint("RIGHT", frame:GetName().."Right", "RIGHT", -43, 2);
		text:SetJustifyH("RIGHT");
	elseif ( justification == "CENTER" ) then
		text:SetPoint("CENTER", frame:GetName().."Middle", "CENTER", -5, 2);
		text:SetJustifyH("CENTER");
	end
end

function C_UIDropDownMenu_SetAnchor(dropdown, xOffset, yOffset, point, relativeTo, relativePoint)
	dropdown.xOffset = xOffset;
	dropdown.yOffset = yOffset;
	dropdown.point = point;
	dropdown.relativeTo = relativeTo;
	dropdown.relativePoint = relativePoint;
end

function C_UIDropDownMenu_GetCurrentDropDown()
	if ( C_UIDROPDOWNMENU_OPEN_MENU ) then
		return C_UIDROPDOWNMENU_OPEN_MENU;
	elseif ( C_UIDROPDOWNMENU_INIT_MENU ) then
		return C_UIDROPDOWNMENU_INIT_MENU;
	end
end

function C_UIDropDownMenuButton_GetChecked(self)
	return _G[self:GetName().."Check"]:IsShown();
end

function C_UIDropDownMenuButton_GetName(self)
	return _G[self:GetName().."NormalText"]:GetText();
end

function C_UIDropDownMenuButton_C_OpenColorPicker(self, button)
	CloseMenus();
	if ( not button ) then
		button = self;
	end
	C_UIDROPDOWNMENU_MENU_VALUE = button.value;
	C_OpenColorPicker(button);
end

function C_UIDropDownMenu_DisableButton(level, id)
	_G["C_DropDownList"..level.."Button"..id]:Disable();
end

function C_UIDropDownMenu_EnableButton(level, id)
	_G["C_DropDownList"..level.."Button"..id]:Enable();
end

function C_UIDropDownMenu_SetButtonText(level, id, text, colorCode)
	local button = _G["C_DropDownList"..level.."Button"..id];
	if ( colorCode) then
		button:SetText(colorCode..text.."|r");
	else
		button:SetText(text);
	end
end

function C_UIDropDownMenu_DisableDropDown(dropDown)
	local label = _G[dropDown:GetName().."Label"];
	if ( label ) then
		label:SetVertexColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	end
	_G[dropDown:GetName().."Text"]:SetVertexColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	_G[dropDown:GetName().."Button"]:Disable();
	dropDown.isDisabled = 1;
end

function C_UIDropDownMenu_EnableDropDown(dropDown)
	local label = _G[dropDown:GetName().."Label"];
	if ( label ) then
		label:SetVertexColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
	end
	_G[dropDown:GetName().."Text"]:SetVertexColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	_G[dropDown:GetName().."Button"]:Enable();
	dropDown.isDisabled = nil;
end

function C_UIDropDownMenu_IsEnabled(dropDown)
	return not dropDown.isDisabled;
end

function C_UIDropDownMenu_GetValue(id)
	--Only works if the dropdown has just been initialized, lame, I know =(
	local button = _G["C_DropDownList1Button"..id];
	if ( button ) then
		return _G["C_DropDownList1Button"..id].value;
	else
		return nil;
	end
end
