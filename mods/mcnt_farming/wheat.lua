local sel_heights = {
	-5/16,
	-2/16,
	0,
	3/16,
	5/16,
	6/16,
	7/16,
}

for i = 1, 7 do
	minetest.register_node(":minecraft:wheatblock_"..i, {
		description = "Premature Wheat Plant (Stage ".. i ..")",
		paramtype = "light",
		paramtype2 = "meshoptions",
		place_param2 = 3,
		sunlight_propagates = true,
		walkable = false,
		drawtype = "plantlike",
		drop = "minecraft:seeds",
		tiles = {"terrain.png^[sheet:16x16:"..(i+7)..",5"},
		inventory_image = "terrain.png^[sheet:16x16:"..(i+7)..",5",
		wield_image = "terrain.png^[sheet:16x16:"..(i+7)..",5",
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, sel_heights[i], 0.5}
			},
		},
		groups = {dig_immediate=3, not_in_creative_inventory=1, plant=1,attached_node=1, dig_by_water=1,destroy_by_lava_flow=1, dig_by_piston=1},
		sounds = block_sound('grass'),
	})
end

minetest.register_node(":minecraft:wheatblock", {
	description = "Mature Wheat Plant",
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 3,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"terrain.png^[sheet:16x16:15,5"},
	inventory_image = "terrain.png^[sheet:16x16:15,5",
	wield_image = "terrain.png^[sheet:16x16:15,5",
	drop = {
		max_items = 4,
		items = {
			{ items = {'minecraft:seeds'} },
			{ items = {'minecraft:seeds'}, rarity = 2},
			{ items = {'minecraft:seeds'}, rarity = 5},
			{ items = {'minecraft:wheat'} }
		}
	},
	groups = {dig_immediate=3, not_in_creative_inventory=1, plant=1,attached_node=1, dig_by_water=1,destroy_by_lava_flow=1, dig_by_piston=1},
	sounds = block_sound('grass'),
})

farming:add_plant("plant_wheat", "minecraft:wheatblock", {"minecraft:wheatblock_1", "minecraft:wheatblock_2", "minecraft:wheatblock_3", "minecraft:wheatblock_4", "minecraft:wheatblock_5", "minecraft:wheatblock_6", "minecraft:wheatblock_7"}, 25, 20)
