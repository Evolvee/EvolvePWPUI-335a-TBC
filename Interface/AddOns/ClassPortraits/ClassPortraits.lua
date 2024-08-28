local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end -- alias for convenience
local ClassPortraits=CreateFrame("Frame", nil, UIParent)

local iconPath="Interface\\Addons\\ClassPortraits\\DO NOT STEAL THIS PLS.BLP"

local TargetToTPortrait = TargetFrameToT:CreateTexture(nil, "ARTWORK")
TargetToTPortrait:SetSize(TargetFrameToT.portrait:GetSize())
for i=1, TargetFrameToT.portrait:GetNumPoints() do
	TargetToTPortrait:SetPoint(TargetFrameToT.portrait:GetPoint(i))
end
local lastTargetToTGuid = nil

local FocusToTPortrait = FocusFrameToT:CreateTexture(nil, "ARTWORK")
FocusToTPortrait:SetSize(FocusFrameToT.portrait:GetSize())
for i=1, FocusFrameToT.portrait:GetNumPoints() do
	FocusToTPortrait:SetPoint(FocusFrameToT.portrait:GetPoint(i))
end
local lastFocusToTGuid = nil

local function UpdatePortrait(texture, unit)
   local _, class = UnitClass(unit)
   local iconCoords = CLASS_BUTTONS[class]
   if texture and iconCoords then
      texture:SetTexture(iconPath, true)
      texture:SetTexCoord(unpack(iconCoords))
   else
      DEFAULT_CHAT_FRAME:AddMessage(format("ERROR! unit:[%s] class:[%s] texture:[%s]", (unit or "nil"), (class or "nil"), (texture and texture:GetName() or "unknown")), 1, 0, 0)
   end
end

local classIcons = {
-- UpperLeftx, UpperLefty, LowerLeftx, LowerLefty, UpperRightx, UpperRighty, LowerRightx, LowerRighty
	["WARRIOR"] = {0, 0, 0, 0.25, 0.25, 0, 0.25, 0.25},
	["ROGUE"] = {0.5, 0, 0.5, 0.25, 0.75, 0, 0.75, 0.25},
	["DRUID"] = {0.75, 0, 0.75, 0.25, 1, 0, 1, 0.25},
	["WARLOCK"] = {0.75, 0.25, 0.75, 0.5, 1, 0.25, 1, 0.5},
	["HUNTER"] = {0, 0.25, 0, 0.5, 0.25, 0.25, 0.25, 0.5},
	["PRIEST"] = {0.5, 0.25, 0.5, 0.5, 0.75, 0.25, 0.75, 0.5},
	["PALADIN"] = {0, 0.5, 0, 0.75, 0.25, 0.5, 0.25, 0.75},
	["SHAMAN"] = {0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.5, 0.5},
	["MAGE"] = {0.25, 0, 0.25, 0.25, 0.5, 0, 0.5, 0.25},
	["DEATHKNIGHT"] = {0.25, 0.5, 0.25, 0.75, 0.5, 0.5, 0.5, 0.75}
}

hooksecurefunc("UnitFramePortrait_Update", function(self)
	if self.unit == "player" then
		self.portrait:SetTexture("Interface\\Addons\\ClassPortraits\\MYSKIN")
		return
	elseif self.unit == "pet" then
		return
	end

	if self.portrait and not (self.unit == "targettarget" or self.unit == "focus-target") then
		if UnitIsPlayer(self.unit) then
			local t = CLASS_ICON_TCOORDS[select(2,UnitClass(self.unit))]
			if t then
				self.portrait:SetTexture(iconPath)
				self.portrait:SetTexCoord(unpack(t))
			end
		else
			self.portrait:SetTexCoord(0,1,0,1)
		end
	end

	if UnitExists("targettarget") ~= nil then
		if UnitGUID("targettarget") ~= lastTargetToTGuid then
			lastTargetToTGuid = UnitGUID("targettarget")
			if UnitIsPlayer("targettarget") then
				TargetToTPortrait:SetTexture(iconPath, true)
				local tt=classIcons[(select(2, UnitClass("targettarget")))]
				TargetToTPortrait:SetTexCoord(unpack(tt))
				TargetToTPortrait:Show()
			else
				TargetToTPortrait:Hide()
			end
		end
	else
		TargetToTPortrait:Hide()
		lastTargetToTGuid = nil
	end

	if UnitExists("focus-target") ~= nil then
		if UnitGUID("focus-target") ~= lastFocusToTGuid then
			lastFocusToTGuid = UnitGUID("focus-target")
			if UnitIsPlayer("focus-target") then
				FocusToTPortrait:SetTexture(iconPath, true)
				local tt=classIcons[(select(2, UnitClass("focus-target")))]
				FocusToTPortrait:SetTexCoord(unpack(tt))
				FocusToTPortrait:Show()
			else
				FocusToTPortrait:Hide()
			end
		end
	else
		FocusToTPortrait:Hide()
		lastFocusToTGuid = nil
	end
end)

-- character sheet frame
hooksecurefunc("CharacterFrame_OnShow", function()
   UpdatePortrait(CharacterFramePortrait, "player")
end)
hooksecurefunc("CharacterFrame_OnEvent", function(event)
   if event == "UNIT_PORTRAIT_UPDATE" then
      UpdatePortrait(CharacterFramePortrait, "player")
   end
end)

local addonLoadEvent = CreateFrame("frame")
addonLoadEvent:RegisterEvent("ADDON_LOADED")
addonLoadEvent:SetScript("OnEvent", function(self, e, addon)

   -- talent frame
   if addon == "Blizzard_TalentUI" then
      hooksecurefunc(PlayerTalentFrame, "updateFunction", function()
         UpdatePortrait(PlayerTalentFramePortrait, PlayerTalentFrame.unit or "player")
      end)
      hooksecurefunc("PlayerTalentFrame_OnEvent", function()
         if event == "UNIT_PORTRAIT_UPDATE" and UnitIsUnit(arg1, "player") then
            UpdatePortrait(PlayerTalentFramePortrait, "player")
         end
      end)
      return
   end
   -- inspect frame
   if addon == "Blizzard_InspectUI" then
      hooksecurefunc("InspectFrame_OnShow", function()
         UpdatePortrait(InspectFramePortrait, InspectFrame.unit)
      end)
      hooksecurefunc("InspectFrame_UnitChanged", function()
         UpdatePortrait(InspectFramePortrait, InspectFrame.unit)
      end)
        hooksecurefunc("InspectFrame_OnEvent", function(event)
         if event == "UNIT_PORTRAIT_UPDATE" and InspectFrame.unit == arg1 then
            UpdatePortrait(InspectFramePortrait, arg1)
         end
      end)
      return
   end
end)

-- LFG, quest log, spellbook, and social window icons
-- (LFG not introduced on Classic YET) LFGParentFrame:HookScript("OnShow", function() UpdatePortrait(LFGParentFrameIcon, "player") end)
UpdatePortrait((select(1, QuestLogFrame:GetRegions())), "player")
UpdatePortrait((SpellBookFrame:GetRegions()), "player")
-- UpdatePortrait((FriendsFrame:GetRegions()), "player")