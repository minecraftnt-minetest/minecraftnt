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
        minetest.place_schematic({x = pos.x, y = pos.y-1, z = pos.z}, minetest.get_modpath("minecraft").."/schematics/tree.mts", "random", nil, false)
	end
end

-- Sapling block

minetest.register_node("minecraft:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	tiles = {"terrain.png^[sheet:16x16:15,0"},
	inventory_image = "terrain.png^[sheet:16x16:15,0",
	wield_image = "terrain.png^[sheet:16x16:15,0",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = grow_sapling,
	groups = {snappy = 2,dig_immediate = 3,attached_node = 1,sapling = 1},
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 3600))
	end,
})

-- Tree deco

minetest.register_decoration({
  deco_type = "schematic",
  place_on = {"minecraft:grass"},
  sidelen = 16,
  noise_params = {
    offset = 0.0,
    --scale = -0.015,
    scale = 0.0007,
    spread = {x = 250, y = 250, z = 250},
    seed = 2,
    octaves = 3,
    persist = 0.66
  },
  biomes = {"grasslands"},
  y_min = 1,
  y_max = 31000,
  schematic = minetest.get_modpath("minecraft").."/schematics/tree.mts",
  flags = "place_center_x, place_center_z",
})