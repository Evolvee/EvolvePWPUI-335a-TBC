local warnFrame = CreateFrame("frame")
warnFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
warnFrame:SetScript("OnEvent", function()
    local _, action, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
    if spellID == 8143 and action == "SPELL_CAST_SUCCESS" and (UnitGUID("target") == sourceGUID or UnitGUID("focus") == sourceGUID) then
        PlaySound(12889)
    end
end)