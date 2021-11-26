
-- Returns a table with sounds for the given material.
function block_sound(material)
	-- TODO: metal sounds
	if material == "metal" then
		material = "stone"
	end

	local table = {
		footstep = {
			name = material,
			gain = 1.0
		},
		dig = {
			name = material,
			gain = 1.0
		},
		dug = {
			name = material,
			gain = 1.0
		},
		place = {
			name = material,
			gain = 1.0
		}
	}

	return table
end