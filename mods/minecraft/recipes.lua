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