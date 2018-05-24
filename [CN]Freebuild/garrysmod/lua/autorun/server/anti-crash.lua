if CLIENT then
	CNAntiCrashPlayerMoved = false
	hook.Add("HUDPaint", "CNAntiCrashNotify", function() if not LocalPlayer():IsValid() then return end
			hook.Remove("HUDPaint", "CNAntiCrashNotify")
			notification.AddProgress( "CNAntiCrashNotiTimer", "[CN] Anti Crash is active" )
				hook.Add("Tick","CNIsPlayerActive",function()
			if(LocalPlayer():KeyPressed(IN_FORWARD) or LocalPlayer():KeyPressed(IN_MOVELEFT) or LocalPlayer():KeyPressed(IN_MOVERIGHT) or LocalPlayer():KeyPressed(IN_BACK) or LocalPlayer():KeyPressed(IN_JUMP) ) then
			timer.Simple( 5, function()
			notification.Kill( "CNAntiCrashNotiTimer" )
				end)
			end
		end)
	end)
end

if SERVER then

local lagPrint = false

hook.Add("Think","CNPropAntiCrash",function()	
	
local Lag = SysTime() - RealTime()

			if Lag >= 17 then
				
				for k, v in pairs( ents.GetAll() ) do
					local phys = v:GetPhysicsObject()
					if(IsValid(phys)) then
						phys:EnableMotion(false)
					end
				end
			
			if lagPrint == false then
				print("####################################################")
		        print("## CRASH PREVENTED ALL PROPS AUTOMATICALLY FROZEN ##")
		        print("####################################################")
				for x, z in pairs( player.GetAll() ) do
					z:ChatPrint("[CN] Lag Detected, Automatically Freezing All Props!")
				end
				
				lagPrint = true
				
			end

		end
		
		if Lag < 17 then
				
				lagPrint = false
				
			end
			
	end)
end

