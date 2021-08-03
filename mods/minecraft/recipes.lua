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
	output = "minecraft:torch 4",
	recipe = {
		{"minecraft:coal"},
		{"minecraft:stick"},
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

	-- Hoes
	minetest.register_craft({
		output = v['output'].."hoe",
		recipe = {
			{v['material'], v['material']},
			{"minecraft:stick", ""},
			{"minecraft:stick", ""},
		}
	})

	-- Hoes (Mirrored)
	minetest.register_craft({
		output = v['output'].."hoe",
		recipe = {
			{v['material'], v['material']},
			{"", "minecraft:stick"},
			{"", "minecraft:stick"},
		}
	})
end

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
	output = "minecraft:chest",
	recipe = {
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
		{"minecraft:plank", "", "minecraft:plank"},
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
	}
})

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

minetest.register_craft({
	output = "minecraft:furnace",
	recipe = {
		{"minecraft:cobble", "minecraft:cobble", "minecraft:cobble"},
		{"minecraft:cobble", "", "minecraft:cobble"},
		{"minecraft:cobble", "minecraft:cobble", "minecraft:cobble"},
	}
})

minetest.register_craft({
	output = "minecraft:ladder",
	recipe = {
		{"minecraft:stick", "", "minecraft:stick"},
		{"minecraft:stick", "minecraft:stick", "minecraft:stick"},
		{"minecraft:stick", "", "minecraft:stick"},
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
