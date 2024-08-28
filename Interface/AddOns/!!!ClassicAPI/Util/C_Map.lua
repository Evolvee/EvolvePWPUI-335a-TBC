local Select = select
local GetMapZones = GetMapZones

C_Map = C_Map or {}
C_Map.WorldMap = {}

local function LoadZones(Obj, ...)
	for i=1, Select('#', ...) do
		Obj[i] = Select(i, ...)
	end
end

for ContinentIndex = 1, 4 do
	LoadZones(C_Map.WorldMap, GetMapZones(ContinentIndex))
end

function C_Map.IsWorldMap(UIMap)
	for _, Zone in pairs(C_Map.WorldMap) do
		if ( Zone == UIMap ) then
			return true
		end
	end
end

function C_Map.GetBestMapForUnit()

end