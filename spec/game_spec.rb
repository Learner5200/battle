require 'game'

describe Game do
  let(:player1) { double(:player1, hp: 60, reduce_hp: true) }
  let(:player2) { double(:player2, hp: 60, reduce_hp: true) }
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

  describe '#winner' do
    it 'returns player 1 if player 1 wins' do
      allow(player2).to receive(:hp).and_return(0)
      expect(game.winner).to eq(player1)
    end
  end

  describe '#complete?' do
    it 'begins false' do
      expect(game.complete?).to be_falsy
    end

    it 'returns true if there is a winner' do
      allow(player2).to receive(:hp).and_return(0)
      expect(game.complete?).to be_truthy
    end
  end
end
