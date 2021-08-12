
local small_name = "minecraft:chest"
local left_name = "minecraft:doublechest_left"
local right_name = "minecraft:doublechest_right"

-- Returns position of the neighbor of a double chest node
-- or nil if node is invalid.
-- This function assumes that the large chest is actually intact
-- * pos: Position of the node to investigate
-- * param2: param2 of that node
-- * side: Which "half" the investigated node is. "left" or "right"
function get_double_container_neighbor_pos(pos, param2, side)
	if side == "right" then
		if param2 == 0 then
			return {x=pos.x-1, y=pos.y, z=pos.z}
		elseif param2 == 1 then
			return {x=pos.x, y=pos.y, z=pos.z+1}
		elseif param2 == 2 then
			return {x=pos.x+1, y=pos.y, z=pos.z}
		elseif param2 == 3 then
			return {x=pos.x, y=pos.y, z=pos.z-1}
		end
	else
		if param2 == 0 then
			return {x=pos.x+1, y=pos.y, z=pos.z}
		elseif param2 == 1 then
			return {x=pos.x, y=pos.y, z=pos.z-1}
		elseif param2 == 2 then
			return {x=pos.x-1, y=pos.y, z=pos.z}
		elseif param2 == 3 then
			return {x=pos.x, y=pos.y, z=pos.z+1}
		end
	end
end

--[[ List of open chests.
Key: Player name
Value:
	If player is using a chest: { pos = <chest node position> }
	Otherwise: nil ]]
local open_chests = {}

-- To be called if a player opened a chest
local player_chest_open = function(player, pos, node_name, param2, double, mesh)
	local name = player:get_player_name()
	open_chests[name] = {pos = pos, node_name = node_name, param2 = param2, double = double, mesh = mesh}
end

-- To be called if a player closed a chest
local player_chest_close = function(player)
	local name = player:get_player_name()
	local open_chest = open_chests[name]
	if open_chest == nil then
		return
	end

	open_chests[name] = nil
end

-- This is a helper function to register both chests and trapped chests. Trapped chests will make use of the additional parameters
local double_chest_add_item = function(top_inv, bottom_inv, listname, stack)
	if not stack or stack:is_empty() then
		return
	end

	local name = stack:get_name()

	local top_off = function(inv, stack)
		for c, chest_stack in ipairs(inv:get_list(listname)) do
			if stack:is_empty() then
				break
			end

			if chest_stack:get_name() == name and chest_stack:get_free_space() > 0 then
				stack = chest_stack:add_item(stack)
				inv:set_stack(listname, c, chest_stack)
			end
		end

		return stack
	end

	stack = top_off(top_inv, stack)
	stack = top_off(bottom_inv, stack)

	if not stack:is_empty() then
		stack = top_inv:add_item(listname, stack)
		if not stack:is_empty() then
			bottom_inv:add_item(listname, stack)
		end
	end
end

local drop_items_chest = function(pos, oldnode, oldmetadata)
	local meta = minetest.get_meta(pos)
	local meta2 = meta
	if oldmetadata then
		meta:from_table(oldmetadata)
	end
	local inv = meta:get_inventory()
	for i=1,inv:get_size("main") do
		local stack = inv:get_stack("main", i)
		if not stack:is_empty() then
			local p = {x=pos.x+math.random(0, 10)/10-0.5, y=pos.y, z=pos.z+math.random(0, 10)/10-0.5}
			minetest.add_item(p, stack)
		end
	end
	meta:from_table(meta2:to_table())
end

local on_chest_blast = function(pos)
	local node = minetest.get_node(pos)
	drop_items_chest(pos, node)
	minetest.remove_node(pos)
end

local function limit_put_list(stack, list)
	for _, other in ipairs(list) do
		stack = other:add_item(stack)
		if stack:is_empty() then
			break
		end
	end
	return stack
end

local function limit_put(stack, inv1, inv2)
	local leftover = ItemStack(stack)
	leftover = limit_put_list(leftover, inv1:get_list("main"))
	leftover = limit_put_list(leftover, inv2:get_list("main"))
	return stack:get_count() - leftover:get_count()
end

local function close_forms(pos)
	local players = minetest.get_connected_players()
	for p=1, #players do
		if vector.distance(players[p]:get_pos(), pos) <= 30 then
			minetest.close_formspec(players[p]:get_player_name(), "mcl_chests:chest_"..pos.x.."_"..pos.y.."_"..pos.z)
		end
	end
