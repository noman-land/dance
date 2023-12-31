speed = 6

function butn(n)
	return btn() == n
end

function pressed(s)
	for pos in all(s) do
		if (btn() >> _ENV[pos] & 1 == 0) return
	end
	return true
end

keymap = {
	-- ⬅️
	[1] = 82,
	-- ➡️
	[2] = 82,
	-- ⬆️
	[4] = 69,
	-- ⬇️
	[8] = 101
}

background = {
	draw = function()
		cls(1)
	end
}

try_again = {
	draw = function()
		print("❎ try again", 4, 119, 12)
	end
}

ground = {
	draw = function()
		rectfill(0, 68, 127, 70, 3)
	end
}

-- silhouete guy
sil_guy = {
	x = 0,
	y = 0,
	update = function()
		sil_guy.x = 21 + frame / 10
		sil_guy.y = 20 + frame / 10
	end,
	draw = function()
		spr(69, sil_guy.x, sil_guy.y, 1, 1)
	end
}

dance_guy = {
	flipped = false,
	x = 0,
	y = 0,
	update = function()
		dance_guy.flipped = pressed "➡️"
		dance_guy.x = 64 - 3 - (dance_guy.flipped and 1 or 0)
		dance_guy.y = 64 - 4
	end,
	draw = function()
		spr(
			dance_guy.sprs[btn()],
			dance_guy.x,
			dance_guy.y,
			1,
			1,
			dance_guy.flipped
		)
	end,
	sprs = {
		-- neutral
		[0] = 21,
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

reload = {
	check = function()
		if (pressed "❎") run()
	end
}

complete = {
	level_won = false,
	check = function()
		local winning_move = butn(4)
		local moment_of_overlap = flr(sil_guy.y) == dance_guy.y
		if winning_move and moment_of_overlap then
			-- flash screen
			cls(14)
			complete.level_won = true
		end
	end,
	draw = function()
		if complete.level_won then
			print('great job!', 20, 40, 14)
			print('score: 1', 20, 47, 14)
			return
		end
		local is_over = sil_guy.y > dance_guy.y
		if is_over then
			print('bad job :(', 70, 40, 8)
			print('score: 0', 70, 47, 8)
		end
	end
}

function _init()
	frame = 0
end

-- function walk()
-- 	local id = 16
-- 	if btn() == 0 then
-- 		id = dance_guy.spr[0]
-- 	elseif flr(frame / (speed / 2)) % 2 == 0 then
-- 		id = 32
-- 	end
-- 	spr(id, dance_guy.x, dance_guy.y, 1, 1, dance_guy.flipped)
-- end

function _update()
	frame = frame + 1 + speed
	sil_guy.update()
	dance_guy.update()
	complete.check()
	reload.check()
end

function _draw()
	background.draw()
	sil_guy.draw()
	ground.draw()
	dance_guy.draw()
	complete.draw()
	try_again.draw()
end