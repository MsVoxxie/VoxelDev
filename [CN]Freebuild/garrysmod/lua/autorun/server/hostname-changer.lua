local TPS_NAMETIME = 5
local TPS_PREFIX = "[CN] FreeBuild "
local TPS_NAMES = {
	"|PAC|ACF|AdvDupe2|Wiremod|Fishing Mod|",
	"|Friendly|Relaxed Rules|",
	"|Open To Requests|Discord|Ask here!|"
	}
	
local function ChangeName()
	local name = table.Random(TPS_NAMES)
	RunConsoleCommand("hostname", TPS_PREFIX.." "..name)
	timer.Simple(TPS_NAMETIME, ChangeName)
end

ChangeName()
