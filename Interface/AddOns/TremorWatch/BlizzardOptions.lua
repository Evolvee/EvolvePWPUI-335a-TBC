local Keys = TremorWatchMainFrame.Keys

local function SetOption(info, value)
	local key = info.arg or info[#info]
	TremorWatchSettings.DB[key] = value
	TremorWatchMainFrame:OnSettingsUpdated(key)
end

local function GetOption(info)
	local key = info.arg or info[#info]
	return TremorWatchSettings.DB[key]
end

local iterator = 
{
	value = -1,
	Next = function (self)
		self.value = self.value + 1
		return self.value;
	end
}

local function BuildBlizzardOptions()
	local options = 
	{
		type = "group",
		name = "TremorWatch",
		plugins = {},
		get = GetOption,
		set = SetOption,
		args = {}
	}
	
	options.args[Keys.TestMode] = 
	{
		type = "toggle",
		name = "Test mode",
		desc = "",
		order = iterator:Next(),
	}
	
	options.args[Keys.ShowPulses] = 
	{
		type = "toggle",
		name = "Show pulses",
		desc = "Show next tremor totem pulse",
		order = iterator:Next(),
	}
	
	options.args[Keys.PlaySounds] =
	{
		type = "toggle",
		name = "Play sounds",
		desc = "Play sound on totem pulse",
		order = iterator:Next(),
	}
	
	options.args[Keys.ArenaOnly] = 
	{
		type = "toggle",
		name = "Show on arena only",
		desc = "Show on arena only",
		order = iterator:Next(),
	}
	
	options.args[Keys.Size] = 
	{
		type = "range",
		name = "Frame scale",
		min = 10,
		max = 500,
		step =1,
		order = iterator:Next(),
	}
	
	options.args[Keys.Alpha] = 
	{
		type = "range",
		name = "Frame alpha",
		min = 0,
		max = 1,
		step =0.05,
		order = iterator:Next(),
	}
	
	options.args[Keys.Delay] = 
	{
		type = "range",
		name = "Animation delay",
		min = 0,
		max = 2,
		step =0.05,
		order = iterator:Next(),
	}
	
	return options
end

LibStub("AceConfig-3.0"):RegisterOptionsTable("TremorWatch", BuildBlizzardOptions())
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TremorWatch", "TremorWatch")