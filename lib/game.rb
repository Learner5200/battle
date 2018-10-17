class Game #could I create new players in the initialization?
  attr_reader :player_one, :player_two, :current_player

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @players = [@player_one, @player_two]
    @current_player = @players[0]
  end

  def attack
    current_target.reduce_hp
    @just_attacked = true
  end

  def just_attacked?
    !!@just_attacked
  end

  def switch_player
    @current_player = current_target
    @just_attacked = false
  end

  def current_target
    @players.find { |player| player != @current_player }
  end

end
