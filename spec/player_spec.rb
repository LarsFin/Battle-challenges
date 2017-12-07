require 'views/player.rb'

describe Player do
  let(:player) { described_class.new('Tom') }

  it "Should return player's name" do
    expect(player.name).to eq 'Tom'
  end

end
