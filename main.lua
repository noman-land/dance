speed = 6
winning_move = 4

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

function _init()
	frame = 0
end

function _update()
	frame = frame + 1 + speed
	sil_guy:update()
	dance_guy:update()
	complete:check(winning_move)
	reload:check()
end

function _draw()
	background:draw()
	sil_guy:draw()
	ground:draw()
	dance_guy:draw()
	complete:draw()
	try_again:draw()
end