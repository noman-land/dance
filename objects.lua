ground = {
  draw = function()
    rectfill(0, 68, 127, 70, 3)
  end
}

-- silhouete guy
sil_guy = {
  x = 0,
  y = 0,
  update = function(self)
    self.x = 21 + frame / 10
    self.y = 20 + frame / 10
  end,
  draw = function(self)
    spr(69, self.x, self.y, 1, 1)
  end
}

dance_guy = {
  flipped = false,
  x = 0,
  y = 64 - 4,
  update = function(self)
    self.flipped = pressed_any "➡️"
    self.x = 64 - 3 - (self.flipped and 1 or 0)
  end,
  draw = function(self)
    spr(
      self.sprs[btn()],
      self.x,
      self.y,
      1,
      1,
      self.flipped
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