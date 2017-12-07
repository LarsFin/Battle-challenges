class Player

  attr_reader :name
  attr_accessor :health
  HP = 100

  def initialize(name)
    @name = name
    @health = HP
  end
  def attack(player)
    player.attacked
  end
  def attacked
    @health -= 10
  end
end
