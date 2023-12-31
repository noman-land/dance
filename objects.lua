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
    dance_guy.flipped = pressed_any "➡️"
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