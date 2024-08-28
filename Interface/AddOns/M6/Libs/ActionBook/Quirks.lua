local COMPAT, _, T = select(4,GetBuildInfo()), ...
if T.SkipLocalActionBook then return end

local EV, AB, RW = T.Evie, T.ActionBook:compatible(2,38), T.ActionBook:compatible("Rewire", 1,27)
assert(EV and AB and RW and 1, "Incompatible library bundle")
local MODERN = COMPAT >= 10e4

if MODERN then -- weirdly-persistent Incarnations
	local function checkSpellKnown(id)
		if not IsSpellKnown(id) then
			return false, "known-check"
		end
	end

	RW:SetSpellCastableChecker(33891, checkSpellKnown)
	RW:SetSpellCastableChecker(102543, checkSpellKnown)
	RW:SetSpellCastableChecker(102558, checkSpellKnown)
	RW:SetSpellCastableChecker(102560, function()
		if not (IsSpellKnown(194223) and select(7, GetSpellInfo((GetSpellInfo(194223)))) == 102560) then
			return false, "known-check"
		end
	end)
end

if MODERN then -- class-locked mount spells
	local classLockedMounts = {
		[48778]="DEATHKNIGHT", [54729]="DEATHKNIGHT", [229387]="DEATHKNIGHT",
		[229417]="DEMONHUNTER", [200175]="DEMONHUNTER",
		[229386]="HUNTER", [229438]="HUNTER", [229439]="HUNTER",
		[229376]="MAGE",
		[229385]="MONK",
		[13819]="PALADIN", [23214]="PALADIN", [34767]="PALADIN", [34769]="PALADIN", [66906]="PALADIN", [69820]="PALADIN", [69826]="PALADIN", [221883]="PALADIN", [205656]="PALADIN", [221885]="PALADIN", [221886]="PALADIN", [231587]="PALADIN", [231588]="PALADIN", [231589]="PALADIN", [231435]="PALADIN",
		[229377]="PRIEST",
		[231434]="ROGUE", [231523]="ROGUE", [231524]="ROGUE", [231525]="ROGUE",
		[231442]="SHAMAN",
		[5784]="WARLOCK", [23161]="WARLOCK", [232412]="WARLOCK", [238452]="WARLOCK", [238454]="WARLOCK",
		[229388]="WARRIOR",
	}
	local function uncastableClassLock()
		return false, "uncastable-class-lock", true
	end
	local _, class = UnitClass("player")
	for k,v in pairs(classLockedMounts) do
		if v ~= class then
			RW:SetSpellCastableChecker(k, uncastableClassLock)
		end
	end
end

if MODERN then -- Tarecgosa's Visage
	local SPELL_ID, MOUNT_ID, QUEST_ID = 407555, 1727, 73199
	local questOK, mountOK
	local function addCastEscapes()
		if InCombatLockdown() then
			EV.PLAYER_REGEN_ENABLED = addCastEscapes
			return
		end
		local mslot = AB:GetActionSlot("mount", MOUNT_ID)
		if mslot then
			local sname = GetSpellInfo(SPELL_ID)
			RW:SetCastEscapeAction("spell:" .. SPELL_ID, mslot)
			RW:SetCastEscapeAction(sname, mslot)
			AB:NotifyObservers("spell")
		end
		return "remove"
	end
	local function checkVisageConditions()
		questOK = questOK or C_QuestLog.IsQuestFlaggedCompleted(QUEST_ID)
		if questOK and not mountOK then
			local _, _, _, _, _, _, _, _, _, hide, have = C_MountJournal.GetMountInfoByID(MOUNT_ID)
			mountOK = have and not hide
		end
		if questOK and mountOK and addCastEscapes then
			addCastEscapes()
			addCastEscapes = nil
			return true
		end
	end
	RW:SetSpellCastableChecker(SPELL_ID, function(_, castContext)
		local canMount = questOK and mountOK or checkVisageConditions()
		local castable = canMount and type(castContext) == "number" and castContext % 4 >= 2
		return castable, "visage-check", not castable
	end)
	local function cueVisageCheck()
		return (questOK and mountOK or checkVisageConditions()) and "remove" or nil
	end
	EV.QUEST_TURNED_IN = cueVisageCheck
	EV.PLAYER_ENTERING_WORLD = cueVisageCheck
	EV.NEW_MOUNT_ADDED = cueVisageCheck
end

