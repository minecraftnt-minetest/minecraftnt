-- sfinv/init.lua

dofile(minetest.get_modpath("sfinv") .. "/api.lua")

sfinv.register_page("sfinv:main", {
	title = "Main",
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
			size[9.5,9]
			real_coordinates[true]
			bgcolor[black;neither]
			listcolors[#ffffff00;#ffffff80]
			image[0,0;9.5,9;inventory.png]
			list[current_player;armor;0.25,0.25;1,1;0]
			list[current_player;armor;0.25,1.25;1,1;1]
			list[current_player;armor;0.25,2.25;1,1;2]
			list[current_player;armor;0.25,3.25;1,1;3]
			box[1.25,0.25;3,4;black]
			model[1.25,0.25;3,4;playermodel;character.b3d;character.png;0,180;false;false;walk,stand]
			list[current_player;craft;4.75,1.25;1,1;0]
			list[current_player;craft;5.75,1.25;1,1;1]
			list[current_player;craft;4.75,2.25;1,1;3]
			list[current_player;craft;5.75,2.25;1,1;4]
			list[current_player;craftpreview;7.75,1.75;1,1;0]
			list[current_player;main;0.25,7.75;1,1;0]
			list[current_player;main;1.25,7.75;1,1;1]
			list[current_player;main;2.25,7.75;1,1;2]
			list[current_player;main;3.25,7.75;1,1;3]
			list[current_player;main;4.25,7.75;1,1;4]
			list[current_player;main;5.25,7.75;1,1;5]
			list[current_player;main;6.25,7.75;1,1;6]
			list[current_player;main;7.25,7.75;1,1;7]
			list[current_player;main;8.25,7.75;1,1;8]
			list[current_player;main;0.25,4.5;1,1;9]
			list[current_player;main;1.25,4.5;1,1;10]
			list[current_player;main;2.25,4.5;1,1;11]
			list[current_player;main;3.25,4.5;1,1;12]
			list[current_player;main;4.25,4.5;1,1;13]
			list[current_player;main;5.25,4.5;1,1;14]
			list[current_player;main;6.25,4.5;1,1;15]
			list[current_player;main;7.25,4.5;1,1;16]
			list[current_player;main;8.25,4.5;1,1;17]
			list[current_player;main;0.25,5.5;1,1;18]
			list[current_player;main;1.25,5.5;1,1;19]
			list[current_player;main;2.25,5.5;1,1;20]
			list[current_player;main;3.25,5.5;1,1;21]
			list[current_player;main;4.25,5.5;1,1;22]
			list[current_player;main;5.25,5.5;1,1;23]
			list[current_player;main;6.25,5.5;1,1;24]
			list[current_player;main;7.25,5.5;1,1;25]
			list[current_player;main;8.25,5.5;1,1;26]
			list[current_player;main;0.25,6.5;1,1;27]
			list[current_player;main;1.25,6.5;1,1;28]
			list[current_player;main;2.25,6.5;1,1;29]
			list[current_player;main;3.25,6.5;1,1;30]
			list[current_player;main;4.25,6.5;1,1;31]
			list[current_player;main;5.25,6.5;1,1;32]
			list[current_player;main;6.25,6.5;1,1;33]
			list[current_player;main;7.25,6.5;1,1;34]
			list[current_player;main;8.25,6.5;1,1;35]
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

--old inventory, gonna put back later
--[[
			size[11.5,10.75,true]
			real_coordinates[true]
			list[current_player;main;0.25,9.5;9,1;0]
			list[current_player;main;0.25,5.5;9,3;9]
			list[current_player;armor;0.25,0.25;1,4;0]
			box[1.5,0.25;3,4.75;black]
			model[1.5,0.25;3,4.75;playermodel;character.b3d;character.png;0,180;false;false;walk,stand]
			list[current_player;craft;5,1.5.25;2,1;0]
			list[current_player;craft;5,2.75;2,1;3]
			list[current_player;craftpreview;8.75,2.12;2,2;0]
			image[7.5,2.12;1,1;sfinv_crafting_arrow.png]
--]]

--test of pixel-perfect inventory
--[[
			size[9.5,9]
			real_coordinates[true]
			--armor
			list[current_player;armor;0.25,0.25;1,1;0]
			list[current_player;armor;0.25,1.25;1,1;1]
			list[current_player;armor;0.25,2.25;1,1;2]
			list[current_player;armor;0.25,3.25;1,1;3]
			box[1.25,0.25;3,4;black]
			--crafting
			list[current_player;craft;4.75,1.25;1,1;0]
			list[current_player;craft;5.75,1.25;1,1;1]
			list[current_player;craft;4.75,2.25;1,1;3]
			list[current_player;craft;5.75,2.25;1,1;4]
			image[6.75,1.75;1,1;sfinv_crafting_arrow.png]
			list[current_player;craftpreview;7.75,1.75;1,1;0]
			--hotbar
			list[current_player;main;0.25,7.75;1,1;0]
			list[current_player;main;1.25,7.75;1,1;1]
			list[current_player;main;2.25,7.75;1,1;2]
			list[current_player;main;3.25,7.75;1,1;3]
			list[current_player;main;4.25,7.75;1,1;4]
			list[current_player;main;5.25,7.75;1,1;5]
			list[current_player;main;6.25,7.75;1,1;6]
			list[current_player;main;7.25,7.75;1,1;7]
			list[current_player;main;8.25,7.75;1,1;8]
			--inventory
			list[current_player;main;0.25,4.5;1,1;10]
			list[current_player;main;1.25,4.5;1,1;11]
			list[current_player;main;2.25,4.5;1,1;12]
			list[current_player;main;3.25,4.5;1,1;13]
			list[current_player;main;4.25,4.5;1,1;14]
			list[current_player;main;5.25,4.5;1,1;15]
			list[current_player;main;6.25,4.5;1,1;16]
			list[current_player;main;7.25,4.5;1,1;17]
			list[current_player;main;8.25,4.5;1,1;18]
			list[current_player;main;0.25,5.5;1,1;19]
			list[current_player;main;1.25,5.5;1,1;20]
			list[current_player;main;2.25,5.5;1,1;21]
			list[current_player;main;3.25,5.5;1,1;22]
			list[current_player;main;4.25,5.5;1,1;23]
			list[current_player;main;5.25,5.5;1,1;24]
			list[current_player;main;6.25,5.5;1,1;25]
			list[current_player;main;7.25,5.5;1,1;26]
			list[current_player;main;8.25,5.5;1,1;27]
			list[current_player;main;0.25,6.5;1,1;28]
			list[current_player;main;1.25,6.5;1,1;29]
			list[current_player;main;2.25,6.5;1,1;30]
			list[current_player;main;3.25,6.5;1,1;31]
			list[current_player;main;4.25,6.5;1,1;32]
			list[current_player;main;5.25,6.5;1,1;33]
			list[current_player;main;6.25,6.5;1,1;34]
			list[current_player;main;7.25,6.5;1,1;35]
			list[current_player;main;8.25,6.5;1,1;36]
]]