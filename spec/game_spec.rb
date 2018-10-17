require 'game'

describe Game do
  let(:player1) { double(:player1, reduce_hp: true) }
  let(:player2) { double(:player2, reduce_hp: true) }
  let(:game) { Game.new(player1, player2) }


  describe '#current_player' do
    it 'returns player1 initially' do
      expect(game.current_player).to eq(player1)
    end

    it 'returns player2 after switch' do
      game.switch_player
      expect(game.current_player).to eq(player2)
    end

  end

  describe '#attack' do
    it 'reduces hp of player2 when player2 is target' do
      expect(player2).to receive(:reduce_hp)
      game.attack
    end

    it 'reduces hp of player1 when player1 is target' do
      expect(player1).to receive(:reduce_hp)
      game.switch_player
      game.attack
    end
  end

  describe '#just_attacked?' do
    it 'begins false' do
      expect(game.just_attacked?).to be_falsy
    end

    it 'returns true after attacking' do
      game.attack
      expect(game.just_attacked?).to be_truthy
    end

    it 'returns false after switching player' do
      game.attack
      game.switch_player
      expect(game.just_attacked?).to be_falsy
    end
  end
end
