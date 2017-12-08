require 'views/game.rb'
#
# player1 = double(:player1)
# player2 = double(:player2, health: 100, attacked: 10)

describe Game do
  let(:player1) { double(:player1, health: 10) }
  let(:player2) { double(:player2, health: 100) }
  let(:game) { described_class.new(player1, player2) }

  it 'should allow player 1 to attack player 2' do
    allow(player2).to receive(:attacked) { player2.health - 10 }
    expect(game.attack(player2)).to eq 90
  end

  it 'should return the activer player when called' do
    expect(game.active_player).to eq player1
  end

  it 'should switch the active player when calling switch' do
    expect(game.active_player).to eq player1
    game.switch
    expect(game.active_player).to eq player2
  end

  it 'should return the inactive player when called upon' do
    expect(game.inactive_player).to eq player2
  end

  it 'should know when a game is over' do
    expect(game.game_over?). to be false
    allow(player1).to receive(:health) { 0 }
    expect(game.game_over?). to be true
  end

  it 'should return the loser' do
    allow(player1).to receive(:health) { 0 }
    expect(game.loser).to eq player1
  end

end
