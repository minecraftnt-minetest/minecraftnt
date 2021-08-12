mu = {
	songs = {
		{ name = "calm1",	length = 4*60 + 20 },
		{ name = "calm2",	length = 3*60 + 21 },
		{ name = "calm3",	length = 3*60 + 49 },
		{ name = "piano1",	length = 1*60 + 08 },
		{ name = "piano2",	length = 1*60 + 29 },
		{ name = "piano3",	length = 1*60 + 26 },
	},
	handles = {},
	playing = false,
	id_playing = nil,
	song_time_left = nil,
	time_next = 5 * 60, --sekunder
	id_last_played = nil,
}

minetest.register_globalstep(function(dtime)
	if mu.playing then
		if mu.song_time_left <= 0 then
			mu.stop_song()
			mu.time_next = 5 * 60
		else
			mu.song_time_left = mu.song_time_left - dtime
		end
	elseif mu.time_next then
		if mu.time_next <= 0 then
			mu.next_song()
		else
			mu.time_next = mu.time_next - dtime
		end
	end
end)

mu.play_song = function(id)
	if mu.playing then
		mu.stop_song()
	end
	local song = mu.songs[id]
	if not song then return end
	for _,player in ipairs(minetest.get_connected_players()) do
		local pname = player:get_player_name()
		local handle = minetest.sound_play(song.name, {to_player=pname})
		if handle then
			mu.handles[pname] = handle
		end
	end
	mu.playing = id
	--adding 2 seconds as security
	mu.song_time_left = song.length + 2
end

mu.stop_song = function()
	for pname, handle in pairs(mu.handles) do
		minetest.sound_stop(handle)
	end
	mu.id_last_played = mu.playing
	mu.playing = nil
	mu.handles = {}
	mu.time_next = nil
end

mu.next_song = function()
	local next
	repeat
		next = math.random(1, #mu.songs)
	until #mu.songs == 1 or next ~= mu.id_last_played
	mu.play_song(next)
end
