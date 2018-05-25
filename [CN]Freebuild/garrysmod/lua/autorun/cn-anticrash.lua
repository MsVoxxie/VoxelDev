if CLIENT then
    hook.Add("HUDPaint","CNAntiCrashEnabledOnJoin",function() if not LocalPlayer():IsValid() then return end 
        hook.Remove("HUDPaint","CNAntiCrashEnabledOnJoin")
            notification.AddProgress("CNAntiCrashEnableNotification","[CN] Anti Crash is Enabled")
            notification.AddProgress("CNAntiCrashEnableNotificationTickUpdated","[CN] Anti Crash Tick Quota Updated")
                hook.Add("Tick","CNAntiCrashIsPlayerActive",function()
                if(LocalPlayer():KeyPressed(IN_FORWARD) or LocalPlayer():KeyPressed(IN_MOVELEFT) or LocalPlayer():KeyPressed(IN_MOVERIGHT) or LocalPlayer():KeyPressed(IN_BACK) or LocalPlayer():KeyPressed(IN_JUMP) ) then
                    timer.Simple(5, function()
                    notification.Kill("CNAntiCrashEnableNotification")
                end)
                    timer.Simple(3,function()
                    notification.Kill("CNAntiCrashEnableNotificationTickUpdated")
                    end)
            end
        end)
    end)
end

if SERVER then

local CNLagChatPrint = false 

local CNStartUpLag = (SysTime() - RealTime())+4

	hook.Add("PlayerInitialSpawn","CNAntiCrashResetStartLag",function(ply)
		local CNStartUpLag = (SysTime() - RealTime())+4
        print("##################################")
        print("## [CN] Anti Crash Tick Updated ##")
        print("##################################")
	end)

    hook.Add("Think","CNAntiCrashThink",function()

    local CNLagDifference = SysTime() - RealTime()

        if(CNLagDifference >= CNStartUpLag) then
            for k, v in pairs(ents.GetAll()) do
                local phys = v:GetPhysicsObject()
                if(IsValid(phys)) then
                    phys:EnableMotion(false)
                end
            end
                    if CNLagChatPrint == false then
                        print("####################################################")
                        print("## CRASH PREVENTED ALL PROPS AUTOMATICALLY FROZEN ##")
                        print("####################################################")
                    for x, z in pairs(player.GetAll()) do
                        z:ChatPrint("[CN] Anti Lag | Props Frozen due to excessive lag!")
                    end
                    CNLagChatPrint = true
                end
            end
        if(CNLagDifference < CNStartUpLag) then
            CNLagChatPrint = false
        end
    end)
end