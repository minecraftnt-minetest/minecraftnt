--- Misc. Helper functions


-- Convert the Minecraft Y level to an equivalent Minetest Y level.
function layer_to_y(layer)
	return layer - 62
end

-- Helper function for easier specifying atlas IDs in a similar way to Minecraft.
function atlas_id(tex, id)
	local x = id % 16
	local y = math.floor(id / 16)

	return tex..".png^[sheet:16x16:"..x..","..y
end

function terrain(id)
	return atlas_id("terrain", id)
end