local GetTime = GetTime

function CooldownFrame_Set(Self, Start, Duration, Enable, ForceShowDrawEdge, ModRate)
	if Enable and Enable ~= 0 and Start > 0 and Duration > 0 then
		--self:Show()
		Self:SetDrawEdge(ForceShowDrawEdge)
		Self:SetCooldown(Start, Duration, ModRate)
	else
		Self:Hide()
	end
end

function CooldownFrame_Clear(Self)
	Self:Hide()
end

function CooldownFrame_SetDisplayAsPercentage(Self, Percentage)
	local Seconds = 100
	--Self:Pause()
	Self:SetCooldown(GetTime() - Seconds * Percentage, Seconds)
end