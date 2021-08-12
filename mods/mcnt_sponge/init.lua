
minetest.register_node(":minecraft:sponge", {
	description = "Sponge",
	tiles = { terrain(48) },
	groups = { crumbly = 3 },
	on_construct = function(pos)
		sponge_behavior(pos)
	end,
	sounds = block_sound('grass')
})

minetest.register_abm({
	label = "Cool sponge thingies!",
	nodenames = {"minecraft:sponge"},
	interval = 0.5,
	chance = 1,
	catch_up = true,
	action = function(pos, node, active_object_count, active_object_count_wider)
		sponge_behavior(pos)
	end
})

function sponge_behavior(pos)
	range = 2
	for x = -range,range,1 do
		for y = -range,range,1 do
			for z = -range,range,1 do
				checkpos = { x = pos.x + x, y = pos.y + y, z = pos.z + z }
				nodename = minetest.get_node(checkpos).name
				if nodename == "minecraft:water_source" or nodename == "minecraft:water_flowing" then
					minetest.remove_node(checkpos)
				end
			end
		end
	end
end
