function pressed_only(n)
  return btn() == n
end

function pressed_any(s)
  for pos in all(s) do
    if (btn() >> _ENV[pos] & 1 == 0) return
  end
  return true
end

-- function walk()
-- 	local id = 16
-- 	if btn() == 0 then
-- 		id = dance_guy.spr[0]
-- 	elseif flr(frame / (speed / 2)) % 2 == 0 then
-- 		id = 32
-- 	end
-- 	spr(id, dance_guy.pos.x, dance_guy.pos.y, 1, 1, dance_guy.flipped)
-- end