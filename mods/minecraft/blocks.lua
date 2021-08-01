minetest.register_node("minecraft:stone", {
	description = "Stone",
	tiles = { terrain(1) },
	groups = { cracky = 3 },
	drop = "minecraft:cobble",
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:grass", {
	description = "Grass",
	drop = "minecraft:dirt",
	tiles = {
		terrain(0),
		terrain(2),
		{name = terrain(3), tileable_vertical = false}
	},
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
	sounds = block_sound('grass'),
})

minetest.register_node("minecraft:dirt", {
	description = "Dirt",
	tiles = { terrain(2) },
	groups = { crumbly = 3, soil = 1, cultivatable = 1 },
	sounds = block_sound('gravel'),
})

minetest.register_node("minecraft:oak", {
	description = "Wood",
	tiles = {
		terrain(21),
		terrain(21),
		terrain(20)
	},
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 2 },
	sounds = block_sound('wood'),
})

minetest.register_node("minecraft:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	tiles = { terrain(52) },
	paramtype = "light",
	is_ground_content = false,
	groups = { snappy = 1, dig_immediate = 3 },
	waving = 2,
	drop = {
		max_items = 1,
		items = {
			{
				items = {"minecraft:sapling"},
				rarity = 10, -- a1.0.0 has 1/10 chance of leaves dropping sapling
			},
		}
	},
	sounds = block_sound('grass'),
})

minetest.register_node("minecraft:plank", {
	description = "Wooden Planks",
	tiles = { terrain(4) },
	is_ground_content = false,
	groups = { choppy = 2, oddly_breakable_by_hand = 2 },
	sounds = block_sound('wood'),
})

minetest.register_node("minecraft:glass", {
	description = "Glass",
	drawtype = "glasslike",
	drop = "",
	tiles = { terrain(19) },
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	groups = { cracky = 3, oddly_breakable_by_hand = 3 },
	sounds = block_sound('glass'),
})

minetest.register_node("minecraft:sand", {
	description = "Sand",
	tiles = { terrain(18) },
	groups = { falling_node = 1, crumbly = 3 },
	sounds = block_sound('sand'),
})

minetest.register_node("minecraft:gravel", {
	description = "Gravel",
	tiles = { terrain(19) },
	groups = {falling_node=1,crumbly=3},
	sounds = block_sound('gravel'),
})

minetest.register_node("minecraft:cobble", {
	description = "Cobblestone",
	tiles = { terrain(16) },
	is_ground_content = false,
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:mossycobble", {
	description = "Moss Stone",
	tiles = { terrain(36) },
	is_ground_content = false,
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:bedrock", {
	description = "Bedrock",
	tiles = { terrain(17) },
	is_ground_content = false,
	groups = { unbreakable = 1 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:bricks", {
	description = "Bricks",
	tiles = { terrain(7) },
	is_ground_content = false,
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:bookshelf", {
	description = "Bookshelf",
	tiles = {
		terrain(4),
		terrain(4),
		terrain(35),
	},
	is_ground_content = false,
	groups = { choppy = 2, oddly_breakable_by_hand = 2 },
	sounds = block_sound('wood'),
})

minetest.register_node("minecraft:coal_ore", {
	description = "Coal Ore",
	drop = "minecraft:coal",
	tiles = { terrain(34) },
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:iron_ore", {
	description = "Iron Ore",
	tiles = { terrain(33) },
	groups = { cracky = 2, level = 1 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:gold_ore", {
	description = "Gold Ore",
	tiles = { terrain(32) },
	groups = { cracky = 2, level = 1 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:diamond_ore", {
	description = "Diamond Ore",
	drop = "minecraft:diamond",
	tiles = { terrain(50) },
	groups = { cracky = 1, level = 2 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:plank_stairs", {
	description = "Wooden Stairs",
	tiles = { terrain(4) },
	is_ground_content = false,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}, -- NodeBox2
		}
	},
	groups = { cracky = 3 },
	sounds = block_sound('wood'),
})

minetest.register_node("minecraft:cobble_stairs", {
	description = "Stone Stairs",
	tiles = { terrain(16) },
	is_ground_content = false,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2  = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
			{-0.5, -0.5, 0, 0.5, 0.5, 0.5}, -- NodeBox2
		}
	},
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:plank_slab", {
	description = "Wooden Slab",
	tiles = { terrain(4) },
	is_ground_content = false,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	},
	groups = {cracky=3},
	sounds = block_sound('wood'),
})

