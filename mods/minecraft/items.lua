if minetest.settings:get_bool("creative_mode") then
	local digtime = 42
	local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

	minetest.register_item(":", {
		type = "none",
		wield_image = "hand.png",
		wield_scale = {x = 0.5, y = 1, z = 4},
		range = 10,
		tool_capabilities = {
			full_punch_interval = 0.5,
			max_drop_level = 3,
			groupcaps = {
				crumbly = caps,
				cracky  = caps,
				snappy  = caps,
				choppy  = caps,
				oddly_breakable_by_hand = caps,
				-- dig_immediate group doesn't use value 1. Value 3 is instant dig
				dig_immediate =
					{times = {[2] = digtime, [3] = 0}, uses = 0, maxlevel = 256},
			},
			damage_groups = {fleshy = 10},
		}
	})
else
	minetest.register_item(":", {
		type = "none",
		wield_image = "hand.png",
		wield_scale = {x = 0.5, y = 1, z = 4},
		tool_capabilities = {
			full_punch_interval = 0.9,
			max_drop_level = 0,
			groupcaps = {
				crumbly = {times = {[2] = 3.00, [3] = 0.70}, uses = 0, maxlevel = 1},
				snappy = {times = {[3] = 0.40}, uses = 0, maxlevel = 1},
				oddly_breakable_by_hand =
					{times = {[1] = 3.50, [2] = 2.00, [3] = 0.70}, uses = 0}
			},
			damage_groups = {fleshy = 1},
		}
	})
end

minetest.register_craftitem("minecraft:stick", {
    description = "Stick",
    inventory_image = "items.png^[sheet:16x16:5,3"
})

minetest.register_craftitem("minecraft:iron_ingot", {
    description = "Iron Ingot",
    inventory_image = "items.png^[sheet:16x16:7,1"
})

minetest.register_craftitem("minecraft:gold_ingot", {
    description = "Gold Ingot",
    inventory_image = "items.png^[sheet:16x16:7,2"
})

minetest.register_craftitem("minecraft:diamond", {
    description = "Diamond",
    inventory_image = "items.png^[sheet:16x16:7,3"
})