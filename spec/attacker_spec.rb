require "attacker"

describe Attacker do
  let(:attacker) { Attacker.new }
  let(:player) { double(:player, :reduce_hp => true) }

  describe '#attack' do
    it 'reduces hp of target' do
      expect(player).to receive(:reduce_hp)
      attacker.attack(player)
    end
  end

  describe '#just_attacked?' do
    it 'begins false' do
      expect(attacker.just_attacked?).to be_falsy
    end

    it 'returns true after attacking' do
      attacker.attack(player)
      expect(attacker.just_attacked?).to be_truthy
    end

    it 'returns false after calling #finish_attack' do
      attacker.attack(player)
      attacker.finish_attack
      expect(attacker.just_attacked?).to be_falsy
    end
  end

end
