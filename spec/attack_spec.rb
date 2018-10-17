# require "attack"
#
# describe Attack do
#   let(:player) { double(:player, :reduce_hp => true) }
#   let(:game) { double(:game, :current_target => player, :just_attacked= => true) }
#
#   describe '#run' do
#     it "reduces the hp of a game's current target" do
#       expect(player).to receive(:reduce_hp)
#       Attack.run(game)
#     end
#   end
#
# end
