class Game

  def attack(player)
    player.reduce_hp
    @just_attacked = true
  end

  def just_attacked?
    !!@just_attacked
  end


end
