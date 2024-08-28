local _, Private = ...

local EventHandler_Fire = Private.EventHandler_Fire

C_Spell = C_Spell or {}

Private.EventHandler_AddClassicEvent("SPELL_DATA_LOAD_RESULT")

function C_Spell.RequestLoadSpellData(spellID)
	-- Fire SPELL_DATA_LOAD_RESULT when requested.
	EventHandler_Fire(nil, "SPELL_DATA_LOAD_RESULT", spellID, true)
end

function C_Spell.DoesSpellExist(spellInfo)
	return GetSpellInfo(spellInfo)
end