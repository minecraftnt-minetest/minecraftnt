
--- Ores mapgen!

--
-- Misc stuff
--

-- Dirt
minetest.register_ore({
	ore_type       = "blob",
	ore            = "minecraft:dirt",
	wherein        = "minecraft:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 33,
	clust_size     = 4,
	y_min          = -62,
	y_max          = 65536,
	noise_params = {
		offset  = 0,
		scale   = 1,
		spread  = {x=250, y=250, z=250},
		seed    = 12345,
		octaves = 3,
		persist = 0.6,
		lacunarity = 2,
	}
})

-- Gravel
minetest.register_ore({
	ore_type       = "blob",
	ore            = "minecraft:gravel",
	wherein        = "minecraft:stone",
	clust_scarcity = 14*14*14,
	clust_num_ores = 33,
	clust_size     = 5,
	y_min          = -62,
	y_max          = 65536,
	noise_params = {
		offset  = 0,
		scale   = 1,
		spread  = {x=250, y=250, z=250},
		seed    = 12345,
		octaves = 3,
		persist = 0.6,
		lacunarity = 2,
	}
})

--
-- Coal
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 525*3,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(50),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 510*3,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(50),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 500*3,
	clust_num_ores = 12,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(50),
})

-- Medium-rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 550*3,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min          = layer_to_y(51),
	y_max          = layer_to_y(80),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 525*3,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min          = layer_to_y(51),
	y_max          = layer_to_y(80),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 500*3,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = layer_to_y(51),
	y_max          = layer_to_y(80),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 600*3,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = layer_to_y(81),
	y_max          = layer_to_y(128),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 550*3,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = layer_to_y(81),
	y_max          = layer_to_y(128),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:coal_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 500*3,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = layer_to_y(81),
	y_max          = layer_to_y(128),
})

--
-- Iron
--
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:iron_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(39),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:iron_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 1660,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min          = layer_to_y(40),
	y_max          = layer_to_y(63),
})

--
-- Gold
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:gold_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 4775,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(30),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:gold_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 6560,
	clust_num_ores = 7,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(30),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:gold_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 13000,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min          = layer_to_y(31),
	y_max          = layer_to_y(33),
})

--
-- Diamond
--

-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:diamond_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(12),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:diamond_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(12),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:diamond_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 10000,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = layer_to_y(0),
	y_max          = layer_to_y(12),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:diamond_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 20000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = layer_to_y(13),
	y_max          = layer_to_y(15),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "minecraft:diamond_ore",
	wherein        = "minecraft:stone",
	clust_scarcity = 20000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = layer_to_y(13),
	y_max          = layer_to_y(15),
})
