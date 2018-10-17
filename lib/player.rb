class Player
  DEFAULT_HP = 60

  attr_reader :name, :hp

  def initialize(name, hp=DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def reduce_hp
    @hp -= Kernel.rand(5..15)
  end

  def attack(player)
    player.reduce_hp
    @just_attacked = true
  end

end
