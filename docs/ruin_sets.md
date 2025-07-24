# Ruin sets

Other mods can add their own ruin sets to *Abandoned Ruins - Updated* (aka. "core").

## Step 1: Ruin set setting

The settings should be modified in `settings-updates.lua`. Make sure to set "AbandonedRuins >= 1.x.x" (this mod) as a dependency while x.x is the lastest middle.minor version.

Add a ruin set name to the setting:
```lua
-- Add this to your init() function in control.lua:
remote.call("AbandonedRuins", "register_ruin_set", "my-ruin-set", false)
```
Optional: replace `false` with `true` to mark as default.

## Step 2: Ruin set remote interface

Adding a ruin-set is a simple as providing the ruins to *Abandoned Ruins - Updated* via the `add_ruin_sets` remote call in `on_init` and `on_load` in `control.lua`. For the format of ruins, see [ruin data format](docs/format.md).

Some extra care needs to be taken with ruin sets, as they are not save/loaded. That means they should not be changed during the game.<br>
For that reason, it is recommended to only add ruin sets in `on_init` and `on_load` events. Furthermore, it is recommended to not conditionally change ruin sets.

```lua
local ruin_sets = {
  small  = require("ruins/small") -- an array of ruins
  medium = require("ruins/medium") -- an array of ruins
  large  = require("ruins/large") -- an array of ruins
}

local function init()
  -- Register this mod's ruin-sets
  remote.call("AbandonedRuins", "add_ruin_sets", "my-ruin-set", ruin_sets)

  -- Make it exclusive to one surface (Fulgora) only, no other ruins spawn on that surface nor ruins from this set will spawn somewhere else
  remote.call("AbandonedRuins", "spawn_exclusively_on", "fulgora", "my-ruin-set")
end

-- The ruin set is always created when the game is loaded, since the ruin sets are not save/loaded by AbandonedRuins.
-- Since this is using on_load, we must be sure that it always produces the same result for everyone.
script.on_init(init)
script.on_load(init)
```
With `ruin_sets` seperated from function call, you can e.g. modify the entities depending if other mods are installed. For an example clone `AbandonedRuins-base`, too, and study each file carefully.

## Excluded surfaces versus spawning on specific surfaces or exclusively

There are two options in *Abandoned Ruins - Updated* and they have different purposes. So let me clarify them here:

- `storage.excluded_surfaces` is a table of (mostly) "internal" (inaccesible) surfaces that should always be excluded. Its purpose is that "planet/moon" mods can exclude themselves from *Abandoned Ruins - Updated* altogether. There is a simple code for to be added to `control.lua`.
- `spawn_on_surfaces` is a table of surfaces where exclusively ruins should spawn or everywhere except those listed here. It is ruin-depending, optional to use. Its purpose to either allow ruins spawn only on specified surfaces or on all surfaces except the ones listed.
- `spawn_exclusively_on()` is a remote-call function to le the "core" mod be notified that the ruin-sets should exclusively spawn on that surface.

So if you maintain a ruin-set, `storage.excluded_surfaces` is by 99.9% chance __NOT__ your option to choose as then your ruin-set is fully excluded from the mod's spawning process.

So if you maintain a "planet/moon", which are surfaces BTW, and you want some own ruins with your planet's entities randomly spawn only on your planet, I recommend that you write for the ruins a separate mod.

Example:
- Your mod planet "Foolands" is about a deserted planet where a civilizaton once lived on. It comes with custom buildings (machines) that fit the whole planet's theme.
- Now you certainly want to show that there was once a civilization living on it with some ruins. Since Factorio doesn't allow designing planets (chunk generation), you are left with randomly spawning ruins to make it look once populated.
- Other ruins may not spawn on your planet. But since banning other mods (like this one) in your `info.json` is a bit harsh and gamers maybe not wish to still have ruins spawned on other planets like Nauvis is, the mod's remote-call function `spawn_exclusively_on()` comes handy.
