require 'views/game.rb'
#
# player1 = double(:player1)
# player2 = double(:player2, health: 100, attacked: 10)

describe Game do
  let(:player1) { double(:player1) }
  let(:player2) { double(:player2, health: 100) }
  let(:game) { described_class.new(player1, player2) }

  it 'should allow player 1 to attack player 2' do
    allow(player2).to receive(:attacked) { player2.health - 10 }
    expect(game.attack(player2)).to eq 90
  end

  it 'should return the activer player when called' do
    expect(game.active_player).to eq game.player1
  end

  it 'should switch the active player when calling switch' do
    expect(game.active_player).to eq game.player1
    game.switch
    expect(game.active_player).to eq game.player2
  end

  it 'should return the inactive player when called upon' do
    expect(game.inactive_player).to eq game.player2
  end
  
end
