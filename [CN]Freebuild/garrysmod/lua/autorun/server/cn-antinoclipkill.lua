hook.Add("PlayerShouldTakeDamage","CNAntiNoclipKilling",function(target,attacker)
	if(attacker:IsPlayer() and attacker:GetMoveType()==MOVETYPE_NOCLIP) then
		return(false)
	end
	if(target:IsPlayer() and target:GetMoveType()==MOVETYPE_NOCLIP) then
		return(false)
	end
end)