class Game #could I create new players in the initialization?
  attr_reader :player_one, :player_two, :current_player, :current_target

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @players = [@player_one, @player_two]
    @current_player = @players[0]
    @current_target = @players[1]
  end

  def attack
    @current_target.reduce_hp
    @just_attacked = true
  end

  def just_attacked?
    !!@just_attacked
  end


  def switch_player
    @current_target = @current_player
    @current_player = @players.find { |player| player != @current_player }
    @just_attacked = false
  end

end
