
-- Ladders!

minetest.register_node("minecraft:ladder", {
	description = "Ladder",
	drawtype = "signlike",
	is_ground_content = false,
	tiles = {"terrain.png^[sheet:16x16:3,5"},
	inventory_image = "terrain.png^[sheet:16x16:3,5",
	wield_image = "terrain.png^[sheet:16x16:3,5",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = true,
	climbable = true,
	node_box = {
		type = "wallmounted",
		wall_side = { -0.5, -0.5, -0.5, -7/16, 0.5, 0.5 },
	},
	selection_box = {
		type = "wallmounted",
		wall_side = { -0.5, -0.5, -0.5, -7/16, 0.5, 0.5 },
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3},
	-- Restrict placement of ladders
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			-- no interaction possible with entities
			return itemstack
		end

		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if not def then
			return itemstack
		end

		-- Don't allow placing ladders on ladders. this should probably be extended with other types of nodes.
		if node.name == "minecraft:ladder" then
			return itemstack
		end

		-- Check special rightclick action of pointed node
		if def and def.on_rightclick then
			if not placer:get_player_control().sneak then
				return def.on_rightclick(under, node, placer, itemstack,
					pointed_thing) or itemstack, false
			end
		end
		local above = pointed_thing.above

		-- Ladders may not be placed on ceiling or floor
		if under.y ~= above.y then
			return itemstack
		end

		minetest.item_place_node(itemstack, placer, pointed_thing)

		return itemstack
	end,
})