local _G = _G
local Mod = mod
local Next = next
local PCall = pcall
local Error = error
local Ceil = math.ceil
local GetTime = GetTime
local GetCVar = GetCVar
local Sub = string.gsub
local String = tostring
local Floor = math.floor
local SecureCall = securecall
local GetAddOnInfo = GetAddOnInfo
local IsAddOnLoaded = IsAddOnLoaded
local IsAddOnLoadOnDemand = IsAddOnLoadOnDemand

function InGlue()
	return false
end

function AnimateTexCoords(Self, Width, Height, FrameW, FrameH, NumFrames, Elapsed, Throt)
	local Throt = Throt or Self.throttle or 0.1

	if ( not Self.frame ) then
		Self.frame = 1
		Self.Throt = Throt
		Self.numColumns = Floor(Width / FrameW)
		Self.numRows = Floor(Height / FrameH)
		Self.columnWidth = FrameW / Width
		Self.rowHeight = FrameH / Height
	end

	if ( not Self.Throt or Self.Throt > Throt ) then
		local Frame = Self.frame
		local FramesToAdvance = Floor(Self.Throt / Throt)
		while Frame + FramesToAdvance > NumFrames do
			Frame = Frame - NumFrames
		end

		Frame = Frame + FramesToAdvance
		Self.Throt = 0
		local SetLeft = Mod(Frame - 1, Self.numColumns) * Self.columnWidth
		local SetRight = SetLeft + Self.columnWidth
		local SetBottom = Ceil(Frame / Self.numColumns) * Self.rowHeight
		local SetTop = SetBottom - Self.rowHeight
		Self:SetTexCoord(SetLeft, SetRight, SetTop, SetBottom)
		Self.frame = Frame
	else
		Self.Throt = Self.Throt + Elapsed
	end
end

function GetTexCoordsForRoleSmallCircle(Role)
    if ( Role == "TANK" ) then
        return 0, 19/64, 22/64, 41/64
    elseif ( Role == "HEALER" ) then
        return 20/64, 39/64, 1/64, 20/64
    elseif ( Role == "DAMAGER" ) then
        return 20/64, 39/64, 22/64, 41/64
    else
        Error("Unknown role: "..String(Role))
    end
end

function PassClickToParent(Self, ...)
	-- This is def not working on secure frames.
	local Parent = Self:GetParent()
	local OnClick = Parent:GetScript("OnClick")
	if ( OnClick ) then
		OnClick(Parent, ...)
	end
end

local function secureexecutenext(Table, Prev, Func, ...)
    local Key, Value = Next(Table, Prev)
    if ( Key ~= nil ) then
        PCall(Func, Key, Value, ...)  -- Errors are silently discarded!
    end
    return Key
end

function secureexecuterange(Table, Func, ...)
    local Key = nil
    repeat
        Key = SecureCall(secureexecutenext, Table, Key, Func, ...)
    until Key == nil
end

function securecallfunction(Func, ...)
	return SecureCall(Func, ...)
end

function GetAddOnEnableState(Character, Index)
	-- Can't get per-char addons, doing what we can.
	local _, _, _, Enabled, Loadable = GetAddOnInfo(Index)
	return (Enabled) and 2 or 0
end

function IsAddonVersionCheckEnabled()
	return GetCVar("checkAddonVersion") == "1"
end

function C_GetAddOnInfo(Index)
	local Name, Title, Notes, Enabled, Loadable, Reason, Security = GetAddOnInfo(Index)
	local NewVersion = nil

	-- Missing "Reason" values: BANNED", "CORRUPT", "DEMAND_LOADED", "INCOMPATIBLE"
	if ( Loadable and not IsAddOnLoaded(Index) and IsAddOnLoadOnDemand(Index) ) then
		Reason = "DEMAND_LOADED"
		Loadable = nil
	end

	return Name, Title, Notes, Loadable, Reason, Security, NewVersion
end

function HasOverrideActionBar()
	return _G.BonusActionBarFrame:IsShown()
end

function HasVehicleActionBar()
	return _G.VehicleMenuBar:IsShown()
end

--[[function GetSchoolString(arg)
	-- TODO
	-- Return name of spell school?
	return "_UNKNOWN_"
	--print(arg)
	--SchoolStringTable[school]
end]]

function GetDifficultyInfo(ID)
	--return "0 Player (Heroic)", "party", false, false, false, false, nil
end

function GetServerTime()
	-- This will cause problems. We could use game time somehow.
	return GetTime()
end

function GetNormalizedRealmName()
	return Sub(GetRealmName(), "[-%s]", "")
end

function Ambiguate(FullName, Context)
	-- TODO: Make diff context work properly.
	return FullName
end

function CombatLogGetCurrentEventInfo(Timestamp, SubEvent, SrcGUID, SrcName, SrcFlag, DstGUID, DstName, DstFlag, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12)
	if ( Timestamp ) then
		-- Modern payload (Missing)
		local HideCaster, SrcRaidFlag, DstRaidFlag = false, nil, nil

		-- Note: Blizzard could have changed order of payload from 9th onwards.
		return Timestamp, SubEvent, HideCaster, SrcGUID, SrcName, SrcFlag, SrcRaidFlag, DstGUID, DstName, DstFlag, DstRaidFlag, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12
	end
end

function ActionButton_HideOverlayGlow()
	-- TODO
end

function ActionButton_ShowOverlayGlow()
	-- TODO
end