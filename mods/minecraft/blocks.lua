minetest.register_node("minecraft:stone", {
	description = "Stone",
	tiles = {"terrain.png^[sheet:16x16:1,0"},
	groups = {cracky=3},
	drop = "minecraft:cobble"
})

minetest.register_node("minecraft:grass", {
	description = "Grass",
	drop = "minecraft:dirt",
	tiles ={"terrain.png^[sheet:16x16:0,0", "terrain.png^[sheet:16x16:2,0",
		{name = "terrain.png^[sheet:16x16:3,0",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("minecraft:dirt", {
	description = "Dirt",
	tiles ={"terrain.png^[sheet:16x16:2,0"},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("minecraft:oak", {
	description = "Wood",
	tiles = {"terrain.png^[sheet:16x16:5,1", "terrain.png^[sheet:16x16:5,1", "terrain.png^[sheet:16x16:4,1"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("minecraft:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	tiles = {"terrain.png^[sheet:16x16:4,3"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=1,dig_immediate=3},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"minecraft:sapling"},
				rarity = 10, -- a1.0.0 has 1/10 chance of leaves dropping sapling
			},
		}
	},
})

minetest.register_node("minecraft:plank", {
	description = "Wooden Planks",
	tiles = {"terrain.png^[sheet:16x16:4,0"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("minecraft:glass", {
	description = "Glass",
	drawtype = "glasslike",
	drop = "",
	tiles = {"terrain.png^[sheet:16x16:1,3"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
})

minetest.register_node("minecraft:sand", {
	description = "Sand",
	tiles ={"terrain.png^[sheet:16x16:2,1"},
	groups = {falling_node=1,crumbly=3},
})

minetest.register_node("minecraft:gravel", {
	description = "Gravel",
	tiles ={"terrain.png^[sheet:16x16:3,1"},
	groups = {falling_node=1,crumbly=3},
})

minetest.register_node("minecraft:cobble", {
	description = "Cobblestone",
	tiles ={"terrain.png^[sheet:16x16:0,1"},
	is_ground_content = false,
	groups = {cracky=3},
})

minetest.register_node("minecraft:mossycobble", {
	description = "Moss Stone",
	tiles ={"terrain.png^[sheet:16x16:4,2"},
	is_ground_content = false,
	groups = {cracky=3},
})

minetest.register_node("minecraft:bedrock", {
	description = "Bedrock",
	tiles ={"terrain.png^[sheet:16x16:1,1"},
	is_ground_content = false,
	groups = {unbreakable=1},
})

minetest.register_node("minecraft:bricks", {
	description = "Bricks",
	tiles ={"terrain.png^[sheet:16x16:7,0"},
	is_ground_content = false,
	groups = {cracky=3},
})

minetest.register_node("minecraft:bookshelf", {
	description = "Bookshelf",
	tiles = {"terrain.png^[sheet:16x16:4,0", "terrain.png^[sheet:16x16:4,0", "terrain.png^[sheet:16x16:3,2"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2},
})

minetest.register_node("minecraft:coal_ore", {
	description = "Coal Ore",
	tiles = {"terrain.png^[sheet:16x16:2,2"},
	groups = {cracky = 3},
	drop = "minecraft:coal"
})

minetest.register_node("minecraft:iron_ore", {
	description = "Iron Ore",
	tiles = {"terrain.png^[sheet:16x16:1,2"},
	groups = {cracky=2,level=1},
})

minetest.register_node("minecraft:gold_ore", {
	description = "Gold Ore",
	tiles = {"terrain.png^[sheet:16x16:0,2"},
	groups = {cracky=2,level=1},
})

minetest.register_node("minecraft:diamond_ore", {
	description = "Diamond Ore",
	tiles = {"terrain.png^[sheet:16x16:2,3"},
	groups = {cracky=1,level=2},
	drop = "minecraft:diamond"
})

minetest.register_node("minecraft:plank_stairs", {
	description = "Wooden Stairs",
	tiles = {"terrain.png^[sheet:16x16:4,0"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}, -- NodeBox2
		}
	}
})

minetest.register_node("minecraft:cobble_stairs", {
	description = "Stone Stairs",
	tiles ={"terrain.png^[sheet:16x16:0,1"},
	is_ground_content = false,
	groups = {cracky=3},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2  = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}, -- NodeBox2
		}
	}
})

minetest.register_node("minecraft:plank_slab", {
	description = "Wooden Slab",
	tiles = {"terrain.png^[sheet:16x16:4,0"},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	}
})

minetest.register_node("minecraft:cobble_slab", {
	description = "Stone Slab",
	tiles ={"terrain.png^[sheet:16x16:0,1"},
	is_ground_content = false,
	groups = {cracky=3},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	}
})

minetest.register_node("minecraft:stone_slab", {
	description = "Stone Slab",
	tiles = {
		"terrain.png^[sheet:16x16:6,0",    -- y+
		"terrain.png^[sheet:16x16:6,0",  -- y-
		"terrain.png^[sheet:16x16:5,0", -- x+
		"terrain.png^[sheet:16x16:5,0",  -- x-
		"terrain.png^[sheet:16x16:5,0",  -- z+
		"terrain.png^[sheet:16x16:5,0", -- z-
	},
	is_ground_content = false,
	groups = {cracky=3},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	}
})

minetest.register_node("minecraft:stone_slab_block", {
	description = "tile.stoneSlab",
	tiles = {
		"terrain.png^[sheet:16x16:6,0",    -- y+
		"terrain.png^[sheet:16x16:6,0",  -- y-
		"terrain.png^[sheet:16x16:5,0", -- x+
		"terrain.png^[sheet:16x16:5,0",  -- x-
		"terrain.png^[sheet:16x16:5,0",  -- z+
		"terrain.png^[sheet:16x16:5,0", -- z-
	},
	is_ground_content = false,
	groups = {cracky=3},
	drop = "minecraft:stone_slab"
})



minetest.register_node("minecraft:iron_block", {
	description = "Block of Iron",
	tiles = {
		"terrain.png^[sheet:16x16:6,1",    -- y+
		"terrain.png^[sheet:16x16:6,3",  -- y-
		"terrain.png^[sheet:16x16:6,2", -- x+
		"terrain.png^[sheet:16x16:6,2",  -- x-
		"terrain.png^[sheet:16x16:6,2",  -- z+
		"terrain.png^[sheet:16x16:6,2", -- z-
	},
	groups = {cracky=2,level=1},
})

minetest.register_node("minecraft:gold_block", {
	description = "Block of Gold",
	tiles = {
		"terrain.png^[sheet:16x16:7,1",    -- y+
		"terrain.png^[sheet:16x16:7,3",  -- y-
		"terrain.png^[sheet:16x16:7,2", -- x+
		"terrain.png^[sheet:16x16:7,2",  -- x-
		"terrain.png^[sheet:16x16:7,2",  -- z+
		"terrain.png^[sheet:16x16:7,2", -- z-
	},
	groups = {cracky=2,level=1},
})

minetest.register_node("minecraft:diamond_block", {
	description = "Block of Diamond",
	tiles = {
		"terrain.png^[sheet:16x16:8,1",    -- y+
		"terrain.png^[sheet:16x16:8,3",  -- y-
		"terrain.png^[sheet:16x16:8,2", -- x+
		"terrain.png^[sheet:16x16:8,2",  -- x-
		"terrain.png^[sheet:16x16:8,2",  -- z+
		"terrain.png^[sheet:16x16:8,2", -- z-
	},
	groups = {cracky=1,level=2},
})

minetest.register_node("minecraft:crafting_table", {
	description = "Crafting Table",
	tiles = {"terrain.png^[sheet:16x16:11,2",
			 "terrain.png^[sheet:16x16:4,0",
			 "terrain.png^[sheet:16x16:11,3",
			 "terrain.png^[sheet:16x16:11,3",
			 "terrain.png^[sheet:16x16:12,3",
			 "terrain.png^[sheet:16x16:12,3",},
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=2},
	on_rightclick = function(pos, node, player, itemstack)
		player:get_inventory():set_width("craft", 3)
		player:get_inventory():set_size("craft", 9)

		local form = [[
			size[9.5,9]
			real_coordinates[true]
			bgcolor[black;neither]
			listcolors[#ffffff00;#ffffff80]
			image[0,0;9.5,9;crafting.png]
			list[current_player;craft;1.5,0.75;1,1;0]
			list[current_player;craft;3.5,2.75;1,1;8]
			list[current_player;craft;2.5,2.75;1,1;7]
			list[current_player;craft;3.5,1.75;1,1;5]
			list[current_player;craft;2.5,1.75;1,1;4]
			list[current_player;craft;3.5,0.75;1,1;2]
			list[current_player;craft;2.5,0.75;1,1;1]
			list[current_player;craft;1.5,1.75;1,1;3]
			list[current_player;craft;1.5,2.75;1,1;6]
			list[current_player;main;0.25,7.75;1,1;0]
			list[current_player;main;1.25,7.75;1,1;1]
			list[current_player;main;2.25,7.75;1,1;2]
			list[current_player;main;3.25,7.75;1,1;3]
			list[current_player;main;4.25,7.75;1,1;4]
			list[current_player;main;5.25,7.75;1,1;5]
			list[current_player;main;6.25,7.75;1,1;6]
			list[current_player;main;7.25,7.75;1,1;7]
			list[current_player;main;8.25,7.75;1,1;8]
			list[current_player;main;0.25,4.5;1,1;9]
			list[current_player;main;1.25,4.5;1,1;10]
			list[current_player;main;2.25,4.5;1,1;11]
			list[current_player;main;3.25,4.5;1,1;12]
			list[current_player;main;4.25,4.5;1,1;13]
			list[current_player;main;5.25,4.5;1,1;14]
			list[current_player;main;6.25,4.5;1,1;15]
			list[current_player;main;7.25,4.5;1,1;16]
			list[current_player;main;8.25,4.5;1,1;17]
			list[current_player;main;0.25,5.5;1,1;18]
			list[current_player;main;1.25,5.5;1,1;19]
			list[current_player;main;2.25,5.5;1,1;20]
			list[current_player;main;3.25,5.5;1,1;21]
			list[current_player;main;4.25,5.5;1,1;22]
			list[current_player;main;5.25,5.5;1,1;23]
			list[current_player;main;6.25,5.5;1,1;24]
			list[current_player;main;7.25,5.5;1,1;25]
			list[current_player;main;8.25,5.5;1,1;26]
			list[current_player;main;0.25,6.5;1,1;27]
			list[current_player;main;1.25,6.5;1,1;28]
			list[current_player;main;2.25,6.5;1,1;29]
			list[current_player;main;3.25,6.5;1,1;30]
			list[current_player;main;4.25,6.5;1,1;31]
			list[current_player;main;5.25,6.5;1,1;32]
			list[current_player;main;6.25,6.5;1,1;33]
			list[current_player;main;7.25,6.5;1,1;34]
			list[current_player;main;8.25,6.5;1,1;35]
			list[current_player;craftpreview;6.75,1.75;1,1;0]
		]]

		minetest.show_formspec(player:get_player_name(), "main", form)
	end,
})

minetest.register_node("minecraft:obsidian", {
	description = "Obsidian",
	tiles = {"terrain.png^[sheet:16x16:5,2"},
	groups = {cracky=1, level=3},
})

minetest.register_node("minecraft:tnt", {
	description = "TNT",
	tiles = {"terrain.png^[sheet:16x16:9,0",
			 "terrain.png^[sheet:16x16:10,0",
			 "terrain.png^[sheet:16x16:8,0"},
	is_ground_content = false,
	groups = {dig_immediate=2}
})

minetest.register_node("minecraft:wet_farmland", {
	description = "Farmland",
	tiles ={"terrain.png^[sheet:16x16:6,5",
			"terrain.png^[sheet:16x16:2,0",
			"terrain.png^[sheet:16x16:2,0",},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("minecraft:farmland", {
	description = "Farmland",
	tiles ={"terrain.png^[sheet:16x16:7,5",
			"terrain.png^[sheet:16x16:2,0",
			"terrain.png^[sheet:16x16:2,0",},
	groups = {crumbly=3, soil=1},
})

minetest.register_node("minecraft:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	tiles = {"terrain.png^[sheet:16x16:15,0"},
	groups = {dig_immediate=2,snappy=3},
	inventory_image = "terrain.png^[sheet:16x16:15,0"
})

minetest.register_node("minecraft:flower", {
	description = "Flower",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	tiles = {"terrain.png^[sheet:16x16:13,0"},
	groups = {dig_immediate=2,snappy=3},
	inventory_image = "terrain.png^[sheet:16x16:13,0"
})

minetest.register_node("minecraft:rose", {
	description = "Rose",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	tiles = {"terrain.png^[sheet:16x16:12,0"},
	groups = {dig_immediate=2,snappy=3},
	inventory_image = "terrain.png^[sheet:16x16:12,0"
})

minetest.register_node("minecraft:mushroom", {
	description = "Mushroom",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	tiles = {"terrain.png^[sheet:16x16:12,1"},
	groups = {dig_immediate=2},
	inventory_image = "terrain.png^[sheet:16x16:12,1"
})

minetest.register_node("minecraft:mushroom2", {
	description = "Mushroom",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	tiles = {"terrain.png^[sheet:16x16:13,1"},
	groups = {dig_immediate=2},
	inventory_image = "terrain.png^[sheet:16x16:13,1"
})

minetest.register_node("minecraft:wool", {
	description = "Wool",
	tiles = {"terrain.png^[sheet:16x16:0,4"},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=3}
})

minetest.register_node("minecraft:spawner", {
	description = "Mob Spawner",
	drawtype = "allfaces",
	tiles = {"terrain.png^[sheet:16x16:1,4"},
	paramtype = "light",
	is_ground_content = false,
	groups = {choppy=1},
	drop = "",
})

-- More blocks that are in their separate code file.

dofile(minetest.get_modpath("minecraft") .. "/blocks/chest.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/furnace.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/ladder.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/liquids.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/torch.lua")
