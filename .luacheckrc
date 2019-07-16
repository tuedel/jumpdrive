unused_args = false
allow_defined_top = true

globals = {
	"jumpdrive",

	-- write
	"travelnet",
	"pipeworks"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump", "VoxelArea",

	-- Deps
	"unified_inventory", "default", "monitoring",
	"digilines",
	"mesecons",
	"technic",
	"locator",
	"display_api",
	"areas"
}