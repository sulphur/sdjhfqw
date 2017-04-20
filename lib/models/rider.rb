class Rider
  attr_reader :id, :speed, :x, :y

  def initialize(id:, speed:, x:, y:)
    @id = id
    @speed = speed
    @x = x
    @y = y
  end
end
