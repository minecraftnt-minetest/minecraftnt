minetest.register_tool("minecraft:wooden_pickaxe", {
	description = "Wooden Pickaxe",
	inventory_image = "items.png^[sheet:16x16:0,6",
	tool_capabilities = {
		max_drop_level = 1,
		groupcaps = {
			cracky = {
				maxlevel = 2,
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
		max_drop_level = 3,
		groupcaps = {
			cracky = {
				maxlevel = 2,
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
		max_drop_level=4,
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
		max_drop_level=5,
		groupcaps = {
			cracky = {
				maxlevel = 2,
				uses = 1561,
				times = { [1]=2.0, [2]=1.0, [3]=0.50 }
			},
		},
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
})