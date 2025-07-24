local ruins = {}

-- Insert all ruins
for _, name in pairs({
	"destroyedEnemyFort",
	"destroyedFort",
	"earlyGame",
	"eFurnaceRail",
	"fishingLake",
	"loggingOutpost",
	"mainBus",
	"nuclearPower",
	"orchard",
	"overwhelmedLasers",
	"shipwreck",
	"solarField",
	"sos",
	"swamp",
	"trainMining",
	"trainMining2",
	"walledOrchard",
	"walledGrotto"
}) do
	if debug_log then log(string.format("Loading name='%s' ...", name)) end
	local ruin = require(name)
	ruin.name = name
	table.insert(ruins, ruin)
end

return ruins
