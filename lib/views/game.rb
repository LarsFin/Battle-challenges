require_relative 'player.rb'

class Game

  attr_accessor :player1, :player2, :active_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
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

  def loser
    @player1.health <= 0 ? @player1 : @player2
  end

  def game_over?
    @player1.health <= 0 || @player2.health <= 0
  end

end
