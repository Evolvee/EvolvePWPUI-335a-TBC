
-- QueueAlert by Zannix, Gehennas

local addonName, addon = ...
local CreateFrame = CreateFrame
local GetBattlefieldStatus = GetBattlefieldStatus
local GetMaxBattlefieldID = GetMaxBattlefieldID

local PLAYER = PLAYER
local SendChatMessage = SendChatMessage
local GetUnitName = GetUnitName

local QueueAlert = CreateFrame("Frame", "QueueAlert")

QueueAlert:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")

QueueAlert:SetScript("OnEvent", function(self, event, ...)
	if (event == "UPDATE_BATTLEFIELD_STATUS") then
		for i = 1, GetMaxBattlefieldID() do
                local status = GetBattlefieldStatus(i)
                if status == "confirm" then
                    --SendChatMessage("Queue popped", "WHISPER", nil, GetUnitName("PLAYER"))
		    FlashClientIcon()
                end
            end
	end
end)