class Game #could I create new players in the initialization?
  attr_reader :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def attack(target)
    target.reduce_hp
    @just_attacked = true
  end

  def just_attacked?
    !!@just_attacked
  end


end
