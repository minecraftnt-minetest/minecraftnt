
--
-- Torches
-- (Thanks MineClone! :>)
--

-- Check if placement at given node is allowed
local function check_placement_allowed(node, wdir)
	-- TODO: fix this!
	local def = minetest.registered_nodes[node.name]
	if not def then
		return false
	elseif wdir == 0 then
		return false
	end
	return true
end

local itemstring = "minecraft:torch"
local itemstring_wall = "minecraft:torch_wall"

groups = {dig_immediate=3, torch=1, deco_block=1, attached_node=1}

local floordef = {
	description = "Torch",
	drawtype = "mesh",
	mesh = "torch_floor.obj",
	inventory_image = "terrain.png^[sheet:16x16:0,5",
	wield_image = "terrain.png^[sheet:16x16:0,5",
	tiles = {"terrain.png^[sheet:16x16:0,5"},
	use_texture_alpha = minetest.features.use_texture_alpha_string_modes and "opaque" or false,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	liquids_pointable = false,
	light_source = minetest.LIGHT_MAX,
	groups = groups,
	drop = itemstring,
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/16, -1/16, -1/16, 1/16, 0.5, 1/16},
		wall_bottom = {-1/16, -0.5, -1/16, 1/16, 1/16, 1/16},
	},
	node_placement_prediction = "",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			-- no interaction possible with entities, for now.
			return itemstack
		end

		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if not def then return itemstack end

		-- Call on_rightclick if the pointed node defines it
		if placer and not placer:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(under, node, placer, itemstack) or itemstack
			end
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted({x = under.x - above.x, y = under.y - above.y, z = under.z - above.z})

		if check_placement_allowed(node, wdir) == false then
			return itemstack
		end

		local itemstring = itemstack:get_name()
		local fakestack = ItemStack(itemstack)
		local idef = fakestack:get_definition()
		local retval

		if wdir == 1 then
			retval = fakestack:set_name(itemstring)
		else
			retval = fakestack:set_name(itemstring_wall)
		end
		if not retval then
			return itemstack
		end

		local success
		itemstack, success = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name(itemstring)

		if success and idef.sounds and idef.sounds.place then
			minetest.sound_play(idef.sounds.place, {pos=under, gain=1}, true)
		end
		return itemstack
	end,
	on_rotate = false,
}
minetest.register_node(itemstring, floordef)

local groups_wall = table.copy(groups)
groups_wall.torch = 2

local walldef = {
	drawtype = "mesh",
	mesh = "torch_wall.obj",
	inventory_image = "terrain.png^[sheet:16x16:0,5",
	tiles = {"terrain.png^[sheet:16x16:0,5"},
	use_texture_alpha = minetest.features.use_texture_alpha_string_modes and "opaque" or false,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	is_ground_content = false,
	walkable = false,
	light_source = minetest.LIGHT_MAX,
	groups = groups_wall,
	drop = itemstring,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, -0.1, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, 0.1, 0.1},
		wall_side = {-0.5, -0.5, -0.1, -0.2, 0.1, 0.1},
	},
	on_rotate = false,
}

minetest.register_node(itemstring_wall, walldef)
