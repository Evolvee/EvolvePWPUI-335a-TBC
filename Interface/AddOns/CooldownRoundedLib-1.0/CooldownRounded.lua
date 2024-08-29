local numRows = 10;
local numColumns = 10;
local numCount = numRows * numColumns - 1;

local throttle = 1 / numCount; -- numCount fps limit, there is no reason to update anymore frequently
local noUpdatesTime = throttle;

local function ExecuteProtectedScript(scriptInfo, ...)
	if scriptInfo.protectedFunc ~= nil then
		scriptInfo.protectedFunc(...);
	end
	
	if scriptInfo.func ~= nil then
		scriptInfo.func(...)
	end
end

local function CreateScriptInfo(func, protectedFunc)
	local scriptInfo = {func = func, protectedFunc = protectedFunc};
	scriptInfo.handler = function(...) ExecuteProtectedScript(scriptInfo, ...) end
	return scriptInfo;
end

local function OnSetScript(self, name, func)
	-- to keep our update script

	if  self.Scripts[name] == nil then
		self.Scripts[name] = CreateScriptInfo();
	end

	scriptInfo = self.Scripts[name];
	
	if func ~= scriptInfo.handler then
		scriptInfo.func = func;
		self:SetScript(name, scriptInfo.handler)
	end
end

function CooldownRounded_SetProtectedScript(self, name, protectedFunc)
	if  self.Scripts[name] == nil then
		self.Scripts[name] = CreateScriptInfo();
	end
	
	scriptInfo = self.Scripts[name];

	scriptInfo.protectedFunc = protectedFunc
	OnSetScript(self, name, scriptInfo.func)
end

function CooldownRounded_SetReverse(self, reversed)
	self:SetAttribute("reverse", reversed);
end

function CooldownRounded_SetScale(self, scale)
	self:SetAttribute("scale", scale)
	CooldownRounded_OnSizeChanged(self, self:GetWidth(), self:GetHeight())
end

function CooldownRounded_UpdateAnimation(self, elapsed)
	if self.Status == 0 then
		return;
	end
	
	if noUpdatesTime < throttle then
		noUpdatesTime = noUpdatesTime + elapsed;
		return;
	else
		noUpdatesTime = 0;
	end
	
	local now = GetTime();
	local startTime = self.startTime;
	local duration = self.duration;
	local reversed = self:GetAttribute("reverse")
	
	if startTime == nil or duration == nil or now < startTime or now > (startTime + duration) then
		self.Status = 0;
		self:Hide();
		return;
	end
	
	local proceedTime = now - startTime;
	
	local percent = proceedTime / duration;
	local num = math.floor(percent * numCount);
	
	if not reversed then
		num = numCount - num;
	end
	
	local row = math.floor(num / numColumns);
	local column = num - (row * numColumns);
	
	local left = column / numColumns;
	local right = (column + 1) / numColumns;
	local top = row / numRows;
	local bottom = (row + 1) / numRows;

	if not reversed then
		local oldLeft = left;
		left = right;
		right = oldLeft;
	end
	
	self.Mask:SetTexCoord(left, right, top, bottom)
	self.Mask:Show()
end

function CooldownRounded_SetCooldown(self, startTime, duration)
	self.startTime = startTime;
	self.duration = duration;
	self:Show()
	self.Status = 1;
end

function CooldownRounded_OnUpdate(self, ...)
	CooldownRounded_UpdateAnimation(self, ...)
	
	if self.OnUpdateScript ~= nil then
		self.OnUpdateScript(self, ...)
	end
end

function CooldownRounded_OnSizeChanged(self, width, height)
	local scale = self:GetAttribute("scale")
	local multiplier = scale;
	local widthOffset = width * multiplier - width
	local heightOffset = height * multiplier - height
	
	self.Mask:SetAllPoints();
	for i=1, self.Mask:GetNumPoints() do
		point, relativeTo, relativePoint, xOfs, yOfs = self.Mask:GetPoint(i)
		
		if point == "TOPLEFT" then
			self.Mask:SetPoint(point, relativeTo, relativePoint, xOfs - widthOffset/2, yOfs + heightOffset/2)
		elseif point == "BOTTOMRIGHT" then
			self.Mask:SetPoint(point, relativeTo, relativePoint, xOfs + widthOffset/2, yOfs - heightOffset/2)
		end
	end
end

function CooldownRounded_OnLoad(self)
	self.Scripts = {}
	
	self.Mask = self:CreateTexture();
	self.Mask:SetTexture("Interface\\Addons\\CooldownRoundedLib-1.0\\textures\\circle");
	self.Mask:SetVertexColor(0,0,0, 0.8)
	self.Mask:SetAllPoints();
	self.Mask:Hide()

	local width = self.Mask:GetWidth();
	local height = self.Mask:GetHeight();
	
	self.SetCooldown = CooldownRounded_SetCooldown;
	self.SetReverse = CooldownRounded_SetReverse;
	
	hooksecurefunc(self, "SetScript", OnSetScript)
	CooldownRounded_SetProtectedScript(self, "OnUpdate", CooldownRounded_OnUpdate);
	CooldownRounded_SetProtectedScript(self, "OnSizeChanged", CooldownRounded_OnSizeChanged);
end