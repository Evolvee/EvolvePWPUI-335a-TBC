C_Talent = C_Talent or {}

function C_Talent.GetNumTalentGroups()
	return 0 -- TODO
end

function C_Talent.GetTalentGroupSettings()
	-- TODO
end

function C_Talent.GetSpecInfoCache()
	-- Returns table: return "Spec"..C_Talent.GetSpecInfoCache().activeTalentGroup
	return { activeTalentGroup = 0 }
end