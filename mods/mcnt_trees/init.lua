local trees = {"small", "medium", "large"}

-- "can grow" Function

function can_grow(pos)
	local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
	if not node_under then
		return false
	end
	if minetest.get_item_group(node_under.name, "soil") == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 8 then
		return false
	end
	return true
end

-- Grow sapling
local function grow_sapling(pos)
	if not can_grow(pos) then
		minetest.get_node_timer(pos):start(math.random(1200,3600))
		return
	end
	local node = minetest.get_node(pos)
	if node.name == "minecraft:sapling" then
		minetest.log("action", "A sapling grows into a tree at "..
			minetest.pos_to_string(pos))
		minetest.remove_node(pos)
		pos.x = pos.x - 2
		pos.z = pos.z - 2
		minetest.place_schematic({x = pos.x, y = pos.y-1, z = pos.z}, minetest.get_modpath("mcnt_trees").."/schematics/tree_"..trees[math.random(1,3)]..".mts", "random", nil, false)
	end
end

-- Sapling block

minetest.register_node(":minecraft:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	tiles = { terrain(15) },
	inventory_image = terrain(15),
	wield_image = terrain(15),
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	groups = { snappy = 2, dig_immediate = 3, attached_node = 1, sapling = 1 },
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 3600))
	end,
})

-- Tree deco

for k, v in pairs(trees) do
	minetest.register_decoration({
		name = ":minecraft:tree_" ..v,
		deco_type = "schematic",
		place_on = {"minecraft:grass"},
		sidelen = 16,
		fill_ratio = 0.002,
		biomes = {"grasslands"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("mcnt_trees").."/schematics/tree_"..v..".mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end