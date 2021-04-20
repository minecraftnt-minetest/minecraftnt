local function create_soil(pos, inv)
	if pos == nil then
		return false
	end
	local node = minetest.get_node(pos)
	local name = node.name
	local above = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
	if minetest.get_item_group(name, "cultivatable") == 1 then
		if above.name == "air" then
			node.name = "minecraft:farmland"
			minetest.set_node(pos, node)
			--minetest.sound_play("default_dig_crumbly", { pos = pos, gain = 0.5 }, true)
			minetest.item_drop(ItemStack("minecraft:seeds"), nil, {x=pos.x, y=pos.y+1, z=pos.z})
			return true
		end
	end
	return false
end

local hoe_on_place_function = function(wear_divisor)
	return function(itemstack, user, pointed_thing)
		-- Call on_rightclick if the pointed node defines it
		local node = minetest.get_node(pointed_thing.under)
		if user and not user:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, user, itemstack) or itemstack
			end
		end

		if create_soil(pointed_thing.under, user:get_inventory()) then
			if not minetest.is_creative_enabled(user:get_player_name()) then
				itemstack:add_wear(65535/wear_divisor)
			end
			return itemstack
		end
	end
end

-- Hoes

minetest.register_tool("minecraft:wooden_hoe", {
	description = "Wooden Hoe",
	inventory_image = "items.png^[sheet:16x16:0,8",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = 60,
	},
	on_place = hoe_on_place_function(60),
})

minetest.register_tool("minecraft:stone_hoe", {
	description = "Stone Hoe",
	inventory_image = "items.png^[sheet:16x16:1,8",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = 132,
	},
	on_place = hoe_on_place_function(132),
})

minetest.register_tool("minecraft:iron_hoe", {
	description = "Iron Hoe",
	inventory_image = "items.png^[sheet:16x16:2,8",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = 251,
	},
	on_place = hoe_on_place_function(251),
})

minetest.register_tool("minecraft:gold_hoe", {
	description = "Gold Hoe",
	inventory_image = "items.png^[sheet:16x16:4,8",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = 33,
	},
	on_place = hoe_on_place_function(33),
})

minetest.register_tool("minecraft:gold_hoe", {
	description = "Diamond Hoe",
	inventory_image = "items.png^[sheet:16x16:3,8",
	tool_capabilities = {
		damage_groups = {fleshy=1},
		punch_attack_uses = 1562,
	},
	on_place = hoe_on_place_function(1562),
})