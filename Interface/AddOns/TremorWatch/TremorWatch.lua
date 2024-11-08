TremorWatchMainFrame = CreateFrame("Frame", "TremorWatchMainFrame",UIParent)

TremorWatchMainFrame.Keys = 
{
	ShowPulses = "showPulses",
	Size = "size",
	Alpha = "alpha",
	Delay = "Delay",
	TestMode = "testMode",
	PlaySounds = "playSounds",
	ArenaOnly = "arenaOnly"
}

local Keys = TremorWatchMainFrame.Keys

local function OnTremorTick()
	if TremorWatchSettings.DB[Keys.PlaySounds] and TremorWatchMainFrame:IsVisible() then
		PlaySoundFile("Interface\\AddOns\\TremorWatch\\Sounds\\mallet-alert.mp3")
	end
end

TremorWatchMainFrame.cooldown = CreateFrame("Cooldown", nil, TremorWatchMainFrame, "CooldownFrameTemplate")

TremorWatchSettings = TremorWatchSettings or {
	Location = {Point = "Top", RelativeTo = nil, RelativePoint = "Top", XOfs = 0, YOfs = 0}, 
	DB = 
	{
		[Keys.ShowPulses]=true,
		[Keys.PlaySounds]=true,
		[Keys.Size]=130,
		[Keys.Alpha]=0.8,
		[Keys.Delay]=0
	}
}

local random = math.random
local function uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

local function _wait(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false;
	end

	if (delay <= 0) then
		func(...)
	else
		if(waitFrame == nil) then
			waitTable = {}
			waitFrame = CreateFrame("Frame","WaitFrame", UIParent);
			waitFrame:SetScript("onUpdate",function (self,elapse)
				local count = #waitTable;
				local i = 1;
				while(i<=count) do
					local waitRecord = tremove(waitTable,i);
					local d = tremove(waitRecord,1);
					local f = tremove(waitRecord,1);
					local p = tremove(waitRecord,1);
					if(d>elapse) then
					  tinsert(waitTable,i,{d-elapse,f,p});
					  i = i + 1;
					else
					  count = count - 1;
					  f(unpack(p));
					end
				end
			end);
		end
		
		tinsert(waitTable,{delay,func,{...}});
		return true;
	end
end

local function SetVisibility(target, value)
	if target ~= nil then
		if value then 
			target:Show()
		else
			target:Hide()
		end
	end
end


local function ScheduleResetCooldown(guid)
	if TremorWatchMainFrame.GUID == guid then
		OnTremorTick()
		TremorWatchMainFrame.cooldown:SetCooldown(GetTime() - TremorWatchSettings.DB[Keys.Delay], 3)
		_wait(3, ScheduleResetCooldown, guid)
	end
end

function TremorWatchMainFrame:OnSettingsUpdated(key)
	TremorWatchMainFrame:SetLocked(not TremorWatchSettings.DB[Keys.TestMode])
	TremorWatchMainFrame:SetSize(TremorWatchSettings.DB[Keys.Size], TremorWatchSettings.DB[Keys.Size])
	TremorWatchMainFrame:SetAlpha(TremorWatchSettings.DB[Keys.Alpha])
	
	if not TremorWatchSettings.DB[Keys.ShowPulses] then
		TremorWatchMainFrame.GUID = -1
		TremorWatchMainFrame.cooldown:SetCooldown(0,0)
	elseif key == Keys.Delay then
		local guid = uuid()
		ScheduleResetCooldown(guid)
		TremorWatchMainFrame.GUID = guid
	end
	
end


function TremorWatchMainFrame:OnTremorSet(tremorGuid)
	if TremorWatchSettings.DB[Keys.ArenaOnly] then
		local type = select(2, IsInInstance())
		if (type ~= "arena") then
			return
		end
	end

	TremorWatchMainFrame:Show()
	if TremorWatchSettings.DB[Keys.ShowPulses] then
		TremorWatchMainFrame.GUID = tremorGuid
		ScheduleResetCooldown(tremorGuid)
	end
end

local function COMBAT_LOG_EVENT_UNFILTERED(timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, destId)
	if not TremorWatchSettings.DB[Keys.TestMode] then
		local isHostile = bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE
		if not isHostile then return end
		
		local tremorSpellId = 8143
		name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(tremorSpellId)
		
		if destName == name then
			if eventType == "UNIT_DIED" then
				TremorWatchMainFrame:Hide()
			elseif eventType == "SPELL_SUMMON" then
				TremorWatchMainFrame:OnTremorSet(destGUID)
			end
		end	
	end
end

local function OnMouseDown(self, button)
	if button == "LeftButton" then
		self:StartMoving()
	end
end

local function OnMouseUp(self, button)
	if button == "LeftButton" then
		self:StopMovingOrSizing()
		
		Point, RelativeTo, RelativePoint, XOfs, YOfs = self:GetPoint()
		TremorWatchSettings.Location.Point = Point
		TremorWatchSettings.Location.RelativeTo = RelativeTo
		TremorWatchSettings.Location.RelativePoint = RelativePoint
		TremorWatchSettings.Location.XOfs = XOfs
		TremorWatchSettings.Location.YOfs = YOfs
	end
end

local function Init()
	TremorWatchMainFrame:SetFrameStrata('MEDIUM')
	TremorWatchMainFrame:SetFrameLevel(100)
	TremorWatchMainFrame:SetPoint(TremorWatchSettings.Location.Point, TremorWatchSettings.Location.RelativeTo,
	TremorWatchSettings.Location.RelativePoint, TremorWatchSettings.Location.XOfs, TremorWatchSettings.Location.YOfs)
	TremorWatchMainFrame:SetSize(40, 40)
	TremorWatchMainFrame:SetScript("OnMouseDown", OnMouseDown)
	TremorWatchMainFrame:SetScript("OnMouseUp", OnMouseUp)
	TremorWatchMainFrame:SetClampedToScreen(true)
	TremorWatchMainFrame.t = TremorWatchMainFrame:CreateTexture(nil,BORDER)
	TremorWatchMainFrame.t:SetTexture("Interface\\Icons\\spell_nature_tremortotem")
	TremorWatchMainFrame.t:SetAllPoints()
	TremorWatchMainFrame:SetAlpha(0.8)
	TremorWatchMainFrame:SetMovable(true)
	TremorWatchMainFrame:Hide()
	TremorWatchMainFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TremorWatchMainFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	TremorWatchMainFrame.cooldown:SetReverse(false)
	
	TremorWatchSettings.DB[Keys.TestMode] = false
	TremorWatchMainFrame:OnSettingsUpdated()
end

local eventHandlers =
{
	["VARIABLES_LOADED"] = Init,
	["COMBAT_LOG_EVENT_UNFILTERED"] = function(event, ...) COMBAT_LOG_EVENT_UNFILTERED(...) end,
	["ZONE_CHANGED_NEW_AREA"] = function() TremorWatchMainFrame:Hide() end,
}
TremorWatchMainFrame:RegisterEvent("VARIABLES_LOADED")
TremorWatchMainFrame:SetScript("OnEvent", function(self, ...) eventHandlers[event](...) end)

function TremorWatchMainFrame:SetLocked(locked)
	TremorWatchMainFrame:EnableMouse(not locked)
	
	if locked then
		TremorWatchMainFrame:Hide()
	else
		TremorWatchMainFrame:Show()
		TremorWatchMainFrame:OnTremorSet(uuid())
	end
end
