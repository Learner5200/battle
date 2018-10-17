require 'game'

describe Game do
  let(:game) { Game.new }
  let(:player) { double(:player, reduce_hp: true) }
  describe '#attack' do
    it 'reduces hp of target' do
      expect(player).to receive(:reduce_hp)
      game.attack(player)
    end
  end


  describe '#just_attacked?' do
    it 'begins false' do
      expect(game.just_attacked?).to be_falsy
    end

    it 'returns true after attacking' do
      game.attack(player)
      expect(game.just_attacked?).to be_truthy
    end
  end
end
