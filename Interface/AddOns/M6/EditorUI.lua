local addonName, T = ...
local MODERN = select(4,GetBuildInfo()) >= 8e4
local AB = T.ActionBook:compatible(2, 35)
local KR = T.ActionBook:compatible("Kindred", 1, 11)
local IM = T.ActionBook:compatible("Imp", 1, 0)
local EV = T.Evie
local MC = T.M6Core
local L = setmetatable({}, {__call=function(_,k) return k end})
local M = {}

local SetBackdrop do
	local edgeSlices = {
		{"TOPLEFT", 0, -1, "BOTTOMRIGHT", "BOTTOMLEFT", 1, 1},
		{"TOPRIGHT", 0, -1, "BOTTOMLEFT", "BOTTOMRIGHT", -1, 1},
		{"TOPLEFT", 1, 0, "BOTTOMRIGHT", "TOPRIGHT", -1, -1, ccw=true},
		{"BOTTOMLEFT", 1, 0, "TOPRIGHT", "BOTTOMRIGHT", -1, 1, ccw=true},
		{"TOPLEFT", 0, 0, "BOTTOMRIGHT", "TOPLEFT", 1, -1},
		{"TOPRIGHT", 0, 0, "BOTTOMLEFT", "TOPRIGHT", -1, -1},
		{"BOTTOMLEFT", 0, 0, "TOPRIGHT", "BOTTOMLEFT", 1, 1},
		{"BOTTOMRIGHT", 0, 0, "TOPLEFT", "BOTTOMRIGHT", -1, 1}
	}
	function SetBackdrop(f, info, bgColor, edgeColor)
		local insets = info.insets
		local es = info.edgeFile and (info.edgeSize or 39) or 0
		if info.bgFile then
			local bg = f:CreateTexture(nil, "BACKGROUND", nil, -7)
			local tileBackground = not not info.tile
			bg:SetTexture(info.bgFile, tileBackground, tileBackground)
			bg:SetPoint("TOPLEFT", (insets and insets.left or 0), -(insets and insets.top or 0))
			bg:SetPoint("BOTTOMRIGHT", -(insets and insets.right or 0), (insets and insets.bottom or 0))
			if bgColor then
				local n = bgColor
				bg:SetVertexColor((n - n % 2^16) / 2^16 % 256 / 255, (n - n % 2^8) / 2^8 % 256 / 255, n % 256 / 255, n >= 2^24 and (n - n % 2^24) / 2^24 % 256 / 255 or 1)
			end
			f.backdropBackground = bg
		end
		if info.edgeFile then
			local n = edgeColor or 0
			local r,g,b,a = (n - n % 2^16) / 2^16 % 256 / 255, (n - n % 2^8) / 2^8 % 256 / 255, n % 256 / 255, n >= 2^24 and (n - n % 2^24) / 2^24 % 256 / 255 or 1
			f.backdropBorder = {}
			for i=1,#edgeSlices do
				local t, s = f:CreateTexture(nil, "BORDER", nil, -6), edgeSlices[i]
				t:SetTexture(info.edgeFile, false, true)
				t:SetPoint(s[1], s[2]*es, s[3]*es)
				t:SetPoint(s[4], f, s[5], s[6]*es, s[7]*es)
				local x1, x2, y1, y2 = 1/128+(i-1)/8, i/8-1/128, 0.0625, 1-0.0625
				if s.ccw then
					t:SetTexCoord(x1,y2, x2,y2, x1,y1, x2,y1)
				else
					t:SetTexCoord(x1, x2, y1, y2)
				end
				if edgeColor then t:SetVertexColor(r,g,b,a) end
				f.backdropBorder[i] = t
			end
		end
	end
end
do -- EscapeCallback
	local getInfo, setInfo do
		local info = {}
		function getInfo(k)
			return info[k]
		end
		function setInfo(k, v)
			info[k] = v
		end
	end
	local function noop() end
	local function ESC_OnKeyDown(self, key)
		local it = getInfo(self)
		if key and (key == "ESCAPE" or key == it[3]) and GetCurrentKeyBoardFocus() == nil and not it[2](it[1], key) then
			return
		end
		local a, b = it[4], it[5]
		a:SetScript("OnKeyDown", nil)
		b:SetScript("OnKeyDown", noop)
		it[4], it[5] = b, a
	end
	function M:EscapeCallback(parent, key2, callback)
		if callback == nil then
			callback, key2 = key2, nil
		end
		local f0 = CreateFrame("Frame", nil, parent)
		local f1 = CreateFrame("Frame", nil, parent)
		local f2 = CreateFrame("Frame", nil, parent)
		setInfo(f0, {parent, callback, key2, f1, f2})
		f0:SetPropagateKeyboardInput(true)
		f0:SetScript("OnKeyDown", ESC_OnKeyDown)
		f1:SetScript("OnKeyDown", noop)
	end
end

local MacroTooltip = CreateFrame("GameTooltip", "M6MacroTooltip", UIParent) do
	MacroTooltip:SetFrameStrata("TOOLTIP")
	local title = MacroTooltip:CreateFontString(nil, "ARTWORK", "GameFontNormalMed2")
	local title2 = MacroTooltip:CreateFontString(nil, "ARTWORK", "GameFontNormalMed1")
	local desc = MacroTooltip:CreateFontString(nil, "ARTWORK", "GameFontHighlightLeft")
	title:SetPoint("TOPLEFT", 8, -8)
	title:SetJustifyH("LEFT")
	title2:SetJustifyH("RIGHT")
	title2:SetPoint("TOPRIGHT", -8, -8)
	title2:SetPoint("TOPLEFT", title, "TOPRIGHT", 12, 0)
	title2:SetTextColor(0.80, 0.80, 0.80)
	desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -3)
	desc:SetPoint("TOPRIGHT", title2, "BOTTOMRIGHT", 0, -3)
	MacroTooltip:AddFontStrings(title, title2)
	MacroTooltip:AddFontStrings(desc, MacroTooltip:CreateFontString())
	SetBackdrop(MacroTooltip, {edgeFile="Interface/Tooltips/UI-Tooltip-Border", bgFile="Interface/DialogFrame/UI-DialogBox-Background-Dark", tile=true, edgeSize=16, tileSize=16, insets={left=4,right=4,bottom=4,top=4}})
	MacroTooltip:SetScript("OnTooltipCleared", function(self)
		self:SetWidth(0)
	end)
end
local function shiftInputFocus(self)
	local focus = self.nextInput
	if IsShiftKeyDown() then
		focus = self.prevInput
	end
	if focus then
		focus:SetFocus()
	end
end
local multilineInput do
	local function onNavigate(self, _x,y, _w,h)
		local scroller = self.scroll
		local occH, occP, y = scroller:GetHeight(), scroller:GetVerticalScroll(), -y
		if occP > y then
			occP = y -- too far
		elseif (occP + occH) < (y+h) then
			occP = y+h-occH -- not far enough
		else
			return
		end
		scroller:SetVerticalScroll(occP)
		local _, mx = scroller.ScrollBar:GetMinMaxValues()
		occP = (mx-occP)^2 < 1 and mx or math.floor(occP)
		scroller.ScrollBar:SetMinMaxValues(0, occP < mx and mx or occP)
		scroller.ScrollBar:SetValue(occP)
	end
	local function onClick(self)
		self.input:SetFocus()
	end
	function multilineInput(name, parent, width)
		local scroller = CreateFrame("ScrollFrame", name .. "Scroll", parent, "UIPanelScrollFrameTemplate")
		local input = CreateFrame("Editbox", name, scroller)
		input:SetWidth(width-12)
		input:SetMultiLine(true)
		input:SetAutoFocus(false)
		input:SetTextInsets(2,4,0,2)
		input:SetFontObject(GameFontHighlight)
		input:SetScript("OnCursorChanged", onNavigate)
		input:SetScript("OnEscapePressed", input.ClearFocus)
		input:SetScript("OnTabPressed", shiftInputFocus)
		scroller:EnableMouse(1)
		scroller:SetScript("OnMouseDown", onClick)
		scroller:SetScrollChild(input)
		input.scroll, scroller.input = scroller, input
		return input, scroller
	end
