local ruins = {}

-- Insert all ruins
for _, ruin in pairs({
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
	if debug_log then log(string.format("Loading ruin='%s' ...", ruin)) end
	table.insert(ruins, require(ruin))
end

return ruins
