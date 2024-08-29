local AddOn, TPT, Private = select(2, ...):Init()

local GetSpellInfo = GetSpellInfo

local function LocaleName(Array)
	for Index, Value in pairs(Array) do
		Value[3] = GetSpellInfo(Value[1])
	end
end

function TPT:Locale()
	local Lang = {}

	-- Spell Names
	for Class, Spells in pairs(TPT.DB.Spells) do
		for Index, Spell in pairs(Spells) do
			local SpellID = Spell[1]
			local SpellName = GetSpellInfo(SpellID)

			Lang[SpellID] = SpellName
		end
	end
	TPT.Default.SpellName = Lang

	-- Shared
	Lang = {}
	for Class, Spells in pairs(TPT.Default.Shared) do
		Lang[Class] = {}

		for Spell, Value in pairs(Spells) do
			local SpellName = GetSpellInfo(Spell)

			if ( SpellName ) then
				Lang[Class][SpellName] = Value
			end
		end
	end
	TPT.Default.Shared = Lang

	-- Reset
	Lang = {}
	for Reset, Spells in pairs(TPT.Default.Reset) do
		local ResetName = GetSpellInfo(Reset)

		if ( ResetName ) then
			Lang[ResetName] = {}

			for SpellID in pairs(Spells) do
				local SpellName = GetSpellInfo(SpellID)

				if ( SpellName ) then
					Lang[ResetName][SpellName] = 1
				end
			end
		end
	end
	TPT.Default.Reset = Lang

	-- Spec
	Lang = {}
	for SpellID, Value in pairs(TPT.Default.Spec) do
		local SpellName = GetSpellInfo(SpellID)

		if ( SpellName ) then
			Lang[SpellName] = GetSpellInfo(Value)
		end
	end
	TPT.Default.Spec = Lang

	-- Trinket
	LocaleName(TPT.Default.Trinket)

	-- Racial
	LocaleName(TPT.Default.Racial)
end