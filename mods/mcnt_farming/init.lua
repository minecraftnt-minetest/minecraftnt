farming = {}
local plant_lists = {}
local plant_nodename_to_id_list = {}

local function get_intervals_counter(pos, interval, chance)
	local meta = minetest.get_meta(pos)
	local time_speed = tonumber(minetest.settings:get('time_speed') or 72)
	local current_game_time
	if time_speed == nil then
		return 1
	end
	if (time_speed < 0.1) then
		return 1
	end
	local time_multiplier = 86400 / time_speed
	current_game_time = .0 + ((minetest.get_day_count() + minetest.get_timeofday()) * time_multiplier)

	local approx_interval = math.max(interval, 1) * math.max(chance, 1)

	local last_game_time = meta:get_string("last_gametime")
	if last_game_time then
		last_game_time = tonumber(last_game_time)
	end
	if not last_game_time or last_game_time < 1 then
		last_game_time = current_game_time - approx_interval / 10
	elseif last_game_time == current_game_time then
		current_game_time = current_game_time + approx_interval
	end

	local elapsed_game_time = .0 + current_game_time - last_game_time

	meta:set_string("last_gametime", tostring(current_game_time))

	return elapsed_game_time / approx_interval
end

local function get_avg_light_level(pos)
	local node_light = tonumber(minetest.get_node_light(pos) or 0)
	local meta = minetest.get_meta(pos)
	local counter = meta:get_int("avg_light_count")
	local summary = meta:get_int("avg_light_summary")
	if counter > 99 then
		counter = 51
		summary = math.ceil((summary + 0.0) / 2.0)
	else
		counter = counter + 1

	end
	summary = summary + node_light
	meta:set_int("avg_light_count", counter)
	meta:set_int("avg_light_summary", summary)
	return math.ceil((summary + 0.0) / counter)
end

function farming:add_plant(identifier, full_grown, names, interval, chance)
	plant_lists[identifier] = {}
	plant_lists[identifier].full_grown = full_grown
	plant_lists[identifier].names = names
	plant_lists[identifier].interval = interval
	plant_lists[identifier].chance = chance
	minetest.register_abm({
		label = string.format("Farming plant growth (%s)", identifier),
		nodenames = names,
		interval = interval,
		chance = chance,
		action = function(pos, node)
			local low_speed = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "minecraft:farmland_wet"
			farming:grow_plant(identifier, pos, node, false, false, low_speed)
		end,
	})
	for _, nodename in pairs(names) do
		plant_nodename_to_id_list[nodename] = identifier
	end
end

-- Attempts to advance a plant at pos by one or more growth stages (if possible)
-- identifier: Identifier of plant as defined by farming:add_plant
-- pos: Position
-- node: Node table
-- stages: Number of stages to advance (optional, defaults to 1)
-- ignore_light: if true, ignore light requirements for growing

-- Returns true if plant has been grown by 1 or more stages.
-- Returns false if nothing changed.
function farming:grow_plant(identifier, pos, node, stages, ignore_light, low_speed)
	local average_light_level = get_avg_light_level(pos)
	local plant_info = plant_lists[identifier]
	local intervals_counter = get_intervals_counter(pos, plant_info.interval, plant_info.chance)
	local low_speed = low_speed or false
	if low_speed then
		if intervals_counter < 1.01 and math.random(0, 9) > 0 then
			return
		else
			intervals_counter = intervals_counter / 10
		end
	end
	if not minetest.get_node_light(pos) and not ignore_light and intervals_counter < 1.5 then
		return false
	end
	if minetest.get_node_light(pos) < 10 and not ignore_light and intervals_counter < 1.5 then
		return false
	end

	if intervals_counter >= 1.5 then
		if average_light_level < 0.1 then
			return false
		end
		if average_light_level < 10 then
			intervals_counter = intervals_counter * average_light_level / 10
		end
	end

	local step = nil

	for i, name in ipairs(plant_info.names) do
		if name == node.name then
			step = i
			break
		end
	end
	if step == nil then
		return false
	end
	if not stages then
		stages = 1
	end
	stages = stages + math.ceil(intervals_counter)
	local new_node = {name = plant_info.names[step+stages]}
	if new_node.name == nil then
		new_node.name = plant_info.full_grown
	end
	new_node.param = node.param
	new_node.param2 = node.param2
	minetest.set_node(pos, new_node)
	return true
end

function farming:place_seed(itemstack, placer, pointed_thing, plantname)
	local pt = pointed_thing
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	-- Use pointed node's on_rightclick function first, if present
	local node = minetest.get_node(pt.under)
	if placer and not placer:get_player_control().sneak then
		if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
			return minetest.registered_nodes[node.name].on_rightclick(pt.under, node, placer, itemstack) or itemstack
		end
	end

	local pos = {x=pt.above.x, y=pt.above.y-1, z=pt.above.z}
	local farmland = minetest.get_node(pos)
	pos= {x=pt.above.x, y=pt.above.y, z=pt.above.z}
	local place_s = minetest.get_node(pos)

	if string.find(farmland.name, "minecraft:farmland") and string.find(place_s.name, "air")  then
		--minetest.sound_play(minetest.registered_nodes[plantname].sounds.place, {pos = pos}, true)
		minetest.add_node(pos, {name=plantname, param2 = minetest.registered_nodes[plantname].place_param2})
		local intervals_counter = get_intervals_counter(pos, 1, 1)
	else
		return
	end

	if not minetest.is_creative_enabled(placer:get_player_name()) then
		itemstack:take_item()
	end
	return itemstack
end


minetest.register_lbm({
	label = "Add growth for unloaded farming plants",
	name = ":minecraft:farming_growth",
	nodenames = {"group:plant"},
	run_at_every_load = true,
	action = function(pos, node)
		local identifier = plant_nodename_to_id_list[node.name]
		if not identifier then
			return
		end
		local low_speed = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name ~= "minecraft:farmland_wet"
		farming:grow_plant(identifier, pos, node, false, false, low_speed)
	end,
})

dofile(minetest.get_modpath('mcnt_farming')..'/farmland.lua')
dofile(minetest.get_modpath('mcnt_farming')..'/hoes.lua')
dofile(minetest.get_modpath('mcnt_farming')..'/wheat.lua')
