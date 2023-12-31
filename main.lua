function _init()
	frame = 0
end

function _update60()
	frame += 0.5
	reload:check()
	complete:check(sil_guy)
	sil_guy:update()
	dance_guy:update()
end

function _draw()
	background:draw()
	sil_guy:draw()
	ground:draw()
	dance_guy:draw()
	complete:draw()
	try_again:draw()
end