end

minetest.register_node(":"..small_name, {
	description = "Chest",
	tiles = {
		terrain(25),
		terrain(25),
		terrain(26),
		terrain(26),
		terrain(26),
		terrain(27),
	},
	paramtype = "light",
	paramtype2 = "facedir",
	stack_max = 64,
	drop = small_name,
	groups = {handy=1,axey=1, container=2, deco_block=1, material_wood=1,flammable=-1,not_in_creative_inventory=1,choppy=2},

	sounds = block_sound('wood'),

	is_ground_content = false,
	on_construct = function(pos)
		local param2 = minetest.get_node(pos).param2
		local meta = minetest.get_meta(pos)
		--[[ This is a workaround for Minetest issue 5894
		<https://github.com/minetest/minetest/issues/5894>.
		Apparently if we don't do this, large chests initially don't work when
		placed at chunk borders, and some chests randomly don't work after
		placing. ]]
		-- FIXME: Remove this workaround when the bug has been fixed.
		-- BEGIN OF WORKAROUND --
		meta:set_string("workaround", "ignore_me")
		meta:set_string("workaround", nil) -- Done to keep metadata clean
		-- END OF WORKAROUND --
		local inv = meta:get_inventory()
		inv:set_size("main", 9*3)
		--[[ The "input" list is *another* workaround (hahahaha!) around the fact that Minetest
		does not support listrings to put items into an alternative list if the first one
		happens to be full. See <https://github.com/minetest/minetest/issues/5343>.
		This list is a hidden input-only list and immediately puts items into the appropriate chest.
		It is only used for listrings and hoppers. This workaround is not that bad because it only
		requires a simple “inventory allows” check for large chests.]]
		-- FIXME: Refactor the listrings as soon Minetest supports alternative listrings
		-- BEGIN OF LISTRING WORKAROUND
		inv:set_size("input", 1)
		-- END OF LISTRING WORKAROUND
		if minetest.get_node(get_double_container_neighbor_pos(pos, param2, "right")).name == small_name then
			minetest.swap_node(pos, {name=right_name,param2=param2})
			local p = get_double_container_neighbor_pos(pos, param2, "right")
			minetest.swap_node(p, { name = left_name, param2 = param2 })
		elseif minetest.get_node(get_double_container_neighbor_pos(pos, param2, "left")).name == small_name then
			minetest.swap_node(pos, {name=left_name,param2=param2})
			local p = get_double_container_neighbor_pos(pos, param2, "left")
			minetest.swap_node(p, { name = right_name, param2 = param2 })
		else
			minetest.swap_node(pos, { name = small_name, param2 = param2 })
		end
	end,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		minetest.get_meta(pos):set_string("name", itemstack:get_meta():get_string("name"))
	end,
	after_dig_node = drop_items_chest,
	on_blast = on_chest_blast,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
		-- BEGIN OF LISTRING WORKAROUND
		if listname == "input" then
			local inv = minetest.get_inventory({type="node", pos=pos})
			inv:add_item("main", stack)
		end
		-- END OF LISTRING WORKAROUND
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,

	on_rightclick = function(pos, node, clicker)
		if minetest.registered_nodes[minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name].groups.opaque == 1 then
			-- won't open if there is no space from the top
			return false
		end

		minetest.show_formspec(clicker:get_player_name(),
		"mcl_chests:chest_"..pos.x.."_"..pos.y.."_"..pos.z,
		"size[9.5,8.25]"..
		"real_coordinates[true]"..
		"bgcolor[black;neither]"..
		"image[0,0;9.5,8.25;chest1.png]"..
		"listcolors[#ffffff00;#ffffff80]"..
		"style_type[list;spacing=0,0]"..
		"list[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main;0.25,0.25;9,3;]"..
		"list[current_player;main;0.25,3.75;9,3;9]"..
		"list[current_player;main;0.25,7;9,1;]"..
		"listring[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main]"..
		"listring[current_player;main]")

		player_chest_open(clicker, pos, small_name, node.param2, false)
	end,

	on_destruct = function(pos)
		close_forms(pos)
	end,
})

