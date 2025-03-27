local base_ruin_set = {}

for _, size in pairs("small", "medium", "large") do
	base_ruin_set[size] = require("__AbandonedRuins20__/lua/ruins/" .. size .. "/__init__")
end

return base_ruin_set
