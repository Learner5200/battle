require 'game'

describe Game do
  let(:player1) { double(:player1, hp: 60, reduce_hp: true) }
  let(:player2) { double(:player2, hp: 60, reduce_hp: true) }
  let(:attacker) { double(:attacker, finish_attack: true) }
  let(:game) { Game.new(player1, player2, attacker) }



  describe '#current_player' do
    it 'returns player1 initially' do
      expect(game.current_player).to eq(player1)
    end
  end

  describe '#switch_player' do
    it 'changes current player' do
      game.switch_player
      expect(game.current_player).to eq(player2)
    end

    it 'finishes attack' do
      expect(attacker).to receive(:finish_attack)
      game.switch_player
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
