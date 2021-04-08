-- sfinv/init.lua

dofile(minetest.get_modpath("sfinv") .. "/api.lua")

-- Load support for MT game translation.
local S = minetest.get_translator("sfinv")

sfinv.register_page("sfinv:main", {
	title = S("Main"),
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
			size[11.5,10.75,true]
			real_coordinates[true]
			list[current_player;main;0.25,9.5;9,1;0]
			list[current_player;main;0.25,5.5;9,3;9]
			list[current_player;armor;0.25,0.25;1,4;0]
			box[1.5,0.25;3,4.75;black]
			model[1.5,0.25;3,4.75;playermodel;character.b3d;character.png;0,180;false;false;walk,stand]
			list[current_player;craft;5,1.5.25;2,2;0]
			list[current_player;craftpreview;8.75,2.12;2,2;0]
			image[7.5,2.12;1,1;sfinv_crafting_arrow.png]
			]])
	end
})

minetest.register_on_joinplayer(function(ObjectRef)
	ObjectRef:get_inventory():set_width("main", 9)
	ObjectRef:get_inventory():set_size("main", 36)
	ObjectRef:hud_set_hotbar_itemcount(9)

	local InvRef = ObjectRef:get_inventory()

	InvRef:set_list("armor", armor)
	InvRef:set_size("armor", 4)
end)
