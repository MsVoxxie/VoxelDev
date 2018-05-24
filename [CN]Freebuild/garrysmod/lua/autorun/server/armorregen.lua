if ( CLIENT ) then return end

CreateConVar( "armorregen_enabled", 1, FCVAR_ARCHIVE )
CreateConVar( "armorregen_speed", 20, FCVAR_ARCHIVE )
CreateConVar( "armorregen_maxarmor", 100, FCVAR_ARCHIVE )
CreateConVar( "armorregen_delay", 5, FCVAR_ARCHIVE )

local function Think()
	local enabled = GetConVarNumber( "armorregen_enabled" ) > 0
	local speed = 1 / GetConVarNumber( "armorregen_speed" )
	local max = GetConVarNumber( "armorregen_maxarmor" )
	local time = FrameTime()
	
	for _, ply in pairs( player.GetAll() ) do
		if ( ply:Alive() ) then
			local armor = ply:Armor()
	
			if ( armor < ( ply.LastArmor or 0 ) ) then
				ply.ArmorRegenNext = CurTime() + GetConVarNumber( "armorregen_delay" )
			end
			
			if ( CurTime() > ( ply.ArmorRegenNext or 0 ) && enabled ) then
				ply.ArmorRegen = ( ply.ArmorRegen or 0 ) + time
			 	if ( ply.ArmorRegen >= speed ) then
					local add = math.floor( ply.ArmorRegen / speed )
					ply.ArmorRegen = ply.ArmorRegen - ( add * speed )
					if ( armor < max || speed < 0 ) then
						ply:SetArmor( math.min( armor + add, max ) )
					end
				end
			end
			
			ply.LastArmor = ply:Armor()
		end
	end
end
hook.Add( "Think", "CNArmorRegen.Think", Think )
