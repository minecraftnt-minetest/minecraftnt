--TODO: armor, minecart stuff (oh yeah swords too ofc)

--
-- General recipes.
--

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

minetest.register_craft({
	output = "minecraft:bucket",
	recipe = {
		{"minecraft:iron_ingot", "", "minecraft:iron_ingot"},
		{"", "minecraft:iron_ingot", ""},
	}
})

minetest.register_craft({
	output = "minecraft:flint_and_steel",
	recipe = {
		{"minecraft:iron_ingot", ""},
		{"", "minecraft:flint"},
	}
})

minetest.register_craft({
	output = "minecraft:painting",
	recipe = {
		{"minecraft:stick", "minecraft:stick", "minecraft:stick"},
		{"minecraft:stick", "minecraft:wool", "minecraft:stick"},
		{"minecraft:stick", "minecraft:stick", "minecraft:stick"},
	}
})

minetest.register_craft({
	output = "minecraft:bow",
	recipe = {
		{"", "minecraft:stick", "minecraft:string"},
		{"minecraft:stick", "", "minecraft:string"},
		{"", "minecraft:stick", "minecraft:string"},
	}
})

minetest.register_craft({
	output = "minecraft:arrow",
	recipe = {
		{"minecraft:flint"},
		{"minecraft:stick"},
		{"minecraft:feather"},
	}
})

--
-- Material blocks (back and forth)
--

material_blocks = {
	iron_ingot = "iron",
	gold_ingot = "gold",
	diamond = "diamond"
}

for k, v in pairs(material_blocks) do
	s = "minecraft:"..k
	o = "minecraft:block_of_"..v

	minetest.register_craft({
		output = o,
		recipe = {
			{s, s, s},
			{s, s, s},
			{s, s, s},
		}
	})

	minetest.register_craft({
		output = s.." 9",
		recipe = {
			{o}
		}
	})
end

--
-- Food
--

minetest.register_craft({
	type = "shapeless",
	output = "minecraft:mushroom_stew",
	recipe = {
		"minecraft:mushroom",
		"minecraft:mushroom2",
		"minecraft:bowl"
	}
})

minetest.register_craft({
	output = "minecraft:bowl",
	recipe = {
		{"minecraft:plank", "", "minecraft:plank"},
		{"", "minecraft:plank", ""}
	}
})

minetest.register_craft({
	output = "minecraft:bread",
	recipe = {
		{"minecraft:wheat", "minecraft:wheat", "minecraft:wheat"},
	}
})

minetest.register_craft({
	output = "minecraft:golden_apple",
	recipe = {
		{"minecraft:block_of_gold", "minecraft:block_of_gold", "minecraft:block_of_gold"},
		{"minecraft:block_of_gold", "minecraft:apple", "minecraft:block_of_gold"},
		{"minecraft:block_of_gold", "minecraft:block_of_gold", "minecraft:block_of_gold"},
	}
})

--
-- Blocks
--

minetest.register_craft({
	output = "minecraft:tnt",
	recipe = {
		{"minecraft:gunpowder", "minecraft:sand", "minecraft:gunpowder"},
		{"minecraft:sand", "minecraft:gunpowder", "minecraft:sand"},
		{"minecraft:gunpowder", "minecraft:sand", "minecraft:gunpowder"},
	}
})

minetest.register_craft({
	output = "minecraft:wool",
	recipe = {
		{"minecraft:string", "minecraft:string", "minecraft:string"},
		{"minecraft:string", "minecraft:string", "minecraft:string"},
		{"minecraft:string", "minecraft:string", "minecraft:string"},
	}
})

minetest.register_craft({
	output = "minecraft:cobble_slab 3",
	recipe = {
		{"minecraft:cobble", "minecraft:cobble", "minecraft:cobble"}
	}
})

minetest.register_craft({
	output = "minecraft:sign",
	recipe = {
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
		{"", "minecraft:stick", ""},
	}
})

minetest.register_craft({
	output = "minecraft:plank_stairs 4",
	recipe = {
		{"minecraft:plank", "", ""},
		{"minecraft:plank", "minecraft:plank", ""},
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
	}
})

minetest.register_craft({
	output = "minecraft:cobble_stairs 4",
	recipe = {
		{"minecraft:cobble", "", ""},
		{"minecraft:cobble", "minecraft:cobble", ""},
		{"minecraft:cobble", "minecraft:cobble", "minecraft:cobble"},
	}
})

minetest.register_craft({
	output = "minecraft:stone_slab 3",
	recipe = {
		{"minecraft:stone", "minecraft:stone", "minecraft:stone"}
	}
})
