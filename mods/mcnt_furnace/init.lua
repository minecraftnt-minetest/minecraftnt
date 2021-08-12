--
-- Formspecs
--

function get_furnace_active_formspec(fuel_percent, item_percent)
	return
	"size[9.5,9]"..
	"real_coordinates[true]"..
	"bgcolor[black;neither]"..
	"listcolors[#ffffff00;#ffffff80]"..
	"style_type[list;spacing=0,0]"..
	"image[0,0;9.5,9;mcnt_furnace.png]"..
	"list[current_player;main;0.25,7.75;9,1;0]"..
	"list[current_player;main;0.25,4.5;9,3;9]"..
	"list[context;src;2.75,0.75;1,1;0]"..
	"list[context;fuel;2.75,2.75;1,1;0]"..
	"list[context;dst;6.25,1.75;1,1;0]"..
	"image[2.75,1.75;1,1;mcnt_furnace_fire_bg.png^[lowpart:"..
	(fuel_percent)..":mcnt_furnace_fire.png]"..
	"image[4,1.75;1.75,1;mcnt_furnace_arrow_bg.png^[lowpart:"..
	(item_percent)..":mcnt_furnace_arrow.png^[transformR270]"..
	"listring[context;dst]"..
	"listring[current_player;main]"..
	"listring[context;src]"..
	"listring[current_player;main]"..
	"listring[context;fuel]"..
	"listring[current_player;main]"
end

function get_furnace_inactive_formspec()
	return
	"size[9.5,9]"..
	"real_coordinates[true]"..
	"bgcolor[black;neither]"..
	"listcolors[#ffffff00;#ffffff80]"..
	"style_type[list;spacing=0,0]"..
	"image[0,0;9.5,9;mcnt_furnace.png]"..
	"list[current_player;main;0.25,7.75;9,1;0]"..
	"list[current_player;main;0.25,4.5;9,3;9]"..
	"list[context;src;2.75,0.75;1,1;0]"..
	"list[context;fuel;2.75,2.75;1,1;0]"..
	"list[context;dst;6.25,1.75;1,1;0]"..
	"image[2.75,1.75;1,1;mcnt_furnace_fire_bg.png]"..
	"image[4,1.75;1.75,1;mcnt_furnace_arrow_bg.png^[transformR270]"..
	"listring[context;dst]"..
	"listring[current_player;main]"..
	"listring[context;src]"..
	"listring[current_player;main]"..
	"listring[context;fuel]"..
	"listring[current_player;main]"
end

--
-- Node callback functions that are the same for active and inactive furnace
--

