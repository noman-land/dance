neutral = 21
speed = 6
complete = false

function butn(t, n)
	return band(t, n) == n
end

function pressed(s)
	for pos in all(s) do
		if (btn() >> _ENV[pos] & 1 == 0) return
	end
	return true
end

function _init()
	frame = 0
	dude = {
		flipped = false,
		x = 63,
		y = 63,
		dir = 0,
		sprs = {
			[0] = neutral,
			-- ⬅️
			[1] = 18,
			-- ➡️
			[2] = 18,
			-- ⬆️
			[4] = 5,
			-- ⬇️
			[8] = 37,
			-- ⬅️⬆️
			[5] = 2,
			-- ➡️⬆️
			[6] = 2,
			-- ⬅️⬇️
			[9] = 35,
			-- ⬅️⬇️
			[10] = 35,
			-- ⬇️⬅️➡️
			[11] = 37,
			-- ⬆️⬅️➡️
			[7] = 5,
			-- ⬅️⬆️⬇️
			[13] = 18,
			-- ➡️⬆️⬇️
			[14] = 18
		}
	}
end

function walk()
	local id = 16
	if dude.dir == 0 then
		id = neutral
	elseif flr(frame / (speed / 2)) % 2 == 0 then
		id = 32
	end
	spr(id, dude.x, dude.y, 1, 1, dude.flipped)
end

function _update()
	frame = frame + 1 + speed
	dude.dir = btn()
	dude.flipped = butn(dude.dir, 2)

	-- if(butn(dude.dir,1)) dude.x-=1
	-- if(butn(dude.dir,2)) dude.x+=1
	-- if(butn(dude.dir,4)) dude.y-=1
	-- if(butn(dude.dir,8)) dude.y+=1
end

function _draw()
	cls(1)
	-- floor
	line(0, 68, 127, 68, 3)
	sframeCoord = 20 + frame / 10
	danceGuyCoordX = 64 - 3 - (dude.flipped and 1 or 0)
	danceGuyCoordY = 64 - 4
	-- flash screen
	if pressed "⬆️" and flr(sframeCoord) == danceGuyCoordY then
		cls(14)
		complete = true
	end
	if complete then
		print('great job!', 20, 40, 14)
	elseif sframeCoord > danceGuyCoordY then
		print('bad job :(', 70, 40, 8)
	end
	-- silhouete guy
	spr(69, sframeCoord, sframeCoord, 1, 1)
	-- dance guy
	spr(
		dude.sprs[dude.dir] or neutral,
		danceGuyCoordX,
		danceGuyCoordY,
		1,
		1,
		dude.flipped
	)
end