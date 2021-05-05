dofile(minetest.get_modpath("minecraft") .. "/misc/farming.lua")

dofile(minetest.get_modpath("minecraft") .. "/blocks.lua")
dofile(minetest.get_modpath("minecraft") .. "/helpers.lua")
dofile(minetest.get_modpath("minecraft") .. "/items.lua")
dofile(minetest.get_modpath("minecraft") .. "/mapgen.lua")
dofile(minetest.get_modpath("minecraft") .. "/recipes.lua")

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