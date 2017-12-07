require 'views/player.rb'

describe Player do
  let(:player) { described_class.new('Jeff') }
  let(:player2) { described_class.new('Jim') }

  it "Should return player's name" do
    expect(player.name).to eq 'Jeff'
  end
  it 'Should initialize with a the constant HP' do
    expect(player.health).to eq (Player::HP)
  end

  describe '#attack' do
    it 'should attack' do
      expect{player.attack(player2)}.to change{player2.health}.by(-10)
    end
    it 'should be attacked' do
      expect{player2.attacked}.to change{player2.health}.by(-10)
    end
  end

end
