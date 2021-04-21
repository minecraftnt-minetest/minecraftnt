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