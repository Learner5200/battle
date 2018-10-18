require_relative 'attacker'

class Game

  def self.create(player_one, player_two, attacker=Attacker.new)
    @current_game = Game.new(player_one, player_two, attacker)
  end
  def self.current_game
    @current_game
  end

  attr_reader :player_one, :player_two, :current_player, :attacker
  attr_accessor :just_attacked

  def initialize(player_one, player_two, attacker=Attacker.new)
    @player_one = player_one
    @player_two = player_two
    @players = [@player_one, @player_two]
    @current_player = @players[0]
    @attacker = attacker
  end

  def current_target
    other(@current_player)
  end

  def switch_player
    @current_player = current_target
    attacker.finish_attack
  end

  def loser
    @players.find { |player| player.hp <= 0 }
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
end