if MODERN then -- failing ability rank disambiguation
	local Spell_ForcedID = {126819, 28272, 28271, 161372, 51514, 210873, 211004, 211010, 211015, 783}
	local function checkForcedIDCastable(id)
		return not not FindSpellBookSlotBySpellID(id), "forced-id-cast"
	end
	for i=1,#Spell_ForcedID do
		RW:SetSpellCastableChecker(Spell_ForcedID[i], checkForcedIDCastable)
	end
end

if MODERN then -- failing profession rank disambiguation
	local activeSet, reserveSet, pendingSync = {}, {}
	local function procProfessions(n, a, ...)
		if a then
			local _, _, _, _, scount, sofs = GetProfessionInfo(a)
			for i=sofs+1, sofs+scount do
				local et, eid = GetSpellBookItemInfo(i, "player")
				if et == "SPELL" and not IsPassiveSpell(eid) then
					local vid, sn, sr = "spell:" .. eid, GetSpellInfo(eid), GetSpellSubtext(eid)
					reserveSet[sn], reserveSet[sn .. "()"] = vid, vid
					if sr and sr ~= "" then
						reserveSet[sn .. "(" .. sr .. ")"] = vid
					end
				end
			end
		end
		if n > 1 then
			return procProfessions(n-1, ...)
		end
	end
	local function countValues(...)
		return select("#", ...), ...
	end
	local function syncProf(e)
		if InCombatLockdown() then
			if not pendingSync then
				EV.PLAYER_REGEN_ENABLED, pendingSync = syncProf, true
			end
			return
		end
		pendingSync = false
		wipe(reserveSet)
		procProfessions(countValues(GetProfessions()))
		activeSet, reserveSet = reserveSet, activeSet
		local changed
		for k in pairs(reserveSet) do
			if not activeSet[k] then
				changed = true
				RW:SetCastAlias(k, nil)
			end
		end
		for k,v in pairs(activeSet) do
			if v ~= reserveSet[k] then
				changed = true
				RW:SetCastAlias(k, v, true)
			end
		end
		if changed then
			AB:NotifyObservers("spell")
		end
		return e ~= "CHAT_MSG_SKILL" and "remove"
	end
	EV.PLAYER_LOGIN, EV.CHAT_MSG_SKILL = syncProf, syncProf
end

if MODERN then -- missing usability conditions for certain toys
	local watchedQuests = {}
	function EV:QUEST_TURNED_IN(qid)
		local tid = watchedQuests[qid]
		if tid and PlayerHasToy(tid) then
			watchedQuests[qid] = nil
			AB:NotifyObservers("toy")
		end
	end
	local function collectedAndQuestCompleted(id, q1, q2)
		watchedQuests[q1], watchedQuests[q2 or q1] = id, id
		return id, function(_id)
			if PlayerHasToy(id) then
				local qf = C_QuestLog.IsQuestFlaggedCompleted
				if qf(q1) or q2 and qf(q2) then
					AB:SetPlayerHasToyOverride(id, nil)
					return true
				end
			end
		end
	end
	AB:SetPlayerHasToyOverride(collectedAndQuestCompleted(110560, 34378, 34586)) -- Garrison Hearthstone
	AB:SetPlayerHasToyOverride(collectedAndQuestCompleted(140192, 44184, 44663)) -- Legion Dalaran Hearthstone
end

if MODERN then -- /ping's option parsing is silly
	local safequote do
		local r = {u="\\117", ["{"]="\\123", ["}"]="\\125"}
		function safequote(s)
			return s and (("%q"):format(s):gsub("[{}u]", r)) or "nil"
		end
	end
	local f, init = CreateFrame("Frame", nil, nil, "SecureHandlerBaseTemplate"), [[--
		PING_COMMAND, TOKENS = %s, newtable()
		TOKENS.assist, TOKENS.attack, TOKENS.onmyway, TOKENS.warning = %s, %s, %s, %s
	]]
	f:Execute(init:format(safequote(SLASH_PING1 .. " "), safequote(PING_TYPE_ASSIST), safequote(PING_TYPE_ATTACK), safequote(PING_TYPE_ON_MY_WAY), safequote(PING_TYPE_WARNING)))
	f:SetAttribute("RunSlashCmd", [[--
		local cmd, v, target, s = ...
		if v then
			target = target and target ~= "cursor" and "[@" .. target .. "] " or ""
			return PING_COMMAND .. target .. (TOKENS[v and v:lower()] or v)
		end
	]])
	RW:RegisterCommand(SLASH_PING1, true, false, f)
end