class Game #could I create new players in the initialization?
  attr_reader :player_one, :player_two
  attr_accessor :just_attacked

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

  def current_player
    @current_player
  end

  def current_target
    other(@current_player)
  end

  def winner
    other(loser)
  end

  def complete?
    !!loser # returns true iff someone has fallen to hp <= 0
  end

  private

  def other(player)
    @players.find { |other| other != player}
  end

  def loser
    @players.find { |player| player.hp <= 0 }
  end

end
