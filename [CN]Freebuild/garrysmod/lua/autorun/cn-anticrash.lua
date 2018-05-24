if CLIENT then
    hook.Add("HUDPaint","CNAntiCrashEnabledOnJoin",function() if not LocalPlayer():IsValid() then return end 
        hook.Remove("HUDPaint","CNAntiCrashEnabledOnJoin")
            notification.AddProgress("CNAntiCrashEnableNotification","[CN] Anti Crash is Enabled!")
                hook.Add("Tick","CNAntiCrashIsPlayerActive",function()
                if(LocalPlayer():KeyPressed(IN_FORWARD) or LocalPlayer():KeyPressed(IN_MOVELEFT) or LocalPlayer():KeyPressed(IN_MOVERIGHT) or LocalPlayer():KeyPressed(IN_BACK) or LocalPlayer():KeyPressed(IN_JUMP) ) then
                    timer.Simple(5, function()
                    notification.Kill("CNAntiCrashEnableNotification")
                end)
            end
        end)
    end)
end

if SERVER then

local CNLagChatPrint = false 

local CNStartUpLag = SysTime() - RealTime()

    hook.Add("Think","CNAntiCrashThink",function()

    local CNLagDifference = SysTime() - RealTime()

        if(CNLagDifference >= CNStartUpLag + 10) then
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
        if(CNLagDifference < CNStartUpLag + 10) then
            CNLagChatPrint = false
        end
    end)
end