end
local lineInput do
	function lineInput(parent, common, width)
		local input = CreateFrame("EditBox", nil, parent)
		input:SetAutoFocus(nil)
		input:SetSize(width or 150, 20)
		input:SetFontObject(ChatFontNormal)
		input:SetScript("OnEscapePressed", input.ClearFocus)
		input:SetScript("OnTabPressed", shiftInputFocus)
		local l, m, r = input:CreateTexture(nil, "BACKGROUND"), input:CreateTexture(nil, "BACKGROUND"), input:CreateTexture(nil, "BACKGROUND")
		l:SetSize(common and 8 or 32, common and 20 or 32) l:SetPoint("LEFT", common and -5 or -10, 0)
		l:SetTexture(common and "Interface\\Common\\Common-Input-Border" or "Interface\\ChatFrame\\UI-ChatInputBorder-Left2")
		r:SetSize(common and 8 or 32, common and 20 or 32) r:SetPoint("RIGHT", common and 0 or 10, 0)
		r:SetTexture(common and "Interface\\Common\\Common-Input-Border" or "Interface\\ChatFrame\\UI-ChatInputBorder-Right2")
		m:SetHeight(common and 20 or 32) m:SetPoint("LEFT", l, "RIGHT") m:SetPoint("RIGHT", r, "LEFT")
		m:SetTexture(common and "Interface\\Common\\Common-Input-Border" or "Interface\\ChatFrame\\UI-ChatInputBorder-Mid2")
		if common then
			l:SetTexCoord(0,1/16, 0,5/8)
			r:SetTexCoord(15/16,1, 0,5/8)
			m:SetTexCoord(1/16,15/16, 0,5/8)
		else
			m:SetHorizTile(true)
		end
		return input
	end
end
local uiScrollingDropdown do
	local sdAPI, scrollingDropdown = {}, CreateFrame("Frame", nil, UIParent) do
		local MIN_SCROLL_ENTRIES, MAX_VISIBLE_ENTRIES = 20, 16
		local WHEEL_STEP, WHEEL_DURATION = 8, 0.25
		local BUTTON_STEP, BUTTON_DURATION = 15, 0.15
		local SNAP_DURATION = 0.10
		local MAX_TARGET_DISTANCE, MIN_ANIM_FPS = 48, 45
		local clipRoot = CreateFrame("Frame", nil, scrollingDropdown)
		local relFrame = CreateFrame("Frame", nil, clipRoot)
		local slider = CreateFrame("Slider", nil, scrollingDropdown, "UIPanelScrollBarTemplate")
		local buttons = {}
		local SetDataSource, ReleaseDataSource, Entry_OnClick do
			local positionArchive = setmetatable({}, {__mode="k"})
			local dataList, entryFormat, entrySelect, fullSync
			local aTarget, aOrigin, aLength, aLeft
			function Entry_OnClick(self)
				local entrySelect, arg1 = entrySelect, dataList[self:GetID()]
				PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
				CloseDropDownMenus()
				entrySelect(nil, arg1)
			end
			local function VLD_OnUpdate(self, elapsed)
				aLeft = aLeft - elapsed
				local isDone, position = aLeft <= 0, aTarget
				if isDone then
					positionArchive[dataList] = aTarget
					aTarget, aOrigin, aLength, aLeft = nil
					self:SetScript("OnUpdate", nil)
				else
					local p = 1-aLeft/aLength
					p = p*p*(3-2*p)
					position = aOrigin*(1-p) + aTarget*p
				end
				local oy, baseOffset = (position % 1)*16, math.floor(position)
				relFrame:SetPoint("TOPLEFT", 0, oy)
				relFrame:SetPoint("TOPRIGHT", 0, oy)
				for i=1,#buttons do
					local w, eid = buttons[i], i+baseOffset
					local ek = dataList[eid]
					w:SetShown(ek ~= nil)
					if ek ~= nil then
						if fullSync or w:GetID() ~= eid then
							local text, selected = entryFormat(ek, dataList)
							w:SetText(text)
							w:SetChecked(selected)
							w:SetID(eid)
							w:GetFontString():GetLeft() -- TODO: (8.1.5) Without this, it sometimes gets lost.
						end
						w:SetEnabled(isDone)
					end
				end
				slider:SetValue(position)
				fullSync = false
			end
			local function ProcessScrollDelta(delta, time)
				local cur, vmin, vmax = slider:GetValue(), slider:GetMinMaxValues()
				local goal, time = cur+delta, GetFramerate() >= MIN_ANIM_FPS and time or 0
				if aTarget and aOrigin and (aOrigin < aTarget) == (cur < goal) then
					goal = delta < 0 and math.max(aTarget+delta, cur-MAX_TARGET_DISTANCE) or math.min(aTarget+delta, cur+MAX_TARGET_DISTANCE)
				end
				goal = math.min(vmax, math.max(vmin, math.floor(goal)))
				if aTarget == goal or (not aTarget and cur == goal) then
					return
				end
				aLength, aLeft = time, time
				aOrigin, aTarget = cur, goal
				scrollingDropdown:SetScript("OnUpdate", VLD_OnUpdate)
				VLD_OnUpdate(scrollingDropdown, 0)
			end
			scrollingDropdown:SetScript("OnMouseWheel", function(_, delta)
				return ProcessScrollDelta(-delta*WHEEL_STEP, WHEEL_DURATION)
			end)
			local function SB_OnClick(self)
				return ProcessScrollDelta(self == slider.ScrollUpButton and -BUTTON_STEP or BUTTON_STEP, BUTTON_DURATION)
			end
			slider.ScrollUpButton:SetScript("OnClick", SB_OnClick)
			slider.ScrollDownButton:SetScript("OnClick", SB_OnClick)
			slider.ScrollUpButton:SetMotionScriptsWhileDisabled(true)
			slider.ScrollDownButton:SetMotionScriptsWhileDisabled(true)
			slider:HookScript("OnMouseUp", function(self)
				local cv = self:GetValue()
				if cv % 1 ~= 0 then
					aLeft = GetFramerate() < MIN_ANIM_FPS and 0 or SNAP_DURATION
					aLength, aOrigin, aTarget = aLeft, self:GetValue(), math.floor(cv+0.5)
					scrollingDropdown:SetScript("OnUpdate", VLD_OnUpdate)
				end
			end)
			slider:SetScript("OnValueChanged", function(_, value, userDrag)
				if userDrag then
					aLeft, aTarget = 0, value
					VLD_OnUpdate(scrollingDropdown, 0)
				end
				local vmin, vmax = slider:GetMinMaxValues()
				slider.ScrollUpButton:SetEnabled(value ~= vmin)
				slider.ScrollDownButton:SetEnabled(value ~= vmax)
			end)
			function SetDataSource(list, format, func, skipFirst)
				dataList, entryFormat, entrySelect, fullSync = list, format, func, true
				local maxV, arch = #dataList-MAX_VISIBLE_ENTRIES, positionArchive[list]
				slider:SetMinMaxValues(skipFirst, maxV)
				aTarget, aLeft = skipFirst, 0
				if arch and skipFirst <= arch and arch <= maxV then
					aTarget = arch
				end
				VLD_OnUpdate(scrollingDropdown, 0)
			end
			function ReleaseDataSource()
				dataList, entryFormat, entrySelect = nil
			end
			DropDownList1:HookScript("OnHide", function()
				for k in pairs(positionArchive) do
					positionArchive[k] = nil
				end
			end)
		end
		local function bindToCounter(frame)
			if frame ~= scrollingDropdown then
				frame.parent = scrollingDropdown
			end
			frame:SetScript("OnEnter", UIDropDownMenu_StopCounting)
			frame:SetScript("OnLeave", UIDropDownMenu_StartCounting)
		end

		clipRoot:SetAllPoints()
		clipRoot:SetClipsChildren(true)
		slider:SetPoint("TOPRIGHT", -1, -12)
		slider:SetPoint("BOTTOMRIGHT", -1, 10)
		bindToCounter(slider)
		bindToCounter(slider.ScrollUpButton)
		bindToCounter(slider.ScrollDownButton)
		bindToCounter(clipRoot)
		bindToCounter(scrollingDropdown)
		scrollingDropdown:SetHitRectInsets(-4, -24, -8, -8)
		local bg = slider:CreateTexture(nil, "BACKGROUND")
		bg:SetWidth(1)
		bg:SetColorTexture(0.25, 0.25, 0.25)
		bg:SetPoint("TOPLEFT", -2, 17)
		bg:SetPoint("BOTTOMLEFT", -2, -16)
		relFrame:SetPoint("TOPLEFT")
		relFrame:SetPoint("TOPRIGHT")
		relFrame:SetHeight(1)
		for i=1,MAX_VISIBLE_ENTRIES+1 do
			local b = CreateFrame("CheckButton", nil, clipRoot, nil, i)
			b:SetSize(100, 16)
			b:SetHighlightTexture([[Interface\QuestFrame\UI-QuestTitleHighlight]])
			b:GetHighlightTexture():SetBlendMode("ADD")
			b:GetHighlightTexture():SetAllPoints()
			b:SetCheckedTexture([[Interface\Common\UI-DropDownRadioChecks]])
			b:GetCheckedTexture():SetTexCoord(0, 0.5, 0.5, 1)
			b:GetCheckedTexture():ClearAllPoints()
			b:GetCheckedTexture():SetSize(16,16)
			b:GetCheckedTexture():SetPoint("LEFT", 3, 0)
			b:SetNormalTexture([[Interface\Common\UI-DropDownRadioChecks]])
			b:GetNormalTexture():SetTexCoord(0.5, 1, 0.5, 1)
			b:GetNormalTexture():ClearAllPoints()
			b:GetNormalTexture():SetSize(16,16)
			b:GetNormalTexture():SetPoint("LEFT", 3, 0)
			b:SetNormalFontObject(GameFontHighlightSmallLeft)
			b:SetDisabledFontObject(GameFontHighlightSmallLeft)
			b:SetText("The Fifth Suprise")
			b:GetFontString():ClearAllPoints()
			b:GetFontString():SetPoint("LEFT", 22, 0)
			b:SetPoint("TOPLEFT", relFrame, 0, 16-16*i)
			b:SetPoint("TOPRIGHT", relFrame, -16, 16-16*i)
			bindToCounter(b)
			b:SetScript("OnClick", Entry_OnClick)
			buttons[i] = b
		end
		scrollingDropdown:SetScript("OnHide", function(self)
			self:Hide()
			ReleaseDataSource()
		end)
		function sdAPI:Display(level, dataList, entryFormatter, entrySelect, skipFirst)
			skipFirst = type(skipFirst) == "number" and skipFirst or 0
			local count = #dataList-skipFirst
			if count < MIN_SCROLL_ENTRIES then
				local info = {func=entrySelect, minWidth=level == 1 and UIDROPDOWNMENU_OPEN_MENU:GetWidth()-40 or nil}
				for i=skipFirst+1,#dataList do
					local k = dataList[i]
					info.arg1, info.text, info.checked = k, entryFormatter(k, dataList)
					UIDropDownMenu_AddButton(info, level)
				end
				return
			end
			local minWidth = math.max(120, level == 1 and UIDROPDOWNMENU_OPEN_MENU:GetWidth()-40 or 0)
			for i=skipFirst+1,#dataList do
				local text = entryFormatter(dataList[i], dataList)
				buttons[1]:SetText(text)
				minWidth = math.max(minWidth, 60 + buttons[1]:GetFontString():GetStringWidth())
			end
			local info = {notClickable=true, notCheckable=true, minWidth=minWidth}
			for i=1,MAX_VISIBLE_ENTRIES do
				UIDropDownMenu_AddButton(info, level)
			end
			local baseName = "DropDownList" .. level
			local host, b1, bX = _G[baseName], _G[baseName .. "Button1"], _G[baseName .. "Button" .. MAX_VISIBLE_ENTRIES]
			scrollingDropdown.parent = host
			scrollingDropdown:SetParent(host)
			scrollingDropdown:SetPoint("TOPLEFT", b1)
			scrollingDropdown:SetPoint("BOTTOMRIGHT", bX)
			SetDataSource(dataList, entryFormatter, entrySelect, skipFirst)
			scrollingDropdown:Show()
			scrollingDropdown:SetFrameLevel(b1:GetFrameLevel()+2)
			slider:SetFrameLevel(scrollingDropdown:GetFrameLevel()+3)
		end
	end
	uiScrollingDropdown = sdAPI
