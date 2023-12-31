try_again = {
  draw = function()
    print("❎ try again", 4, 119, 12)
  end
}

reload = {
  check = function()
    if (pressed_any "❎") run()
  end
}

complete = {
  level_won = false,
  check = function()
    local winning_move = pressed_only(4)
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