minetest.register_node(":"..left_name, {
	tiles = {
		terrain(25),
		terrain(25),
		terrain(26),
		terrain(26),
		terrain(58),
		terrain(41),
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {handy=1,axey=1, container=5,not_in_creative_inventory=1, material_wood=1,flammable=-1,double_chest=1,choppy=2},
	drop = small_name,
	is_ground_content = false,
	sounds = block_sound('wood'),
	on_construct = function(pos)
		local n = minetest.get_node(pos)
		local param2 = n.param2
		local p = get_double_container_neighbor_pos(pos, param2, "left")
		if not p or minetest.get_node(p).name ~= right_name then
			n.name = small_name
			minetest.swap_node(pos, n)
		end
	end,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		minetest.get_meta(pos):set_string("name", itemstack:get_meta():get_string("name"))
	end,
	on_destruct = function(pos)
		local n = minetest.get_node(pos)
		if n.name == small_name then
			return
		end

		close_forms(pos)

		local param2 = n.param2
		local p = get_double_container_neighbor_pos(pos, param2, "left")
		if not p or minetest.get_node(p).name ~= right_name then
			return
		end
		close_forms(p)

		minetest.swap_node(p, { name = small_name, param2 = param2 })
	end,
	after_dig_node = drop_items_chest,
	on_blast = on_chest_blast,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		-- BEGIN OF LISTRING WORKAROUND
		if listname == "input" then
			local inv = minetest.get_inventory({type="node", pos=pos})
			local other_pos = get_double_container_neighbor_pos(pos, minetest.get_node(pos).param2, "left")
			local other_inv = minetest.get_inventory({type="node", pos=other_pos})
			return limit_put(stack, inv, other_inv)
		-- END OF LISTRING WORKAROUND
		else
			return stack:get_count()
		end
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
		-- BEGIN OF LISTRING WORKAROUND
		if listname == "input" then
			local inv = minetest.get_inventory({type="node", pos=pos})
			local other_pos = get_double_container_neighbor_pos(pos, minetest.get_node(pos).param2, "left")
			local other_inv = minetest.get_inventory({type="node", pos=other_pos})

			inv:set_stack("input", 1, nil)

			double_chest_add_item(inv, other_inv, "main", stack)
		end
		-- END OF LISTRING WORKAROUND
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
	_mcl_blast_resistance = 2.5,
	_mcl_hardness = 2.5,

	on_rightclick = function(pos, node, clicker)
		local pos_other = get_double_container_neighbor_pos(pos, node.param2, "left")
		if minetest.registered_nodes[minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name].groups.opaque == 1
			or minetest.registered_nodes[minetest.get_node({x = pos_other.x, y = pos_other.y + 1, z = pos_other.z}).name].groups.opaque == 1 then
				-- won't open if there is no space from the top
				return false
		end

		minetest.show_formspec(clicker:get_player_name(),
		"mcl_chests:chest_"..pos.x.."_"..pos.y.."_"..pos.z,
		"size[9.5,11.25]"..
		"real_coordinates[true]"..
		"bgcolor[black;neither]"..
		"image[0,0;9.5,11.25;chest2.png]"..
		"listcolors[#ffffff00;#ffffff80]"..
		"style_type[list;spacing=0,0]"..
		"list[nodemeta:"..pos_other.x..","..pos_other.y..","..pos_other.z..";main;0.25,0.25;9,3;]"..
		"list[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main;0.25,3.25;9,3;]"..
		"list[current_player;main;0.25,6.75;9,3;9]"..
		"list[current_player;main;0.25,10;9,1;]"..
		-- BEGIN OF LISTRING WORKAROUND
		"listring[current_player;main]"..
		"listring[nodemeta:"..pos.x..","..pos.y..","..pos.z..";input]"..
		-- END OF LISTRING WORKAROUND
		"listring[current_player;main]"..
		"listring[nodemeta:"..pos_other.x..","..pos_other.y..","..pos_other.z..";main]"..
		"listring[current_player;main]"..
		"listring[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main]")

		player_chest_open(clicker, pos, left_name, node.param2, true)
	end,
})

minetest.register_node(":"..right_name, {
	tiles = {
		terrain(25),
		terrain(25),
		terrain(26),
		terrain(26),
		terrain(57),
		terrain(42)
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {handy=1,axey=1, container=6,not_in_creative_inventory=1, material_wood=1,flammable=-1,double_chest=2,choppy=2},
	drop = small_name,
	is_ground_content = false,
	on_construct = function(pos)
		local n = minetest.get_node(pos)
		local param2 = n.param2
		local p = get_double_container_neighbor_pos(pos, param2, "right")
		if not p or minetest.get_node(p).name ~= left_name then
			n.name = small_name
			minetest.swap_node(pos, n)
		end
	end,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		minetest.get_meta(pos):set_string("name", itemstack:get_meta():get_string("name"))
	end,
	on_destruct = function(pos)
		local n = minetest.get_node(pos)
		if n.name == small_name then
			return
		end

		close_forms(pos)

		local param2 = n.param2
		local p = get_double_container_neighbor_pos(pos, param2, "right")
		if not p or minetest.get_node(p).name ~= left_name then
			return
		end
		close_forms(p)

		minetest.swap_node(p, { name = small_name, param2 = param2 })
		local meta = minetest.get_meta(pos)
	end,
	after_dig_node = drop_items_chest,
	on_blast = on_chest_blast,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		-- BEGIN OF LISTRING WORKAROUND
		if listname == "input" then
			local other_pos = get_double_container_neighbor_pos(pos, minetest.get_node(pos).param2, "right")
			local other_inv = minetest.get_inventory({type="node", pos=other_pos})
			local inv = minetest.get_inventory({type="node", pos=pos})
			return limit_put(stack, other_inv, inv)
		-- END OF LISTRING WORKAROUND
		else
			return stack:get_count()
		end
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
		-- BEGIN OF LISTRING WORKAROUND
		if listname == "input" then
			local other_pos = get_double_container_neighbor_pos(pos, minetest.get_node(pos).param2, "right")
			local other_inv = minetest.get_inventory({type="node", pos=other_pos})
			local inv = minetest.get_inventory({type="node", pos=pos})

			inv:set_stack("input", 1, nil)

			double_chest_add_item(other_inv, inv, "main", stack)
		end
		-- END OF LISTRING WORKAROUND
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
	_mcl_blast_resistance = 2.5,
	_mcl_hardness = 2.5,

	on_rightclick = function(pos, node, clicker)
		local pos_other = get_double_container_neighbor_pos(pos, node.param2, "right")
		if minetest.registered_nodes[minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name].groups.opaque == 1
			or minetest.registered_nodes[minetest.get_node({x = pos_other.x, y = pos_other.y + 1, z = pos_other.z}).name].groups.opaque == 1 then
				-- won't open if there is no space from the top
				return false
		end

		minetest.show_formspec(clicker:get_player_name(),
		"mcl_chests:chest_"..pos.x.."_"..pos.y.."_"..pos.z,
		"size[9.5,11.25]"..
		"real_coordinates[true]"..
		"bgcolor[black;neither]"..
		"image[0,0;9.5,11.25;chest2.png]"..
		"listcolors[#ffffff00;#ffffff80]"..
		"style_type[list;spacing=0,0]"..
		"list[nodemeta:"..pos_other.x..","..pos_other.y..","..pos_other.z..";main;0.25,0.25;9,3;]"..
		"list[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main;0.25,3.25;9,3;]"..
		"list[current_player;main;0.25,6.75;9,3;9]"..
		"list[current_player;main;0.25,10;9,1;]"..
		-- BEGIN OF LISTRING WORKAROUND
		"listring[current_player;main]"..
		"listring[nodemeta:"..pos.x..","..pos.y..","..pos.z..";input]"..
		-- END OF LISTRING WORKAROUND
		"listring[current_player;main]"..
		"listring[nodemeta:"..pos_other.x..","..pos_other.y..","..pos_other.z..";main]"..
		"listring[current_player;main]"..
		"listring[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main]")

		player_chest_open(clicker, pos_other, left_name, node.param2, true)
	end,
})

-- Disable chest when it has been closed
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname:find("mcl_chests:") == 1 then
		if fields.quit then
			player_chest_close(player)
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	player_chest_close(player)
end)

minetest.register_craft({
	output = "minecraft:chest",
	recipe = {
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
		{"minecraft:plank", "", "minecraft:plank"},
		{"minecraft:plank", "minecraft:plank", "minecraft:plank"},
	}
})
