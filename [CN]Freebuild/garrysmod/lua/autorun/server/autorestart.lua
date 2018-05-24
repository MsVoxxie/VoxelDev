hook.Add( ulx.HOOK_ULXDONELOADING, "restart_first_session", function()
    if game.GetGlobalCounter( "ulx_restart" ) == 0 then
        game.SetGlobalCounter( "ulx_restart", 1 )
        RunConsoleCommand( "ulx","restart","360" )
        print("###################################################")
        print("##SERVER RESTART AUTOMATICALLY SET FOR SIX HOURS!##")
        print("###################################################")
    end
    hook.Remove( "Think", "restart_first_session" )
end )