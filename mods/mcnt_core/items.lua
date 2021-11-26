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

minetest.register_craftitem(":minecraft:flint_and_steel", {
	description = "Flint and Steel",
	inventory_image = "items.png^[sheet:16x16:5,0"
})

minetest.register_craftitem(":minecraft:flint", {
	description = "Flint",
	inventory_image = "items.png^[sheet:16x16:6,0"
})

minetest.register_craftitem(":minecraft:coal", {
	description = "Coal",
	inventory_image = "items.png^[sheet:16x16:7,0"
})

minetest.register_craftitem(":minecraft:string", {
	description = "String",
	inventory_image = "items.png^[sheet:16x16:8,0"
})

minetest.register_craftitem(":minecraft:seeds", {
	description = "Seeds",
	inventory_image = "items.png^[sheet:16x16:9,0",
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "minecraft:wheatblock_1")
	end
})

minetest.register_craftitem(":minecraft:apple", {
	description = "Apple",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:10,0",
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem(":minecraft:golden_apple", {
	description = "Golden Apple",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:11,0",
	on_use = minetest.item_eat(20),
})

minetest.register_craftitem(":minecraft:bow", {
	description = "Bow",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:5,1"
})

minetest.register_craftitem(":minecraft:iron_ingot", {
	description = "Iron Ingot",
	inventory_image = "items.png^[sheet:16x16:7,1"
})

minetest.register_craftitem(":minecraft:feather", {
	description = "Feather",
	inventory_image = "items.png^[sheet:16x16:8,1"
})

minetest.register_craftitem(":minecraft:wheat", {
	description = "Wheat",
	inventory_image = "items.png^[sheet:16x16:9,1"
})

minetest.register_craftitem(":minecraft:painting", {
	description = "Painting",
	inventory_image = "items.png^[sheet:16x16:10,1"
})

minetest.register_craftitem(":minecraft:arrow", {
	description = "Arrow",
	inventory_image = "items.png^[sheet:16x16:5,2"
})

minetest.register_craftitem(":minecraft:gold_ingot", {
	description = "Gold Ingot",
	inventory_image = "items.png^[sheet:16x16:7,2"
})

minetest.register_craftitem(":minecraft:gunpowder", {
	description = "Gunpowder",
	inventory_image = "items.png^[sheet:16x16:8,2"
})

minetest.register_craftitem(":minecraft:bread", {
	description = "Bread",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:9,2",
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem(":minecraft:sign", {
	description = "Sign",
	stack_max = 16,
	inventory_image = "items.png^[sheet:16x16:10,2"
})

minetest.register_craftitem(":minecraft:stick", {
	description = "Stick",
	inventory_image = "items.png^[sheet:16x16:5,3"
})

minetest.register_craftitem(":minecraft:diamond", {
	description = "Diamond",
	inventory_image = "items.png^[sheet:16x16:7,3",
})

minetest.register_craftitem(":minecraft:bowl", {
	description = "Bowl",
	inventory_image = "items.png^[sheet:16x16:7,4"
})

minetest.register_craftitem(":minecraft:mushroom_stew", {
	description = "Mushroom Stew",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:8,4",
	on_use = minetest.item_eat(10, "minecraft:bowl"),
})

minetest.register_craftitem(":minecraft:raw_porkchop", {
	description = "Raw Porkchop",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:7,5",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem(":minecraft:cooked_porkchop", {
	description = "Cooked Porkchop",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:8,5",
	on_use = minetest.item_eat(8),
})

minetest.register_craftitem(":minecraft:saddle", {
	description = "Saddle",
	stack_max = 1,
	inventory_image = "items.png^[sheet:16x16:8,6"
})

minetest.register_craftitem(":minecraft:minecart", {
	description = "Minecart",
	inventory_image = "items.png^[sheet:16x16:7,8"
})
