-- General recipes.

minetest.register_craft({
	output = "minecraft:plank 4",
	recipe = {
		{"minecraft:oak"}
	}
})

minetest.register_craft({
	output = "minecraft:crafting_table",
	recipe = {
		{"minecraft:plank", "minecraft:plank"},
		{"minecraft:plank", "minecraft:plank"},
	}
})

minetest.register_craft({
	output = "minecraft:stick 4",
	recipe = {
		{"minecraft:plank"},
		{"minecraft:plank"},
	}
})

-- Pickaxes

minetest.register_craft({
	output = "minecraft:wooden_pickaxe",
	recipe = {
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:stone_pickaxe",
	recipe = {
		{"minecraft:cobble", "minecraft:cobble", "minecraft:cobble"},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:iron_pickaxe",
	recipe = {
		{"minecraft:iron_ingot", "minecraft:iron_ingot", "minecraft:iron_ingot"},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:gold_pickaxe",
	recipe = {
		{"minecraft:gold_ingot", "minecraft:gold_ingot", "minecraft:gold_ingot"},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:diamond_pickaxe",
	recipe = {
		{"minecraft:diamond", "minecraft:diamond", "minecraft:diamond"},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

-- Shovels

minetest.register_craft({
	output = "minecraft:wooden_shovel",
	recipe = {
		{"", "minecraft:plank", ""},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:stone_shovel",
	recipe = {
		{"", "minecraft:cobble", ""},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:iron_shovel",
	recipe = {
		{"", "minecraft:iron_ingot", ""},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:gold_shovel",
	recipe = {
		{"", "minecraft:gold_ingot", ""},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:diamond_shovel",
	recipe = {
		{"", "minecraft:diamond", ""},
		{"", "minecraft:stick", ""},
		{"", "minecraft:stick", ""},
	}
})
