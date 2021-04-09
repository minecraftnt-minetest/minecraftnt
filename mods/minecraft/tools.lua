minetest.register_tool("minecraft:wooden_pickaxe", {
	description = "Wooden Pickaxe",
	inventory_image = "items.png^[sheet:16x16:0,6",
	tool_capabilities = {
		max_drop_level = 0,
		groupcaps = {
			cracky = {
				maxlevel = 1,
				uses = 59,
				times = { [3]=1.60 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 30,
	},
})
minetest.register_tool("minecraft:stone_pickaxe", {
	description = "Stone Pickaxe",
	inventory_image = "items.png^[sheet:16x16:1,6",
	tool_capabilities = {
		max_drop_level = 0,
		groupcaps = {
			cracky = {
				maxlevel = 1,
				uses = 131,
				times = { [2]=2.0, [3]=1.00 }
			},
		},
		damage_groups = {fleshy=3},
		punch_attack_uses = 66,
	},
})
minetest.register_tool("minecraft:iron_pickaxe", {
	description = "Iron Pickaxe",
	inventory_image = "items.png^[sheet:16x16:2,6",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps = {
			cracky = {
				maxlevel = 2,
				uses = 250,
				times = { [1]=4.00, [2]=1.60, [3]=0.80 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 126,
	},
})
minetest.register_tool("minecraft:golden_pickaxe", {
	description = "Golden Pickaxe",
	inventory_image = "items.png^[sheet:16x16:4,6",
	tool_capabilities = {
		max_drop_level=2,
		groupcaps = {
			cracky = {
				maxlevel = 2,
				uses = 32,
				times = { [3]=1.60 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 17,
	},
})
minetest.register_tool("minecraft:diamond_pickaxe", {
	description = "Diamond Pickaxe",
	inventory_image = "items.png^[sheet:16x16:3,6",
	tool_capabilities = {
		max_drop_level=3,
		groupcaps = {
			cracky = {
				maxlevel = 3,
				uses = 1561,
				times = { [1]=2.0, [2]=1.0, [3]=0.50 }
			},
		},
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
})

-- Shovels!

minetest.register_tool("minecraft:wooden_shovel", {
	description = "Wooden Shovel",
	inventory_image = "items.png^[sheet:16x16:0,5",
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 59,
				times = { [1]=3.00, [2]=1.60, [3]=0.60 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 30,
	},
})
minetest.register_tool("minecraft:stone_shovel", {
	description = "Stone Shovel",
	inventory_image = "items.png^[sheet:16x16:1,5",
	tool_capabilities = {
		max_drop_level = 3,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 131,
				times = { [1]=1.80, [2]=1.20, [3]=0.50 }
			},
		},
		damage_groups = {fleshy=3},
		punch_attack_uses = 66,
	},
})
minetest.register_tool("minecraft:iron_shovel", {
	description = "Iron Shovel",
	inventory_image = "items.png^[sheet:16x16:2,5",
	tool_capabilities = {
		max_drop_level = 4,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 250,
				times = { [1]=1.50, [2]=0.90, [3]=0.40 }
			},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 126,
	},
})
minetest.register_tool("minecraft:golden_shovel", {
	description = "Golden Shovel",
	inventory_image = "items.png^[sheet:16x16:4,5",
	tool_capabilities = {
		max_drop_level = 2,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 32,
				times = { [1]=3.00, [2]=1.60, [3]=0.60 }
			},
		},
		damage_groups = {fleshy=2},
		punch_attack_uses = 17,
	},
})
minetest.register_tool("minecraft:diamond_shovel", {
	description = "Diamond Shovel",
	inventory_image = "items.png^[sheet:16x16:3,5",
	tool_capabilities = {
		max_drop_level = 5,
		groupcaps = {
			crumbly = {
				maxlevel = 2,
				uses = 1561,
				times = {[1]=1.10, [2]=0.50, [3]=0.30}
			},
		},
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
})

-- Axes

minetest.register_tool("minecraft:wooden_axe", {
	description = "Wooden Axe",
	inventory_image = "items.png^[sheet:16x16:0,7",
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 1,
				uses = 59,
				times = { [2]=3.00, [3]=1.60 }
			},
		},
		damage_groups = {fleshy=7},
		punch_attack_uses = 30,
	},
})
minetest.register_tool("minecraft:stone_axe", {
	description = "Stone Axe",
	inventory_image = "items.png^[sheet:16x16:1,7",
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 1,
				uses = 131,
				times = { [1]=3.00, [2]=2.00, [3]=1.30 }
			},
		},
		damage_groups = {fleshy=9},
		punch_attack_uses = 66,
	},
})
minetest.register_tool("minecraft:iron_axe", {
	description = "Iron Axe",
	inventory_image = "items.png^[sheet:16x16:2,7",
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 2,
				uses = 250,
				times = { [1]=2.50, [2]=1.40, [3]=1.00 }
			},
		},
		damage_groups = {fleshy=9},
		punch_attack_uses = 126,
	},
})
minetest.register_tool("minecraft:golden_axe", {
	description = "Golden Axe",
	inventory_image = "items.png^[sheet:16x16:4,7",
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 2,
				uses = 32,
				times = { [2]=3.00, [3]=1.60 }
			},
		},
		damage_groups = {fleshy=7},
		punch_attack_uses = 17,
	},
})
minetest.register_tool("minecraft:diamond_axe", {
	description = "Diamond Axe",
	inventory_image = "items.png^[sheet:16x16:3,7",
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			choppy = {
				maxlevel = 3,
				uses = 1561,
				times = { [1]=3.00, [2]=1.60, [3]=0.60 }
			},
		},
		damage_groups = {fleshy=9},
		punch_attack_uses = 781,
	},
})