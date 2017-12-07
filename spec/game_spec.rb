require 'views/game.rb'
#
# player1 = double(:player1)
# player2 = double(:player2, health: 100, attacked: 10)

describe Game do
  let(:player1) { double(:player1) }
  let(:player2) { double(:player2, health: 100) }
  let(:game) { described_class.new(player1, player2) }

  it 'should allow player 1 to attack player 2' do
    allow(player2).to receive(:attacked) {player2.health - 10}
    expect(game.attack(player2)).to eq 90
  end
end
