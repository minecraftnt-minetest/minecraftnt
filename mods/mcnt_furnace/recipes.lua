
minetest.register_craft({
	output = "minecraft:furnace",
	recipe = {
		{"minecraft:cobble", "minecraft:cobble", "minecraft:cobble"},
		{"minecraft:cobble", "", "minecraft:cobble"},
		{"minecraft:cobble", "minecraft:cobble", "minecraft:cobble"},
	}
})

--
-- Fuels
--

minetest.register_craft({
	type = "fuel",
	recipe = "minecraft:coal",
	burntime = 80,
})

minetest.register_craft({
	type = "fuel",
	recipe = "minecraft:plank",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "minecraft:log",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "minecraft:crafting_table",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "minecraft:chest",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "minecraft:stick",
	burntime = 5,
})

--
-- Smelting
--

minetest.register_craft({
	type = "cooking",
	output = "minecraft:iron_ingot",
	recipe = "minecraft:iron_ore",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "minecraft:gold_ingot",
	recipe = "minecraft:gold_ore",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "minecraft:glass",
	recipe = "minecraft:sand",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "minecraft:cooked_porkchop",
	recipe = "minecraft:raw_porkchop",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "minecraft:stone",
	recipe = "minecraft:cobble",
	cooktime = 10,
})
