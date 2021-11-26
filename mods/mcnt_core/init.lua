dofile(minetest.get_modpath("mcnt_core") .. "/sounds.lua")
dofile(minetest.get_modpath("mcnt_core") .. "/helpers.lua")

dofile(minetest.get_modpath("mcnt_core") .. "/blocks.lua")

dofile(minetest.get_modpath("mcnt_core") .. "/items.lua")
dofile(minetest.get_modpath("mcnt_core") .. "/recipes.lua")

minetest.register_alias("mapgen_stone", "minecraft:stone")
minetest.register_alias("mapgen_water_source", "minecraft:water_source")
minetest.register_alias("mapgen_river_water_source", "minecraft:water_source")

-- devs drop apples on death!
minetest.register_on_dieplayer(function(entity, reason)
	if entity:get_player_name() == "ROllerozxa" or entity:get_player_name() == "Danil_2461" then
		minetest.item_drop(ItemStack("minecraft:apple"), entity, entity:get_pos())
	end
end)

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	-- Build limit
	if pos.y > layer_to_y(128) then
		minetest.remove_node(pos)
		return true
	end

	-- Unlimited blocks in creative mode
	if placer and placer:is_player() then
		return minetest.is_creative_enabled(placer:get_player_name())
	end
end)

-- Hotbar texture
minetest.register_on_joinplayer(function(player)
	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
end)

-- Disable sneak (There's also a configuration in minetest.conf to make sneaking speed identical to normal walking)
minetest.register_on_joinplayer(function(player)
	player:set_physics_override({ sneak = false })
end)

-- Make items drop one-by-one instead of whole stack
local old_drop = minetest.item_drop
minetest.item_drop = function(itemstack, dropper, pos)
	old_drop(itemstack:take_item(1), dropper, pos)
	return itemstack
end

-- Head animation cool
minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		player:set_bone_position("Head", vector.new(0, 6.35, 0), vector.new(-math.deg(player:get_look_vertical()), 0, 0))
	end
end)
