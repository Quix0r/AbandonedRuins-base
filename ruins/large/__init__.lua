-- A "list" of ruins, including their names
--- @type Ruin[]
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

	---@type Ruin Individual ruin, file' name becomes ruin's name
	local ruin = require(name)
	ruin.name = name
	ruins[#ruins] = ruin
end

if debug_log then log(string.format("Loaded %d ruins ...", #ruins)) end
return ruins
