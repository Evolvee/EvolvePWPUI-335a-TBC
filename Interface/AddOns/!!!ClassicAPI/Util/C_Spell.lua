local _, Private = ...

local EventHandler = Private.EventHandler
local EventHandler_Fire = EventHandler.Fire
EventHandler.AddEvent("SPELL_DATA_LOAD_RESULT")

C_Spell = C_Spell or {}

function C_Spell.RequestLoadSpellData(spellID)
	-- Fire SPELL_DATA_LOAD_RESULT when requested.
	EventHandler_Fire(nil, "SPELL_DATA_LOAD_RESULT", spellID, true)
end

function C_Spell.DoesSpellExist(spellInfo)
	return GetSpellInfo(spellInfo)
end