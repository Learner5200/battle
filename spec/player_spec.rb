require "player"

describe Player do
  let(:player) { Player.new("Squirtle") }
  let(:default_hp) { Player::DEFAULT_HP }
  describe '#name' do
    it 'returns name' do
      expect(player.name).to eq("Squirtle")
    end
  end

  describe '#hp' do
    it 'returns default hp' do
      expect(player.hp).to eq(default_hp)
    end
  end

  describe '#reduce_hp' do
    it 'reduces hp' do
      allow(Kernel).to receive(:rand).and_return(10)
      expect{ player.reduce_hp }.to change{ player.hp }.by(-10)
    end
  end

end
