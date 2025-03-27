local l_ruins = {}

for _, ruin in pairs(
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
	"SOS",
	"swamp",
	"trainMining",
	"trainMining2",
	"walledOrchard",
	"walledGrotto"
) do
	table.insert(l_ruins, require("__AbandonedRuins20__/lua/ruins/largeRuins/" .. ruin))
end

return l_ruins
