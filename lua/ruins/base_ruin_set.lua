local ruin_set = {}

for _, size in pairs({"small", "medium", "large"}) do
	ruin_set[size] = require("__AbandonedRuins20__/lua/ruins/" .. size .. "/__init__")
end

return ruin_set
