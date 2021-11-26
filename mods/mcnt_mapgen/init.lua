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
	y_min = -2,
	heat_point = 50,
	humidity_point = 35,
})

minetest.register_biome({
	name = "sea",
	node_top = "minecraft:dirt",
	depth_top = 1,
	node_filler = "minecraft:dirt",
	depth_filler = 2,
	y_max = -2,
	y_min = -50,
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

dofile(minetest.get_modpath("mcnt_mapgen") .. "/bedrock.lua")
dofile(minetest.get_modpath("mcnt_mapgen") .. "/ores.lua")
