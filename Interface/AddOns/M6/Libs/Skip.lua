local _, T = ...

local function load(ab)
	if ab:compatible(2, 38) and ab:compatible("Rewire", 1, 25) and ab:compatible("Kindred", 1, 19) and ab:compatible("Imp", 1, 4) then
		T.ActionBook, T.SkipLocalActionBook = ab, true
	end
end
local s = IsAddOnLoaded("OPie") and GetAddOnMetadata("OPie", "X-M6-AB")
if s then
	pcall(function()
		local t = _G
		for k in s:gmatch("[^.]+") do
			t = t and t[k]
		end
		if t then
			load(t)
		end
	end)
end