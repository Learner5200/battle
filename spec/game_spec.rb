require 'game'

describe Game do
  let(:player1) { double(:player1, reduce_hp: true) }
  let(:player2) { double(:player2, reduce_hp: true) }
  let(:game) { Game.new(player1, player2) }





  describe '#attack' do
    it 'reduces hp of target' do
      expect(player2).to receive(:reduce_hp)
      game.attack(player2)
    end
  end


  describe '#just_attacked?' do
    it 'begins false' do
      expect(game.just_attacked?).to be_falsy
    end

    it 'returns true after attacking' do
      game.attack(player2)
      expect(game.just_attacked?).to be_truthy
    end
  end
end
