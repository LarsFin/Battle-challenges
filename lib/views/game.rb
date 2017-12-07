require_relative 'player.rb'

class Game

  attr_accessor :player1, :player2

  def initialize(name, name2)
    @player1 = Player.new(name)
    @player2 = Player.new(name2)
  
  end

  def attack(player)
    player.attacked
  end

end
