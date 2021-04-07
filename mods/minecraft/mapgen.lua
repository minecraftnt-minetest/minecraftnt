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
	y_max = 1000,
	y_min = -3,
	heat_point = 50,
	humidity_point = 50,
})
