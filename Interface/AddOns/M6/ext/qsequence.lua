local _, T = ...
local RW = T.ActionBook:compatible("Rewire", 1,5)
local IM = T.ActionBook:compatible("Imp", 1,0)
assert(RW and IM, "Incompatible library bundle")

local core, cenv = CreateFrame("Frame", nil, nil, "SecureHandlerBaseTemplate")
core:Execute("qsState = newtable()")
cenv = GetManagedEnvironment(core)
core:SetAttribute("RunSlashCmd", [=[-- M6:qsequence-RunSlashCmd
	local slash, clause, target = ...
	if slash == "/qsequence" and (clause or "") ~= "" then
		local st, ni, nextCast = qsState[clause]
		if st then
			ni = st[0]
		else
			st, ni = newtable(), 1
			for e in clause:gmatch("[^,]+") do
				st[ni], ni = e:match("^%s*(.-)%s*$"), ni + 1
			end
			qsState[clause], ni = st, 1
		end
		nextCast, st[0] = st[ni], (ni % #st) + 1
		if nextCast then
			return (target and "/cast [@" .. target .. "] " or "/cast ") .. nextCast
		end
	end
]=])

RW:RegisterCommand("/qsequence", true, true, core)
RW:SetCommandHint("/qsequence", 100, function(_slash, _unparsed, clause, target)
	if (clause or "") == "" then return end
	local cs, nextCast = cenv.qsState[clause]
	if cs then
		nextCast = cs[cs[0]]
	else
		nextCast = clause:match("[^,]*"):match("^%s*(%S.-)%s*$")
	end
	if nextCast then
		return RW:GetCommandAction("/cast", nextCast, target)
	end
end)

SLASH_M6_QSEQUENCE1 = "/qsequence"
IM:AddTokenizableCommand("M6_QSEQUENCE", SLASH_CASTRANDOM1)
SLASH_M6_QSEQUENCE1 = nil