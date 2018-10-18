class Player
  DEFAULT_HP = 60
  DAMAGE_RANGE = 5..15

  attr_reader :name, :hp

  def initialize(name, hp=DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def reduce_hp
    @hp -= Kernel.rand(DAMAGE_RANGE)
  end

end