local function can_dig(pos, player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	return inv:is_empty("fuel") and inv:is_empty("dst") and inv:is_empty("src")
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "fuel" then
		if minetest.get_craft_result({method="fuel", width=1, items={stack}}).time ~= 0 then
			if inv:is_empty("src") then
				meta:set_string("infotext", "Furnace is empty")
			end
			return stack:get_count()
		else
			return 0
		end
	elseif listname == "src" then
		return stack:get_count()
	elseif listname == "dst" then
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local stack = inv:get_stack(from_list, from_index)
	return allow_metadata_inventory_put(pos, to_list, to_index, stack, player)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if minetest.is_protected(pos, player:get_player_name()) then
		return 0
	end
	return stack:get_count()
end

local function swap_node(pos, name)
	local node = minetest.get_node(pos)
	if node.name == name then
		return
	end
	node.name = name
	minetest.swap_node(pos, node)
end

local function furnace_node_timer(pos, elapsed)
	--
	-- Initialize metadata
	--
	local meta = minetest.get_meta(pos)
	local fuel_time = meta:get_float("fuel_time") or 0
	local src_time = meta:get_float("src_time") or 0
	local fuel_totaltime = meta:get_float("fuel_totaltime") or 0

	local inv = meta:get_inventory()
	local srclist, fuellist
	local dst_full = false

	local timer_elapsed = meta:get_int("timer_elapsed") or 0
	meta:set_int("timer_elapsed", timer_elapsed + 1)

	local cookable, cooked
	local fuel

	local update = true
	while elapsed > 0 and update do
		update = false

		srclist = inv:get_list("src")
		fuellist = inv:get_list("fuel")

		--
		-- Cooking
		--

		-- Check if we have cookable content
		local aftercooked
		cooked, aftercooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		cookable = cooked.time ~= 0

		local el = math.min(elapsed, fuel_totaltime - fuel_time)
		if cookable then -- fuel lasts long enough, adjust el to cooking duration
			el = math.min(el, cooked.time - src_time)
		end

		-- Check if we have enough fuel to burn
		if fuel_time < fuel_totaltime then
			-- The furnace is currently active and has enough fuel
			fuel_time = fuel_time + el
			-- If there is a cookable item then check if it is ready yet
			if cookable then
				src_time = src_time + el
				if src_time >= cooked.time then
					-- Place result in dst list if possible
					if inv:room_for_item("dst", cooked.item) then
						inv:add_item("dst", cooked.item)
						inv:set_stack("src", 1, aftercooked.items[1])
						src_time = src_time - cooked.time
						update = true
					else
						dst_full = true
					end
					-- Play cooling sound
					minetest.sound_play("default_cool_lava",
						{pos = pos, max_hear_distance = 16, gain = 0.1}, true)
				else
					-- Item could not be cooked: probably missing fuel
					update = true
				end
			end
		else
			-- Furnace ran out of fuel
			if cookable then
				-- We need to get new fuel
				local afterfuel
				fuel, afterfuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})

				if fuel.time == 0 then
					-- No valid fuel in fuel list
					fuel_totaltime = 0
					src_time = 0
				else
					-- Take fuel from fuel list
					inv:set_stack("fuel", 1, afterfuel.items[1])
					-- Put replacements in dst list or drop them on the furnace.
					local replacements = fuel.replacements
					if replacements[1] then
						local leftover = inv:add_item("dst", replacements[1])
						if not leftover:is_empty() then
							local above = vector.new(pos.x, pos.y + 1, pos.z)
							local drop_pos = minetest.find_node_near(above, 1, {"air"}) or above
							minetest.item_drop(replacements[1], nil, drop_pos)
						end
					end
					update = true
					fuel_totaltime = fuel.time + (fuel_totaltime - fuel_time)
				end
			else
				-- We don't need to get new fuel since there is no cookable item
				fuel_totaltime = 0
				src_time = 0
			end
			fuel_time = 0
		end

		elapsed = elapsed - el
	end

	if fuel and fuel_totaltime > fuel.time then
		fuel_totaltime = fuel.time
	end
	if srclist and srclist[1]:is_empty() then
		src_time = 0
	end

	--
	-- Update formspec, infotext and node
	--
	local formspec
	local item_state
	local item_percent = 0
	if cookable then
		item_percent = math.floor(src_time / cooked.time * 100)
		if dst_full then
			item_state = "100% (output full)"
		else
			item_state = "@1%", item_percent
		end
	else
		if srclist and not srclist[1]:is_empty() then
			item_state = "Not cookable"
		else
			item_state = "Empty"
		end
	end

	local fuel_state = "Empty"
	local active = false
	local result = false

	if fuel_totaltime ~= 0 then
		active = true
		local fuel_percent = 100 - math.floor(fuel_time / fuel_totaltime * 100)
		fuel_state = "@1%", fuel_percent
		formspec = get_furnace_active_formspec(fuel_percent, item_percent)
		swap_node(pos, "minecraft:lit_furnace")
		-- make sure timer restarts automatically
		result = true

		-- Play sound every 5 seconds while the furnace is active
		if timer_elapsed == 0 or (timer_elapsed+1) % 5 == 0 then
			minetest.sound_play("default_furnace_active",
				{pos = pos, max_hear_distance = 16, gain = 0.5}, true)
		end
	else
		if fuellist and not fuellist[1]:is_empty() then
			fuel_state = "@1%", 0
		end
		formspec = get_furnace_inactive_formspec()
		swap_node(pos, "minecraft:furnace")
		-- stop timer on the inactive furnace
		minetest.get_node_timer(pos):stop()
		meta:set_int("timer_elapsed", 0)
	end


	local infotext
	if active then
		infotext = "Furnace active"
	else
		infotext = "Furnace inactive"
	end
	infotext = infotext .. "\n" .. "(Item: @1; Fuel: @2)", item_state, fuel_state

	--
	-- Set meta values
	--
	meta:set_float("fuel_totaltime", fuel_totaltime)
	meta:set_float("fuel_time", fuel_time)
	meta:set_float("src_time", src_time)
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", infotext)

	return result
end

--
-- Node definitions
--

minetest.register_node(":minecraft:furnace", {
	description = "Furnace",
	tiles = {
		terrain(1),
		terrain(1),
		terrain(45),
		terrain(45),
		terrain(45),
		terrain(44),
	},
	paramtype2 = "facedir",
	groups = {cracky=3},
	is_ground_content = false,
	on_timer = furnace_node_timer,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('fuel', 1)
		inv:set_size('dst', 1)
		furnace_node_timer(pos, 0)
	end,
	on_metadata_inventory_move = function(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_take = function(pos)
		-- check whether the furnace is empty or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_blast = function(pos)
		local drops = {}
		get_inventory_drops(pos, "src", drops)
		get_inventory_drops(pos, "fuel", drops)
		get_inventory_drops(pos, "dst", drops)
		drops[#drops+1] = "minecraft:furnace"
		minetest.remove_node(pos)
		return drops
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
	sounds = block_sound('stone')
})

minetest.register_node(":minecraft:lit_furnace", {
	description = "Furnace",
	tiles = {
		terrain(1),
		terrain(1),
		terrain(45),
		terrain(45),
		terrain(45),
		terrain(61),
	},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "minecraft:furnace",
	groups = { cracky = 3 },
	is_ground_content = false,
	on_timer = furnace_node_timer,
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
	sounds = block_sound('stone')
})

dofile(minetest.get_modpath('mcnt_furnace').."/recipes.lua")
