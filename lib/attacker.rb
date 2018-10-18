class Attacker
  def attack(target)
    target.reduce_hp
    @just_attacked = true
  end

  def finish_attack
    @just_attacked = false
  end

  def just_attacked?
    !!@just_attacked
  end
end
