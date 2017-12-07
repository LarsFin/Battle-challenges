class Player

  attr_reader :name
  attr_accessor :health
  HP = 100

  def initialize(name = 'Jeff')
    @name = name
    @health = HP
  end

  def attacked
    @health -= 10
  end
end
