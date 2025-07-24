local ruins = {}

-- Insert all ruins
for _, name in pairs({
	"assemblingLine",
	"carAssembly",
	"carBelt",
	"centrifuges",
	"chemicalPlant",
	"crashedShip",
	"eFurnace",
	"encampment",
	"helipad",
	"militaryField",
	"mountainRange",
	"nuclearAccident",
	"nuclearPower",
	"overgrownFort",
	"overwhelmedFlamers",
	"overwhelmedGunturrets",
	"pipeChain",
	"powerSetup",
	"radarOutpost",
	"roughFort",
	"roughPerimeter",
	"smallOilSetup",
	"smeltery",
	"street",
	"storageArea",
	"swamp",
	"trappedRocks",
	"treeFortTrapped",
	"treeIsland",
	"treeRing",
	"uraniumMining",
	"walledSolar"
}) do
	if debug_log then log(string.format("Loading name='%s' ...", name)) end
	local ruin = require(name)
	ruin.name = name
	table.insert(ruins, ruin)
end

return ruins
