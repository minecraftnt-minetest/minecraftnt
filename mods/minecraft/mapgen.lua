minetest.register_alias("mapgen_stone", "minecraft:stone")
minetest.register_alias("mapgen_water_source", "minecraft:water_source")
minetest.register_alias("mapgen_river_water_source", "minecraft:water_source")

minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

minetest.register_biome({
	name = "grasslands",
	node_top = "minecraft:grass",
	depth_top = 1,
	node_filler = "minecraft:dirt",
	depth_filler = 3,
	node_riverbed = "minecraft:sand",
	depth_riverbed = 2,
	y_max = 31000,
	y_min = 4,
	heat_point = 50,
	humidity_point = 12,
})

minetest.register_biome({
	name = "beach",
	node_top = "minecraft:sand",
	depth_top = 1,
	node_filler = "minecraft:sand",
	depth_filler = 2,
	node_riverbed = "minecraft:sand",
	depth_riverbed = 2,
	y_max = 4,
	y_min = -3,
	heat_point = 50,
	humidity_point = 35,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"minecraft:grass"},
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"grasslands"},
	y_max = 200,
	y_min = 1,
	decoration = "minecraft:rose",
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"minecraft:grass"},
	sidelen = 16,
	fill_ratio = 0.01,
	biomes = {"grasslands"},
	y_max = 200,
	y_min = 1,
	decoration = "minecraft:flower",
})

dofile(minetest.get_modpath("minecraft") .. "/mapgen/bedrock.lua")
dofile(minetest.get_modpath("minecraft") .. "/mapgen/ores.lua")
dofile(minetest.get_modpath("minecraft") .. "/mapgen/trees.lua")