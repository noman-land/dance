background = {
  draw = function()
    cls(1)
  end
}

ground = {
  draw = function()
    rectfill(0, 68, 127, 70, 3)
  end
}

-- silhouette guy
sil_guy = {
  winning_move = 4,
  origin = { x = 21, y = 20 },
  pos = { x = 0, y = 0 },
  speed = 1,
  update = function(self)
    self.pos.x = self.origin.x + frame * self.speed
    self.pos.y = self.origin.y + frame * self.speed
  end,
  draw = function(self)
    spr(69, self.pos.x, self.pos.y, 1, 1)
  end
}

dance_guy = {
  flipped = false,
  origin = { x = 61, y = 60 },
  pos = { x = 0, y = 0 },
  update = function(self)
    self.flipped = pressed_any "➡️"
    self.pos.x = self.origin.x - (self.flipped and 1 or 0)
    self.pos.y = self.origin.y
  end,
  draw = function(self)
    spr(
      self.sprs[btn()],
      self.pos.x,
      self.pos.y,
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
    -- ⬅️➡️
    [3] = 21,
    -- ⬆️
    [4] = 5,
    -- ⬇️
    [8] = 37,
    -- ⬅️⬆️
    [5] = 2,
    -- ➡️⬆️
    [6] = 2,
    -- ⬆️⬅️➡️
    [7] = 5,
    -- ⬅️⬇️
    [9] = 35,
    -- ⬅️⬇️
    [10] = 35,
    -- ⬇️⬅️➡️
    [11] = 37,
    -- ⬆️⬇️
    [12] = 21,
    -- ⬅️⬆️⬇️
    [13] = 18,
    -- ➡️⬆️⬇️
    [14] = 18,
    [15] = 21
  }
}