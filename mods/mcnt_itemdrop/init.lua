local load_time_start = minetest.get_us_time()

local function can_pickup(entity, player)
	if entity.item_drop_picked then
		return false
	end
	return true
end

local pickup_radius = 1

minetest.registered_entities["__builtin:item"].pointable = false

-- tells whether an inventorycube should be shown as pickup_particle or not
-- for known drawtypes
local inventorycube_drawtypes = {
	normal = true,
	allfaces = true,
	allfaces_optional = true,
	glasslike = true,
	glasslike_framed = true,
	glasslike_framed_optional = true,
	liquid = true,
	flowingliquid = true,
}

-- adds the item to the inventory and removes the object
local function collect_item(ent, pos, player)
	minetest.sound_play("pop", {
		pos = pos,
		gain = 0.2,
		pitch = math.random(8,12) / 10
	})

	ent:on_punch(player)
	ent.item_drop_picked = true
end

-- opt_get_ent gets the object's luaentity if it can be collected
local opt_get_ent
function opt_get_ent(object)
	if object:is_player() then
		return
	end
	local ent = object:get_luaentity()
	if not ent
	or ent.name ~= "__builtin:item"
	or (ent.dropped_by and ent.age < 0.5)
	or ent.itemstring == "" then
		return
	end
	return ent
end

-- tests if the player has the keys pressed to enable item picking
local function has_keys_pressed(player)
	return true
end

local function is_inside_map(pos)
	local bound = 31000
	return -bound < pos.x and pos.x < bound
		and -bound < pos.y and pos.y < bound
		and -bound < pos.z and pos.z < bound
end

-- called for each player to possibly collect an item, returns true if so
local function pickupfunc(player)
	if not has_keys_pressed(player)
	or not minetest.get_player_privs(player:get_player_name()).interact
	or player:get_hp() <= 0 then
		return
	end

	local pos = player:get_pos()
	if not is_inside_map(pos) then
		-- get_objects_inside_radius crashes for too far positions
		return
	end
	pos.y = pos.y+0.5
	local inv = player:get_inventory()

	local objectlist = minetest.get_objects_inside_radius(pos, pickup_radius)
	for i = 1,#objectlist do
		local object = objectlist[i]
		local ent = opt_get_ent(object)
		if ent and can_pickup(ent, player) then
			local item = ItemStack(ent.itemstring)
			if inv:room_for_item("main", item) then
				local flying_item
				local pos2
				if not flying_item then
					-- The item is near enough to pick it
					collect_item(ent, pos, player)
					-- Collect one item at a time to avoid the loud pop
					return true
				end
			end
		end
	end
end

local function pickup_step()
	local got_item
	local players = minetest.get_connected_players()
	for i = 1,#players do
		got_item = got_item or pickupfunc(players[i])
	end
	-- lower step if takeable item(s) were found
	local time
	if got_item then
		time = 0.02
	else
		time = 0.2
	end
	minetest.after(time, pickup_step)
end
minetest.after(3.0, pickup_step)

if not minetest.settings:get_bool("creative_mode") then
	-- Workaround to test if an item metadata (ItemStackMetaRef) is empty
	local function itemmeta_is_empty(meta)
		local t = meta:to_table()
		for k, v in pairs(t) do
			if k ~= "fields" then
				return false
			end
			assert(type(v) == "table")
			if next(v) ~= nil then
				return false
			end
		end
		return true
	end

	-- Tests if the item has special information such as metadata
	local function can_split_item(item)
		return item:get_wear() == 0 and itemmeta_is_empty(item:get_meta())
	end

	local function spawn_items(pos, items_to_spawn)
		for i = 1,#items_to_spawn do
			local obj = minetest.add_item(pos, items_to_spawn[i])
			if not obj then
				error("Couldn't spawn item " .. name .. ", drops: "
					.. dump(drops))
			end

			local vel = obj:get_velocity()
			local x = math.random(-5, 4)
			if x >= 0 then
				x = x+1
			end
			vel.x = 1 / x
			local z = math.random(-5, 4)
			if z >= 0 then
				z = z+1
			end
			vel.z = 1 / z
			obj:set_velocity(vel)
		end
	end

	local old_handle_node_drops = minetest.handle_node_drops
	function minetest.handle_node_drops(pos, drops, player)
		if not player or player.is_fake_player then
			-- Node Breaker or similar machines should receive items in the
			-- inventory
			return old_handle_node_drops(pos, drops, player)
		end
		for i = 1,#drops do
			local item = drops[i]
			if type(item) == "string" then
				-- The string is not necessarily only the item name,
				-- so always convert it to ItemStack
				item = ItemStack(item)
			end
			local count = item:get_count()
			local name = item:get_name()

			-- Sometimes nothing should be dropped
			if name == ""
			or not minetest.registered_items[name] then
				count = 0
			end

			if count > 0 then
				-- Split items if possible
				local items_to_spawn = {item}
				if can_split_item(item) then
					for i = 1,count do
						items_to_spawn[i] = name
					end
				end

				spawn_items(pos, items_to_spawn)
			end
		end
	end
end
