require_relative 'player.rb'

class Game

  attr_accessor :player1, :player2, :active_player

  def initialize(name, name2)
    @player1 = Player.new(name)
    @player2 = Player.new(name2)
    @active_player = @player1
  end

  def attack(player)
    player.attacked
  end

  def switch
    @active_player = inactive_player
  end

  def inactive_player
    @player1 == @active_player ? @player2 : @player1
  end

end
