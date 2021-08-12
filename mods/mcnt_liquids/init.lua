local WATER_VISC = 1
local LAVA_VISC = 7

minetest.register_node(":minecraft:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mcnt_liquids_water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 5.0,
			},
		},
		{
			name = "mcnt_liquids_water_flow.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 3,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "minecraft:water_flowing",
	liquid_alternative_source = "minecraft:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 128, r = 0, g = 0, b = 255},
	groups = {water = 3, liquid = 3},
	waving = 3
})

minetest.register_node(":minecraft:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"mcnt_liquids_water_flow.png"},
	special_tiles = {
		{
			name = "mcnt_liquids_water_flow.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 3,
			},
		},
		{
			name = "mcnt_liquids_water_flow.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 3,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "minecraft:water_flowing",
	liquid_alternative_source = "minecraft:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a = 128, r = 0, g = 0, b = 255},
	groups = {water = 3, liquid = 3},
	waving = 3
})

--lavalalvalvalvavlalvalvlalvl!!!!

minetest.register_node(":minecraft:lava_flowing", {
	description = "Flowing Lava",
	drawtype = "flowingliquid",
	tiles = {"mcnt_liquids_lava_flow.png"},
	special_tiles = {
		{
			name = "mcnt_liquids_lava_flow.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 5,
			},
		},
		{
			name = "mcnt_liquids_lava_flow.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 5,
			},
		},
	},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquid_range = 4,
	damage_per_second = 6,
	liquidtype = "flowing",
	liquid_alternative_flowing = "minecraft:lava_flowing",
	liquid_alternative_source = "minecraft:lava_source",
	liquid_viscosity = LAVA_VISC,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=1},
	waving = 3
})

minetest.register_node(":minecraft:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "mcnt_liquids_lava.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2,
			},
		},
		{
			name = "mcnt_liquids_lava_flow.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 1,
				aspect_h = 1,
				length = 2.5,
			},
		},
	},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	damage_per_second = 6,
	liquidtype = "source",
	liquid_alternative_flowing = "minecraft:lava_flowing",
	liquid_alternative_source = "minecraft:lava_source",
	liquid_viscosity = LAVA_VISC,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=1},
	waving = 3
})

dofile(minetest.get_modpath('mcnt_liquids')..'/buckets.lua')
