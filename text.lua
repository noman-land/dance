try_again = {
  check = function()
    return pressed_any "❎"
  end,
  draw = function()
    print("❎ try again", 4, 119, 12)
  end
}

reload = {
  check = function()
    if (try_again:check()) run()
  end
}

complete = {
  level_won = false,
  is_over = false,
  check = function(self, sil_guy)
    local correctly_pressed = pressed_only(sil_guy.winning_move)
    local moment_of_overlap = flr(sil_guy.pos.y) == dance_guy.pos.y
    if correctly_pressed and moment_of_overlap then
      -- flash screen
      cls(14)
      self.level_won = true
    end
    self.is_over = sil_guy.pos.y > dance_guy.pos.y
  end,
  draw = function(self)
    if self.level_won then
      print('great job!', 20, 40, 14)
      print('score: 1', 20, 47, 14)
    elseif self.is_over then
      print('bad job :(', 70, 40, 8)
      print('score: 0', 70, 47, 8)
    end
  end
}