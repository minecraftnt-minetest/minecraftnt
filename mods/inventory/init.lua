--- Inventory and hotbar-related code.

minetest.register_on_joinplayer(function(player)
	player:get_inventory():set_width("main", 9)
	player:get_inventory():set_size("main", 36)
	player:hud_set_hotbar_itemcount(9)

	player:set_inventory_formspec([[
		size[9.5,9]
		real_coordinates[true]
		bgcolor[black;neither]
		listcolors[#ffffff00;#ffffff80]
		style_type[list;spacing=0,0]
		image[0,0;9.5,9;inventory.png]
		list[current_player;armor;0.25,0.25;1,4;0]
		box[1.25,0.25;3,4;black]
		model[1.25,0.25;3,4;playermodel;character.b3d;character.png;0,180;false;false;walk,stand]
		list[current_player;craft;4.75,1.25;2,1;0]
		list[current_player;craft;4.75,2.25;2,1;3]
		list[current_player;craftpreview;7.75,1.75;1,1;0]
		list[current_player;main;0.25,7.75;9,1;0]
		list[current_player;main;0.25,4.5;9,3;9]
	]])

	--local InvRef = ObjectRef:get_inventory()

	--InvRef:set_list("armor", armor)
	--InvRef:set_size("armor", 4)
end)