minetest.register_node("minecraft:cobble_slab", {
	description = "Stone Slab",
	tiles = { terrain(16) },
	is_ground_content = false,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	},
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:stone_slab", {
	description = "Stone Slab",
	tiles = {
		terrain(6),
		terrain(6),
		terrain(5),
		terrain(5),
		terrain(5),
		terrain(5),
	},
	is_ground_content = false,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}, -- NodeBox1
		}
	},
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:stone_slab_block", {
	description = "tile.stoneSlab",
	drop = "minecraft:stone_slab",
	tiles = {
		terrain(6),
		terrain(6),
		terrain(5),
		terrain(5),
		terrain(5),
		terrain(5),
	},
	is_ground_content = false,
	groups = { cracky = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:iron_block", {
	description = "Block of Iron",
	tiles = {
		terrain(22),
		terrain(54),
		terrain(38),
		terrain(38),
		terrain(38),
		terrain(38),
	},
	groups = { cracky = 2, level = 1 },
	sounds = block_sound('metal'),
})

minetest.register_node("minecraft:gold_block", {
	description = "Block of Gold",
	tiles = {
		terrain(23),
		terrain(55),
		terrain(39),
		terrain(39),
		terrain(39),
		terrain(39),
	},
	groups = { cracky = 2, level = 1 },
	sounds = block_sound('metal'),
})

minetest.register_node("minecraft:diamond_block", {
	description = "Block of Diamond",
	tiles = {
		terrain(24),
		terrain(56),
		terrain(40),
		terrain(40),
		terrain(40),
		terrain(40),
	},
	groups = {cracky=1,level=2},
	sounds = block_sound('metal'),
})

minetest.register_node("minecraft:crafting_table", {
	description = "Crafting Table",
	tiles = {
		terrain(43),
		terrain(4),
		terrain(59),
		terrain(59),
		terrain(60),
		terrain(60),
	},
	is_ground_content = false,
	on_rightclick = function(pos, node, player, itemstack)
		player:get_inventory():set_width("craft", 3)
		player:get_inventory():set_size("craft", 9)

		local form = [[
			size[9.5,9]
			real_coordinates[true]
			bgcolor[blue;true]
			listcolors[#ffffff00;#ffffff80]
			style_type[list;spacing=0.125,0.125;size=0.85,0.85]
			image[0,0;9.5,9;crafting.png]
			model[1.25,0.25;3,4;playermodel;character.b3d;character.png;0,180;false;false;walk,stand]
			list[current_player;craft;1.65,0.95;3,3;0]
			list[current_player;craftpreview;6.70,1.92;1,1;0]
			list[current_player;main;0.45,7.70;9,1;0]
			list[current_player;main;0.45,4.57;9,3;9]
		]]

		minetest.show_formspec(player:get_player_name(), "main", form)
	end,
	groups = { choppy = 2, oddly_breakable_by_hand = 2 },
	sounds = block_sound('wood'),
})

minetest.register_node("minecraft:obsidian", {
	description = "Obsidian",
	tiles = { terrain(37) },
	groups = { cracky = 1, level = 3 },
	sounds = block_sound('stone'),
})

minetest.register_node("minecraft:tnt", {
	description = "TNT",
	tiles = {
		terrain(9),
		terrain(10),
		terrain(8)
	},
	is_ground_content = false,
	groups = { dig_immediate = 2 },
	sounds = block_sound('grass'),
})

minetest.register_node("minecraft:flower", {
	description = "Flower",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(13) },
	groups = { dig_immediate = 3, snappy = 3, attached_node = 1 },
	inventory_image = terrain(13),
	waving = 1,
	sounds = block_sound('grass'),
})

minetest.register_node("minecraft:rose", {
	description = "Rose",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(12) },
	groups = { dig_immediate = 3, snappy = 3, attached_node = 1 },
	inventory_image = terrain(12),
	waving = 1,
	sounds = block_sound('grass'),
})

minetest.register_node("minecraft:mushroom", {
	description = "Mushroom",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(28) },
	groups = { dig_immediate = 3, attached_node = 1 },
	inventory_image = terrain(28),
	waving = 1,
	sounds = block_sound('grass'),
})

minetest.register_node("minecraft:mushroom2", {
	description = "Mushroom",
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	tiles = { terrain(29) },
	groups = { dig_immediate = 3, attached_node = 1 },
	inventory_image = terrain(29),
	waving = 1,
	sounds = block_sound('grass'),
})

minetest.register_node("minecraft:wool", {
	description = "Wool",
	tiles = { terrain(64) },
	groups = { snappy = 1, choppy = 2, oddly_breakable_by_hand = 3 },
	sounds = block_sound('cloth'),
})

minetest.register_node("minecraft:spawner", {
	description = "Mob Spawner",
	drawtype = "allfaces",
	tiles = { terrain(65) },
	paramtype = "light",
	is_ground_content = false,
	groups = { choppy = 1 },
	drop = "",
	sounds = block_sound('metal'),
})

-- More blocks that are in their separate code file.

dofile(minetest.get_modpath("minecraft") .. "/blocks/chest.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/farmland.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/furnace.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/ladder.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/liquids.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/sponge.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/torch.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/wheat.lua")
dofile(minetest.get_modpath("minecraft") .. "/blocks/doors.lua")
