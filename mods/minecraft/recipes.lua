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

--
-- Tool recipes.
--

tool_data = {
	{
		material = "minecraft:plank",
		output = "minecraft:wooden_",
	}, {
		material = "minecraft:cobble",
		output = "minecraft:stone_",
	}, {
		material = "minecraft:iron_ingot",
		output = "minecraft:iron_",
	}, {
		material = "minecraft:gold_ingot",
		output = "minecraft:golden_",
	}, {
		material = "minecraft:diamond",
		output = "minecraft:diamond_",
	}
}

for k, v in pairs(tool_data) do
	-- Pickaxes
	minetest.register_craft({
		output = v['output'].."pickaxe",
		recipe = {
			{v['material'], v['material'], v['material']},
			{"", "minecraft:stick", ""},
			{"", "minecraft:stick", ""},
		}
	})

	-- Shovels
	minetest.register_craft({
		output = v['output'].."shovel",
		recipe = {
			{v['material']},
			{"minecraft:stick"},
			{"minecraft:stick"},
		}
	})

	-- Axes
	minetest.register_craft({
		output = v['output'].."axe",
		recipe = {
			{v['material'], v['material']},
			{"minecraft:stick", v['material']},
			{"minecraft:stick", ""},
		}
	})

	-- Axes (Mirrored)
	minetest.register_craft({
		output = v['output'].."axe",
		recipe = {
			{v['material'], v['material']},
			{v['material'], "minecraft:stick"},
			{"", "minecraft:stick"},
		}
	})
end