end

local mainPanel = CreateFrame("Frame", "M6UI", UIParent, "PortraitFrameTemplate") do
	local currentFilter = "all"

	local f = mainPanel do
		f.portrait = f.portrait or f.PortraitContainer.portrait
		f.TitleText = f.TitleText or f.TitleContainer.TitleText
		f:SetWidth(578)
		f:SetFrameStrata("HIGH")
		f:SetToplevel(true)
		f:Hide()
		SetPortraitToTexture(f.portrait, MODERN and "interface/icons/secrets_of_the_empire_icon" or "interface/icons/inv_misc_gear_01")
		f.Bg:SetTexture("Interface\\garrison\\GarrisonMissionUIInfoBoxBackgroundTile", true, true)
		f.Bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble", true, true)
		f.Bg:SetDrawLayer("BACKGROUND", -5)
		f.Bg1 = f:CreateTexture(nil, "BACKGROUND", nil, -4)
		f.Bg1:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock", true, true)
		f.Bg1:SetHorizTile(true)
		f.Bg1:SetPoint("TOPLEFT", 2, -24)
		f.Bg1:SetPoint("TOPRIGHT", -2, -24)
		f.Bg1:SetTexCoord(0,1,0,40/256)
		f.Bg1:SetHeight(38)
		f.BgSep = f:CreateTexture(nil, "BORDER", nil, 4)
		f.BgSep:SetPoint("TOPLEFT", f.Bg1, "BOTTOMLEFT", 0, 1)
		f.BgSep:SetPoint("TOPRIGHT", f.Bg1, "BOTTOMRIGHT", 0, 1)
		f.BgSep:SetHeight(8)
		f.BgSep:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true, false)
		f.BgSep:SetTexCoord(0,1, 28/128, 35/128)
		f.Status = f:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		f.Status:SetPoint("RIGHT", f, "TOPRIGHT", -16, -42);
		f.TitleText:SetText(addonName)
		f:EnableMouse(true)
		f:SetMovable(true)
		f:SetClampedToScreen(true)
		f:SetClampRectInsets(-10, 0, 12, 0)
		do -- Move Handles
			local function Mover_OnDown(_, button)
				if button == "LeftButton" then
					mainPanel:StartMoving()
				end
			end
			local function Mover_OnUp()
				mainPanel:StopMovingOrSizing()
			end
			local function Mover_OnEnter()
				SetCursor("Interface/CURSOR/UI-Cursor-Move.crosshair")
			end
			local function Mover_OnLeave()
				SetCursor(nil)
			end
			local h = CreateFrame("Frame", nil, mainPanel)
			h:SetAllPoints(MODERN and f.PortraitContainer.portrait or f.portrait)
			h:SetScript("OnMouseDown", Mover_OnDown)
			h:SetScript("OnMouseUp", Mover_OnUp)
			h:SetScript("OnEnter", Mover_OnEnter)
			h:SetScript("OnLeave", Mover_OnLeave)
			h = CreateFrame("Frame", nil, mainPanel)
			h:SetPoint("TOPLEFT", f.TitleText, "TOPLEFT", -4, 6)
			h:SetPoint("BOTTOMRIGHT", f.TitleText, "BOTTOMRIGHT", 32, -6)
			h:SetScript("OnMouseDown", Mover_OnDown)
			h:SetScript("OnMouseUp", Mover_OnUp)
			h:SetScript("OnEnter", Mover_OnEnter)
			h:SetScript("OnLeave", Mover_OnLeave)
		end
		
		local function HasOtherClosableThings()
			if GetUIPanel("left") or GetUIPanel("center") or GetUIPanel("right") or GetUIPanel("doublewide") or GetUIPanel("fullscreen") then
				return true
			end
			for i=1, NUM_CONTAINER_FRAMES do
				if _G["ContainerFrame"..i]:IsShown() then
					return true
				end
			end
			for i=1, #UISpecialFrames do
				local frame = _G[UISpecialFrames[i]]
				if frame and frame.IsForbidden and not frame:IsForbidden() and frame:IsShown() then
					return true
				end
			end
			return false
		end
		M:EscapeCallback(f, function(self, key)
			local closeMe = key == "ESCAPE" and not securecall(HasOtherClosableThings)
			if closeMe then
				self:Hide()
			end
			return not closeMe
		end)
	end
	local contentSlot = CreateFrame("Frame", nil, mainPanel) do
		contentSlot:SetPoint("TOPLEFT", f.BgSep, "BOTTOMLEFT", 0, 4)
		contentSlot:SetPoint("BOTTOMRIGHT", 0, 0)
	end
	local sf, bar, slate = CreateFrame("ScrollFrame", nil, contentSlot) do
		sf:SetPoint("TOPLEFT", 0, -1)
		sf:SetPoint("BOTTOMRIGHT", -24, 5)
		slate = CreateFrame("Frame", nil, sf) do
			slate:SetSize(mainPanel:GetWidth()-28, 42)
			sf:SetScrollChild(slate)
		end
		bar = CreateFrame("Slider", nil, sf) do
			bar:SetWidth(19)
			bar:SetPoint("TOPLEFT", sf, "TOPRIGHT", 1, -11)
			bar:SetPoint("BOTTOMLEFT", sf, "BOTTOMRIGHT", 1, 13)
			bar:SetThumbTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
			bar:GetThumbTexture():SetSize(18, 24)
			bar:GetThumbTexture():SetTexCoord(0.20, 0.80, 0.125, 0.875)
			bar:SetMinMaxValues(0, 1)
			bar:SetValue(0)
			local bg = bar:CreateTexture(nil, "BACKGROUND")
			bg:SetPoint("TOPLEFT", 0, 16)
			bg:SetPoint("BOTTOMRIGHT", 0, -14)
			bg:SetColorTexture(0,0,0)
			bg:SetAlpha(0.85)
			local top = bar:CreateTexture(nil, "ARTWORK")
			top:SetSize(24, 48)
			top:SetPoint("TOPLEFT", -4, 17)
			top:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
			top:SetTexCoord(0, 0.45, 0, 0.20)
			local bot = bar:CreateTexture(nil, "ARTWORK")
			bot:SetSize(24, 64)
			bot:SetPoint("BOTTOMLEFT", -4, -15)
			bot:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
			bot:SetTexCoord(0.515625, 0.97, 0.1440625, 0.4140625)
			local mid = bar:CreateTexture(nil, "ARTWORK")
			mid:SetPoint("TOPLEFT", top, "BOTTOMLEFT")
			mid:SetPoint("BOTTOMRIGHT", bot, "TOPRIGHT")
			mid:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
			mid:SetTexCoord(0, 0.45, 0.1640625, 1)
			local function Move(self)
				bar:SetValue(max(0,bar:GetValue() - (2-self:GetID()) * 216))
			end
			local up = CreateFrame("Button", nil, bar, "UIPanelScrollUpButtonTemplate", 1)
			up:SetPoint("BOTTOM", bar, "TOP", 0, -2)
			local down = CreateFrame("Button", nil, bar, "UIPanelScrollDownButtonTemplate", 3)
			down:SetPoint("TOP", bar, "BOTTOM", 0, 2)
			up:SetScript("OnClick", Move)
			down:SetScript("OnClick", Move)
			sf:SetScript("OnMouseWheel", function(_, direction)
				(direction == 1 and up or down):Click()
			end)
			bar:SetScript("OnValueChanged", function(self, v, _isUserInteraction)
				self:SetMinMaxValues(0, slate:DoLayout(v, sf:GetHeight()))
				local _, x = self:GetMinMaxValues()
				up:SetEnabled(v > 0)
				down:SetEnabled(v < x)
			end)
		end
		f.scrollList, sf.bar, sf.slate = sf, bar, slate
		local sysFilters = {all=1, active=1, keybound=1, inactive=1}
		function sf:Reset(resetFilter, newGroup)
			if resetFilter then
				sf:SetFilter("all", false)
			elseif not (sysFilters[currentFilter] or MC:GetGroupID(currentFilter)) then
				sf:SetFilter(newGroup and MC:GetGroupID(newGroup) or "all", false)
			end
			if bar:GetValue() ~= 0 then
				bar:SetValue(0)
			else
				bar:GetScript("OnValueChanged")(bar, 0)
			end
		end
		local newMacro = CreateFrame("Button", nil, sf) do
			newMacro:SetNormalTexture("Interface/GuildBankFrame/UI-GuildBankFrame-NewTab")
			newMacro:SetPushedTexture("Interface/GuildBankFrame/UI-GuildBankFrame-NewTab")
			newMacro:GetPushedTexture():SetTexCoord(-0.02, 0.98, -0.02, 0.98)
			newMacro:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
			newMacro:SetSize(24, 24)
			newMacro:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_NONE")
				GameTooltip:SetPoint("LEFT", self, "RIGHT", 4, 0)
				GameTooltip:SetText(L"Create a new macro")
			end)
			newMacro:SetScript("OnLeave", function(self)
				if GameTooltip:IsOwned(self) then
					GameTooltip:Hide()
				end
			end)
			newMacro:SetPoint("TOPLEFT", mainPanel, "TOPLEFT", 62, -32)
			newMacro:SetScript("OnClick", function()
				PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
				mainPanel.editPanel:Open(0)
			end)
		end
		local filterButton = CreateFrame("Button", nil, sf, "UIMenuButtonStretchTemplate") do
			filterButton:SetSize(92, 22)
			filterButton:SetText(L"Filter")
			filterButton:SetPoint("TOPRIGHT", mainPanel, "TOPRIGHT", -8, -36)
			local t = filterButton:CreateTexture(nil, "ARTWORK")
			t:SetTexture("Interface/ChatFrame/ChatFrameExpandArrow")
			t:SetSize(10,12)
			t:SetPoint("RIGHT", filterButton.MiddleRight, "RIGHT", -5, 0)
			filterButton.Icon = t
			local drop = CreateFrame("Frame", "M6UIFilterDropDown", filterButton, "UIDropDownMenuTemplate")
			filterButton:SetScript("OnClick", function(self)
				PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
				ToggleDropDownMenu(1, nil, drop, self, 0, 0)
				DropDownList1:ClearAllPoints()
				DropDownList1:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 8, 6)
			end)
			local function setFilter(_, fv)
				sf:SetFilter(fv, true)
				-- SD's short menu fallback to UIDD doesn't close the top-level menu
				CloseDropDownMenus()
			end
			local filters={"All","all", "Currently active","active", "Key-bound","keybound", "Inactive","inactive"}
			local function groupEntryFormat(k, list)
				return list._m[k], list._cv == k
			end
			function drop:initialize(level, nameList)
				if level == 2 then
					uiScrollingDropdown:Display(2, nameList, groupEntryFormat, setFilter, 8)
					return
				end
				local cv = sf:GetFilter()
				local info = {func=setFilter}
				for i=1,#filters, 2 do
					local fv = filters[i+1]
					info.text, info.arg1, info.checked = filters[i], fv, cv == fv
					UIDropDownMenu_AddButton(info)
				end
				local a, m = {}, {}
				for gid, name in MC:AllGroups() do
					m[gid], a[#a+1] = name, gid
				end
				if #a > 0 then
					table.sort(a, function(a,b) return strcmputf8i(m[a], m[b]) < 0 end)
					UIDropDownMenu_AddSeparator()
					local primaryLimit = #a > 12 and 8 or #a
					for i=1,primaryLimit do
						local fv = a[i]
						info.text, info.arg1, info.checked = m[fv], fv, fv == cv
						UIDropDownMenu_AddButton(info)
					end
					if primaryLimit < #a then
						info.hasArrow, info.notCheckable, info.padding, info.fontObject = 1, 1, 32, GameFontNormalSmall
						info.text, info.func, info.checked = nil
						info.menuList, info.text = a, L"More groups"
						a._m, a._cv = m, cv
						UIDropDownMenu_AddButton(info)
					end
				end
			end
		end
		
		mainPanel.Instruction = sf:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
		mainPanel.Instruction:SetPoint("BOTTOM", sf, "TOP", 10, 12)
		mainPanel.Instruction:SetText(L"Right click on a macro for options.")
	end
	local editPanel, getEditMacroText, setEditMacroText, clearMacroEditor = CreateFrame("Frame", nil, contentSlot) do
		mainPanel.editPanel = editPanel
		editPanel:SetPoint("TOPLEFT", sf, "TOPLEFT", 0, 0)
		editPanel:SetPoint("BOTTOMRIGHT", sf, "BOTTOMRIGHT", 20, 0)
		editPanel:Hide()
		local ebox, eboxFirst, eboxLast = {}
		local host, editorHost = AB:CreateEditorHost(editPanel) do
			host:SetPoint("TOPLEFT", 6, -73)
			host:SetPoint("BOTTOMRIGHT", -8, 34)
			local tt = {}
			function getEditMacroText()
				editorHost:GetAction(tt)
				return tt[2]
			end
			function setEditMacroText(text)
				editorHost:SetAction({"imptext", text})
			end
			function clearMacroEditor()
				editorHost:Clear()
			end
			function host:OnTabPressed()
				shiftInputFocus(ebox)
			end
			local function box_SetFocus(self)
				local w = editorHost:GetTabFocusWidget(self == eboxFirst and 1 or self == eboxLast and -1 or 0)
				if w then
					w:SetFocus()
				end
			end
			ebox.SetFocus, ebox.GetText = box_SetFocus, getEditMacroText
			eboxFirst = {SetFocus=ebox.SetFocus}
			eboxLast = {SetFocus=ebox.SetFocus}
			editPanel.box = ebox
		end
		local nbox = lineInput(editPanel, true, 200) do
			nbox:SetPoint("LEFT", editPanel, "TOPLEFT", 120, -12)
			local lab = nbox:CreateFontString(nil, "ARTWORK", "GameFontNormal")
			lab:SetText(L"Name:")
			lab:SetPoint("LEFT", editPanel, "TOPLEFT", 8, -12)
			editPanel.nameBox = nbox
		end
		local gbox = lineInput(editPanel, true, 145) do
			gbox:SetPoint("LEFT", nbox, "RIGHT", 100, 0)
			local lab = gbox:CreateFontString(nil, "ARTWORK", "GameFontNormal")
			lab:SetText(L"Group:")
			lab:SetPoint("LEFT", nbox, "RIGHT", 35, 0)
			editPanel.groupNameBox = gbox
		end
		gbox.nextInput, gbox.prevInput = eboxFirst, nbox
		nbox.nextInput, nbox.prevInput = gbox, eboxLast
		ebox.nextInput, ebox.prevInput = nbox, gbox
		local bind = CreateFrame("Button", nil, editPanel, "UIPanelButtonTemplate") do
			bind:SetWidth(260)
			bind:SetPoint("LEFT", editPanel, "TOPLEFT", 120-6, -54)
			bind:RegisterForClicks("AnyUp")
			local lab = bind:CreateFontString(nil, "ARTWORK", "GameFontNormal")
			lab:SetText(L"Binding:")
			lab:SetPoint("LEFT", editPanel, "TOPLEFT", 8, -54)
			local glob = CreateFrame("CheckButton", nil, bind, "InterfaceOptionsCheckButtonTemplate") do
				glob:SetPoint("LEFT", bind, "RIGHT", 2, -1)
				glob.Text:SetText(L"Global binding")
				glob:SetHitRectInsets(0, -glob.Text:GetStringWidth()-5, 0,0)
				glob:SetScript("OnClick", nil)
				bind.glob = glob
			end
			
			local alternateFrame = CreateFrame("Frame", nil, UIParent) do
				SetBackdrop(alternateFrame, { bgFile="Interface/ChatFrame/ChatFrameBackground", edgeFile="Interface/DialogFrame/UI-DialogBox-Border", tile=true, tileSize=32, edgeSize=32, insets={left=11, right=11, top=12, bottom=10}}, 0xd8000000)
				alternateFrame:SetSize(320, 115)
				alternateFrame:EnableMouse(1)
				alternateFrame:SetScript("OnHide", alternateFrame.Hide)
				local extReminder = CreateFrame("BUTTON", nil, alternateFrame)
				extReminder:SetHeight(16) extReminder:SetPoint("TOPLEFT", 12, -10) extReminder:SetPoint("TOPRIGHT", -12, -10)
				extReminder:SetNormalTexture("Interface/Buttons/UI-OptionsButton")
				extReminder:SetPushedTextOffset(0,0)
				extReminder:SetText(" ") extReminder:SetNormalFontObject(GameFontHighlightSmall) do
					local fs, tex = extReminder:GetFontString(), extReminder:GetNormalTexture()
					fs:ClearAllPoints() tex:ClearAllPoints()
					fs:SetPoint("LEFT", 18, -1) tex:SetSize(14,14) tex:SetPoint("LEFT")
				end
				alternateFrame.caption = extReminder
				extReminder:SetScript("OnEnter", function(self)
					GameTooltip:SetOwner(self, "ANCHOR_NONE")
					GameTooltip:SetPoint("TOP", self, "BOTTOM")
					GameTooltip:AddLine(L"Conditional Bindings", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
					GameTooltip:AddLine(L"The binding will update to reflect the value of this macro conditional.", HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, 1)
					GameTooltip:AddLine((L"You may use extended macro conditionals; see |cff33DDFF%s|r for details."):format("https://townlong-yak.com/addons/m6/conditionals"), HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, 1)
					GameTooltip:AddLine((L"Example: %s."):format(GREEN_FONT_COLOR_CODE .. "[combat] ALT-C; [nomounted] CTRL-F|r"), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
					GameTooltip:Show()
				end)
				extReminder:SetScript("OnLeave", function(self)
					if GameTooltip:IsOwned(self) then
						GameTooltip:Hide()
					end
				end)
				extReminder:SetScript("OnHide", extReminder:GetScript("OnLeave"))
				local input, scroll = multilineInput("M6_AlternateBindInput", alternateFrame, 335)
				alternateFrame.input, alternateFrame.scroll = input, scroll
				scroll:SetPoint("TOPLEFT", 10, -28)
				scroll:SetPoint("BOTTOMRIGHT", -33, 10)
				input:SetMaxBytes(1023)
				input:SetScript("OnEscapePressed", function() alternateFrame:Hide() end)
				input:SetScript("OnChar", function(self, c)
					if c == "\n" then
						local bind = strtrim((self:GetText():gsub("[\r\n]", "")))
						if bind ~= "" then
							alternateFrame.owner:SetBinding(bind)
						end
						alternateFrame:Hide()
					end
				end)
			end
			
			local function Deactivate(self)
				self:UnlockHighlight()
				self:EnableKeyboard(false)
				self:SetScript("OnHide", nil)
				self:SetScript("OnUpdate", nil)
				self:SetScript("OnKeyDown", nil)
				self:SetScript("OnGamePadButtonDown", nil)
				self:SetScript("OnMouseWheel", nil)
				self.capture = nil
				self:GetHighlightTexture():SetAlpha(0.25)
				if self.oldFocus then
					self.oldFocus:SetFocus()
					self.oldFocus = nil
				end
			end
			local function WatchFocus(self)
				if GetCurrentKeyBoardFocus() then
					self.oldFocus = nil
					Deactivate(self)
				end
			end
			local function GetCurrentModifiers()
				return (IsAltKeyDown() and "ALT-" or "") ..  (IsControlKeyDown() and "CTRL-" or "") .. (IsShiftKeyDown() and "SHIFT-" or "") .. (IsMetaKeyDown() and "META-" or "")
			end
			local unbindableKeys = {
				UNKNOWN=1, ESCAPE=1, ALT=1, SHIFT=1, META=1,
				LALT=1, LCTRL=1, LSHIFT=1, LMETA=1,
				RALT=1, RCTRL=1, RSHIFT=1, RMETA=1,
				PADRSTICKUP=1, PADRSTICKDOWN=1, PADRSTICKLEFT=1, PADRSTICKRIGHT=1,
				PADLSTICKUP=1, PADLSTICKDOWN=1, PADLSTICKLEFT=1, PADLSTICKRIGHT=1,
			}
			local function SetBind(self, bind)
				if bind == "ESCAPE" then
					return Deactivate(self)
				elseif unbindableKeys[bind] then
					return
				elseif GetCurrentKeyBoardFocus() then
					self.oldFocus = nil
					return Deactivate(self)
				end
				self:SetBinding(GetCurrentModifiers() .. bind)
			end
			local function SetWheelBind(self, delta)
				SetBind(self, delta > 0 and "MOUSEWHEELUP" or "MOUSEWHEELDOWN")
			end
			local buttonMap = {LeftButton="BUTTON1", RightButton="BUTTON2", MiddleButton="BUTTON3"}
			bind:SetScript("OnClick", function(self, button)
				if button == "LeftButton" then
					if self.capture then
						Deactivate(self)
					elseif IsAltKeyDown() then
						if alternateFrame:IsShown() and alternateFrame.owner == self then
							alternateFrame:Hide()
						else
							alternateFrame.owner = self
							alternateFrame.caption:SetText(L"Press ENTER to save.")
							alternateFrame.input:SetText(self.value or "")
							alternateFrame:SetParent(self)
							alternateFrame:SetFrameLevel(self:GetFrameLevel()+10)
							alternateFrame:ClearAllPoints()
							alternateFrame:SetPoint("TOP", self, "BOTTOM", 0, 4)
							if alternateFrame:GetLeft() < self:GetParent():GetLeft() then
								alternateFrame:SetPoint("TOPLEFT", self, "BOTTOMLEFT", -8, 4)
							elseif alternateFrame:GetRight() > self:GetParent():GetRight() then
								alternateFrame:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 8+22, 4)
							end
							alternateFrame:Show()
							alternateFrame.input:SetFocus()
						end
					else
						self.capture = true
						self:LockHighlight()
						self:GetHighlightTexture():SetAlpha(1)
						self:SetScript("OnHide", Deactivate)
						self:SetScript("OnUpdate", WatchFocus)
						self:SetScript("OnKeyDown", SetBind)
						self:SetScript("OnGamePadButtonDown", SetBind)
						self:SetScript("OnMouseWheel", SetWheelBind)
						local kf = GetCurrentKeyBoardFocus()
						if kf and kf.ClearFocus and kf.SetFocus then
							kf:ClearFocus()
							self.oldFocus = kf
						end
					end
				elseif button == "RightButton" then
					if self.capture then
						self:SetBinding(nil)
					end
				elseif self.capture then
					self:SetBinding(GetCurrentModifiers() .. (buttonMap[button] or button:upper()))
				end
			end)
			local specialSymbolMap = {OPEN="[", CLOSE="]", SEMICOLON=";"}
			local function bindNameLookup(c)
				return GetBindingText(specialSymbolMap[c] or c)
			end
			function bind:SetBinding(bind)
				self.value = bind ~= "" and bind or nil
				if self.value and bind:match("%[.*%]") then
					local cv = KR:EvaluateCmdOptions(self.value)
					local text = cv and cv:gsub("[^%-]+$", bindNameLookup) or NONE_KEY
					self:SetText(text .. " |cff20ff20[+]")
				else
					self:SetText(self.value and self.value:gsub("[^%-]+$", bindNameLookup) or NONE_KEY)
				end
				Deactivate(self)
			end
			editPanel.bind = bind
		end
		local ico = CreateFrame("Button", nil, editPanel) do
			ico:SetSize(204, 18)
			ico:SetPoint("LEFT", editPanel, "TOPLEFT", 120, -33)
			ico:RegisterForClicks("AnyUp")
			ico:SetNormalFontObject(GameFontHighlightSmall2)
			ico:SetHighlightFontObject(GameFontHighlightSmall2)
			ico:SetText("!")
			local fs = ico:GetFontString()
			fs:ClearAllPoints()
			fs:SetPoint("LEFT", 24, 0)
			ico:SetNormalTexture("Interface\\Icons\\INV_Misc_QuestionMark")
			local nt = ico:GetNormalTexture()
			nt:ClearAllPoints()
			nt:SetSize(18, 18)
			nt:SetPoint("LEFT")
			ico:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
			local ht = ico:GetHighlightTexture()
			ht:SetAllPoints(nt)
			local lab = ico:CreateFontString(nil, "ARTWORK", "GameFontNormal")
			lab:SetText(L"Icon:")
			lab:SetPoint("LEFT", editPanel, "TOPLEFT", 8, -33)
			function ico:SetIcon(tex, ...)
				self.value = tex
				if select("#", ...) == 1 then
					self.dynamicIcon = ...
				end
				self:SetText(tex and L"Static custom icon" or L"Determined by macro content")
				self:SetNormalTexture(tex or self.dynamicIcon or "Interface\\Icons\\INV_Misc_QuestionMark")
			end
			editPanel.icon = ico
			do
				local frame = CreateFrame("Frame", nil, ico)
				SetBackdrop(frame, {bgFile = "Interface/ChatFrame/ChatFrameBackground", edgeFile = "Interface/DialogFrame/UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32, insets = { left = 11, right = 11, top = 12, bottom = 10 }}, 0)
				frame:SetSize(314, 19+34*7+20) frame:SetPoint("TOPRIGHT", ico, "BOTTOMRIGHT", 4, 4)
				frame:EnableMouse(1) frame:SetToplevel(true) frame:Hide()
				frame:SetHitRectInsets(-10, 0,0, -10)
				ico:SetScript("OnClick", function() frame:SetShown(not frame:IsShown()) PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON) end)
				M:EscapeCallback(frame, function(self, key)
					if key == "ESCAPE" then
						self:Hide()
					end
				end)
				frame:SetScript("OnHide", frame.Hide)
				local icons, selectedIconButton = {}
				local function onClick(self)
					if selectedIconButton then selectedIconButton:SetChecked(nil) end
					ico:SetIcon(self:GetChecked() and self.tex:GetTexture() or nil)
					selectedIconButton = self:GetChecked() and self or nil
					PlaySound(SOUNDKIT.U_CHAT_SCROLL_BUTTON)
				end
				do
					local ed = lineInput(frame, false, 269)
					local hint = ed:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
					hint:SetPoint("CENTER")
					hint:SetText("|cffa0a0a0" .. L"(enter an icon name or path here)")
					local bg = ed:CreateTexture(nil, "BACKGROUND", nil, -8)
					bg:SetColorTexture(0,0,0,0.95)
					bg:SetPoint("TOPLEFT", -3, 3)
					bg:SetPoint("BOTTOMRIGHT", 3, -3)
					ed:SetPoint("BOTTOMLEFT", 11, 8)
					ed:SetTextInsets(2, 0, 0, 0)
					ed:SetFrameLevel(ed:GetFrameLevel()+5)
					ed:SetScript("OnEditFocusGained", function() hint:Hide() end)
					ed:SetScript("OnEditFocusLost", function(self) hint:SetShown(not self:GetText():match("%S")) end)
					local function GetPositiveFileIDFromPath(path)
						local id = GetFileIDFromPath(path)
						return id and id > 0 and id or nil
					end
					ed:SetScript("OnEnterPressed", function(self)
						local text = self:GetText()
						if text:match("%S") then
							local path = GetPositiveFileIDFromPath(text)
							path = path or GetPositiveFileIDFromPath("Interface\\Icons\\" .. text)
							ico:SetIcon(path or tonumber(text) or text or nil)
							if selectedIconButton then selectedIconButton:SetChecked(nil) end
							selectedIconButton = nil
						end
						self:SetText("")
						self:ClearFocus()
					end)
					ed:SetScript("OnEscapePressed", function(self) self:SetText("") self:ClearFocus() end)
					frame.textInput, frame.textInputHint = ed, hint
					M:EscapeCallback(frame, "TAB", function(self, key)
						if key == "TAB" then
							ed:SetFocus()
						elseif key == "ESCAPE" then
							self:Hide()
						end
					end)
				end
				local function createIconButton(name, parent, id)
					local f = CreateFrame("CheckButton", name, parent)
					f:SetSize(32,32)
					f:SetNormalTexture("")
					f:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
					f:GetHighlightTexture():SetBlendMode("ADD")
					f:SetCheckedTexture("Interface/Buttons/CheckButtonHilight")
					f:GetCheckedTexture():SetBlendMode("ADD")
					f:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
					f.tex = f:CreateTexture() f.tex:SetAllPoints()
					f:SetID(id or 0)
					return f
				end
				for i=0,55 do
					local j = createIconButton(nil, frame, i)
					j:SetPoint("TOPLEFT", (i % 8)*34+12, -11 - 34*math.floor(i / 8))
					j:SetScript("OnClick", onClick)
					icons[i] = j
				end
				local icontex = {}
				local slider = CreateFrame("Slider", nil, frame, "UIPanelScrollBarTemplate")
					slider:SetPoint("TOPRIGHT",-10, -27) slider:SetPoint("BOTTOMRIGHT", -10, 27)
					slider:SetValueStep(8) slider:SetObeyStepOnDrag(true)
					local t = slider:CreateTexture()
					t:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
					t:SetSize(24,48)
					t:SetPoint("TOPLEFT", -5, 19)
					t:SetTexCoord(0, 0.45, 0, 0.20)
					t = slider:CreateTexture()
					t:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
					t:SetSize(24,64)
					t:SetPoint("BOTTOMLEFT", -5, -17)
					t:SetTexCoord(0.515625, 0.97, 0.1440625, 0.4140625)
					t = slider:CreateTexture()
					t:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
					t:SetPoint("TOPLEFT", -5, 19-48)
					t:SetPoint("BOTTOMRIGHT", slider, "BOTTOMLEFT", 19, 47)
					t:SetTexCoord(0, 0.45, 0.1640625, 1)
					slider:SetScript("OnValueChanged", function(self, value)
						self.ScrollUpButton:SetEnabled(value > 1)
						self.ScrollDownButton:SetEnabled(icontex[value + #icons + 1] ~= nil)
						selectedIconButton = nil
						for i=0,#icons do
							local tw, isSelected = icons[i].tex
							tw:SetTexture(icontex[i+value])
							isSelected = ico.value == tw:GetTexture()
							icons[i]:SetChecked(isSelected)
							selectedIconButton = isSelected and icons[i] or selectedIconButton
						end
					end)
				frame:SetScript("OnShow", function(self)
					self:SetFrameLevel(math.min(9990, self:GetParent():GetFrameLevel()+200))
					icontex = GetMacroIcons()
					GetMacroItemIcons(icontex)
					slider:SetMinMaxValues(1, #icontex-#icons)
					slider:SetValue(1)
					local mf = GetCurrentKeyBoardFocus()
					if mf and mf.ClearFocus then
						mf:ClearFocus()
					end
				end)
				frame:SetScript("OnMouseWheel", function(_, delta)
					slider:SetValue(slider:GetValue()-delta*15)
				end)
			end
		end
		local save = CreateFrame("Button", nil, editPanel, "UIPanelButtonTemplate")
		save:SetWidth(120)
		save:SetText(L"Save")
		save:SetPoint("BOTTOMRIGHT", -2, 4)
		save:SetScript("OnClick", function() PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK) editPanel:Save() end)
		local cancel = CreateFrame("Button", nil, editPanel, "UIPanelButtonTemplate")
		cancel:SetWidth(120)
		cancel:SetText(L"Cancel")
		cancel:SetPoint("RIGHT", save, "LEFT", -16, 0)
		cancel:SetScript("OnClick", function()
			PlaySound(SOUNDKIT.GS_TITLE_OPTION_EXIT)
			editPanel:Hide()
			sf:Show()
		end)
		M:EscapeCallback(editPanel, "TAB", function(s, key)
			if key == "ESCAPE" then
				cancel:Click()
			elseif key == "TAB" then
				local focusBox = s.nameBox:GetText() == "" and ebox:GetText() == "" and s.nameBox or ebox
				focusBox:SetFocus()
			end
		end)
	end
	local menu, drop = {
		{text="Place on action bars", func=function(_, id) MC:PickupAction(id) slate:SyncContent() end, notCheckable=true},
		{text="Deactivate", notCheckable=true, func=function(_, id) MC:DeactivateAction(id) slate:SyncContent() end},
		{text="|cffff0000Delete", notCheckable=true, func=function(_, id) MC:DeleteAction(id) slate:ReFilter() end},
	}, CreateFrame("Frame", "M6ActionsDropDown", slate, "UIDropDownMenuTemplate")
	local function Button_OnClick(self, button)
		local id = self:GetID()
		if id == 0 or button == "LeftButton" then
			PlaySound(SOUNDKIT.IG_QUEST_LIST_OPEN)
			editPanel:Open(id)
		elseif UIDROPDOWNMENU_OPEN_MENU == drop and DropDownList1:IsVisible() and menu[1].arg1 == id then
			CloseDropDownMenus()
		elseif button == "RightButton" then
			for i=1,#menu do
				menu[i].arg1 = id
			end
			menu[2].disabled = not MC:IsActionActivated(id)
			EasyMenu(menu, drop, "cursor", 9000, 9000, "MENU", 4)
			DropDownList1:ClearAllPoints()
			DropDownList1:SetPoint("TOPLEFT", self, "TOPRIGHT", 1, 8)
		end
	end
	local function Button_OnDrag(self)
		local id = self:GetID()
		if id > 0 and (IsShiftKeyDown() or MC:IsActionActivated(id)) then
			MC:PickupAction(id)
			slate:SyncContent()
		end
	end
	local function Button_OnEnter(self)
		local id = self:GetID()
		local name = id == 0 and "Create new macro" or MC:GetActionName(id)
		local group = id ~= 0 and MC:GetActionGroup(id)
		MacroTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
		MacroTooltip:AddDoubleLine(name or "Unnamed macro", group or "", nil, nil, nil, 0.60, 0.60, 0.60)
		if id ~= 0 then
			local mt, text = MC:GetAction(id)
			if type(text) ~= "string" then
				text = ""
			elseif mt == "imptext" then
				text = (IsAltKeyDown() and IM.DecodeTokens or IM.FormatTokens)(IM, text)
			end
			local pat = "^(" .. ("[^\n]*\n"):rep(20) .. ").+"
			MacroTooltip:AddLine(text ~= "" and text:gsub(pat, "%1|cff909090[...]") or ("|cff909090" .. L"Blank"), 1,1,1,1)
		end
		MacroTooltip:Show()
	end
	local function Button_OnLeave(self)
		if MacroTooltip:IsOwned(self) then
			MacroTooltip:Hide()
		end
	end
	local function CreateButton(p, w)
		local b = CreateFrame("Button", nil, p)
		b:SetSize(w,w)
		b:SetNormalTexture("Interface/Icons/Temp")
		b:GetNormalTexture():SetAlpha(0)
		b.Icon = b:CreateTexture(nil, "BACKGROUND")
		b.Icon:SetPoint("TOPRIGHT", -2, -2)
		b.Icon:SetPoint("BOTTOMLEFT", 2, 2)
		b:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
		b:SetPushedTexture("Interface/Buttons/UI-Quickslot-Depress")
		b:GetPushedTexture():SetAllPoints(b.Icon)
		b:GetHighlightTexture():SetAllPoints(b.Icon)
		b:SetScript("OnClick", Button_OnClick)
		b:SetScript("OnDragStart", Button_OnDrag)
		b:SetScript("OnEnter", Button_OnEnter)
		b:SetScript("OnLeave", Button_OnLeave)
		b:RegisterForClicks("RightButtonUp", "LeftButtonUp")
		b:RegisterForDrag("LeftButton")
		b.border = b:CreateTexture(nil, "OVERLAY")
		b.border:SetAllPoints()
		return b
	end
	slate.keys, slate.buttons = {}, {}
	
	local TOTAL_WIDTH, BUTTON_SIZE = slate:GetWidth()-2, 40
	local BUTTONS_PER_ROW = math.floor(TOTAL_WIDTH/(BUTTON_SIZE+2))
	local BUTTON_SPACER = BUTTON_SIZE + math.floor((TOTAL_WIDTH-BUTTON_SIZE*BUTTONS_PER_ROW)/(BUTTONS_PER_ROW-1))
	local BUTTON_LEFT = (TOTAL_WIDTH - BUTTON_SPACER*(BUTTONS_PER_ROW-1)-BUTTON_SIZE)/2

	function sf:SetFilter(filterKey, callReset)
		if currentFilter ~= filterKey then
			wipe(slate.keys)
			currentFilter = filterKey
			if callReset then
				sf:Reset()
			end
		end
	end
	function sf:GetFilter()
		return currentFilter
	end
	function slate:PrepareView()
		local kt = self.keys or {}
		if not kt[1] then
			local o = {}
			for id, name in MC:AllActions() do
				local f = true
				if currentFilter == "all" then
					f = true
				elseif currentFilter == "active" then
					f = MC:IsActionActivated(id)
				elseif currentFilter == "keybound" then
					f = not not MC:GetActionBind(id)
				elseif currentFilter == "inactive" then
					f = not (MC:IsActionActivated(id) or MC:GetActionBind(id))
				else
					local _, gid = MC:GetActionGroup(id)
					f = gid == currentFilter
				end
				if f then
					kt[#kt+1] = id
					o[id] = name
				end
			end
			table.sort(kt, function(a, b)
				local ac, bc = o[a], o[b]
				if ac and bc then
					return ac < bc
				elseif ac or bc then
					return not bc
				end
				return a < b
			end)
			self.keys = kt
		end
		return kt
	end
	function slate:SyncContent()
		local bt = self.buttons
		for i=1,#bt do
			local b = bt[i]
			local id = b:IsShown() and b:GetID()
			if id and (id <= 0 or MC:IsActionValid(id)) then
				local showBorder, ico = false, id <= 0 and "Interface/GuildBankFrame/UI-GuildBankFrame-NewTab" or MC:GetActionIcon(id)
				if not ico then
					local _, _, tex = AB:GetActionDescription(MC:GetAction(id))
					ico = tex or "Interface/Icons/INV_Misc_QuestionMark"
				end
				if MC:IsActionActivated(id) then
					b.border:SetAtlas("loottoast-itemborder-blue")
					showBorder = true
				elseif MC:GetActionBind(id) then
					b.border:SetAtlas("loottoast-itemborder-green")
					showBorder = true
				end
				b.border:SetShown(showBorder)
				if type(ico) == "string" and GetFileIDFromPath(ico) == nil then
					b.Icon:SetAtlas(ico)
				else
					b.Icon:SetTexture(ico)
				end
			end
		end
	end
	function slate:ReFilter()
		wipe(slate.keys)
		sf:Reset()
	end
	function slate:DoLayout(ofs, h)
		local kt, bt = slate:PrepareView(), self.buttons
		for i=1,#kt do
			local sb, id = bt[i], kt[i]
			if not sb then
				sb = CreateButton(self, BUTTON_SIZE)
				sb:SetPoint("TOPLEFT", BUTTON_LEFT + (i-1) % BUTTONS_PER_ROW * BUTTON_SPACER, -math.floor((i-1)/BUTTONS_PER_ROW) * BUTTON_SPACER)
				bt[i] = sb
			end
			sb:SetID(id)
			sb:Show()
		end
		for i=#kt+1,#bt do
			bt[i]:Hide()
		end
		self:SyncContent()
		self:SetPoint("TOPLEFT", 0, ofs)
		return math.max(0, math.ceil(#kt/8)*36 - h)
	end
	mainPanel:SetScript("OnShow", function()
		wipe(slate.keys)
		sf:Reset()
	end)
	function editPanel:Save()
		local id, nbox, gbox, mt = self.id, self.nameBox, self.groupNameBox, getEditMacroText()
		if id > 0 then
			MC:SetAction(id, "imptext", mt)
		else
			id = MC:NewAction("imptext", mt)
			self.id = id
		end
		local group = gbox:GetText()
		MC:SetActionBind(id, self.bind.value, self.bind.glob:GetChecked())
		MC:SetActionIcon(id, self.icon.value)
		MC:SetActionGroup(id, group)
		if MC:SetActionName(id, nbox:GetText()) then
			self:Hide()
			clearMacroEditor()
			wipe(slate.keys)
			sf:Reset(false, group)
			sf:Show()
		else
			nbox:SetText(MC:GetActionName(id))
			nbox:SetFocus()
		end
	end
	function editPanel:Open(id)
		self.id = id
		local text, isBindLocal, ico, bind, name, group, ico2, _, globalBind = "", true
		if id > 0 then
			local t, a = MC:GetAction(id)
			if t == "macrotext" or t == "imptext" then
				text = a
			end
			name, group, ico = MC:GetActionName(id), MC:GetActionGroup(id), MC:GetActionIcon(id)
			bind, isBindLocal, globalBind = MC:GetActionBind(id)
			_, _, ico2 = AB:GetActionDescription(MC:GetAction(id))
		end
		self.id, self.icon.value = id, ico
		setEditMacroText(text)
		self.nameBox:SetText(name or "")
		self.groupNameBox:SetText(group or "")
		self.bind:SetBinding(bind)
		self.bind.glob:SetChecked(globalBind and (globalBind == bind or not isBindLocal))
		self.icon:SetIcon(ico, ico2)
		CloseDropDownMenus()
		sf:Hide()
		self:Show()
		self[id > 0 and "box" or "nameBox"]:SetFocus()
	end
	function mainPanel:ReturnToList(resetFilter)
		editPanel:Hide()
		wipe(slate.keys)
		sf:Reset(resetFilter)
		sf:Show()
	end
	function EV:M6_ACTIVE_SET_CHANGED()
		slate:SyncContent()
	end
end

local function copyProfileData(from, method, cmd, desc, oktext)
	local cn, rm, rn, si = from:match("^%s*([^%-%s]+)(%-?)(.-)%s* (%d)%s*$")
	if not si then
		print(YELLOW_FONT_COLOR_CODE .. (L"Syntax: %s %s %s-%s %s"):format(
			SLASH_M61, cmd,
			HIGHLIGHT_FONT_COLOR_CODE .. L"{character name}" .. "|r",
			HIGHLIGHT_FONT_COLOR_CODE .. L"{realm name}" .. "|r",
			HIGHLIGHT_FONT_COLOR_CODE .. L"{specialization index}" .. "|r"
		))
		print(YELLOW_FONT_COLOR_CODE .. "   " .. desc)
		local s, c, r = GetSpecialization(), UnitName("player"), GetRealmName()
		print(YELLOW_FONT_COLOR_CODE .. "   " .. (L"Example: %s %s %s-%s %d"):format(HIGHLIGHT_FONT_COLOR_CODE .. SLASH_M61, cmd, c, r, s))
		return
	end
	local r, c = MC:HasProfile(cn, rm == "-" and rn or nil, si+0)
	if r then
		if M6[method](M6, c, r, si+0) then
			print(YELLOW_FONT_COLOR_CODE .. (oktext):format(HIGHLIGHT_FONT_COLOR_CODE .. c, r .. "|r", HIGHLIGHT_FONT_COLOR_CODE .. si .. "|r"))
		end
	else
		print(YELLOW_FONT_COLOR_CODE .. (c and L"A realm name must be specified." or L"Character/specialization not found."))
	end
end

SLASH_M61, SlashCmdList.M6 = "/m6", function(arg)
	local av, ar = (arg or ""):match("^%s*(%S+)%s*(.-)$")
	if av == "vers" then
		print(("|cffa526ff[%s] |cffffffff%s|cfff8a800%s"):format(
			addonName, GetAddOnMetadata(addonName, "Version") or "?",
			T.SkipLocalActionBook and "+sha" or "+int"
		))
		return
	elseif av == "copy-map" or av == "cm" then
		return copyProfileData(ar, "ReplaceProfileMap", "copy-map", L"Changes M6 macro assignments to those used by the specified character.", L"M6 macro asssignments copied from %s-%s (spec %s).")
	elseif av == "copy-bindings" or av == "cb" then
		return copyProfileData(ar, "ReplaceProfileBindings", "copy-bindings", L"Changes M6 macro bindings to those used by the specified character.", L"M6 macro bindings copied from %s-%s (spec %s).")
	end
	mainPanel:SetShown(not mainPanel:IsShown())
	if mainPanel:IsShown() then
		mainPanel:ClearAllPoints()
		mainPanel:SetPoint("CENTER")
		mainPanel:ReturnToList(true)
	end
end