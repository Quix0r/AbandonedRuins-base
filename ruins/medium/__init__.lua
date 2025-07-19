local ruins = {}

-- Insert all ruins
for _, ruin in pairs({
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
	if debug_log then log(string.format("Loading ruin='%s' ...", ruin)) end
	table.insert(ruins, require(ruin))
end

return ruins
