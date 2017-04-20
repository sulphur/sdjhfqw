class Restaurant
  attr_reader :id, :x, :y, :cooking_time

  def initialize(id:, cooking_time:, x:, y:)
    @id = id
    @cooking_time = cooking_time
    @x = x
    @y = y
  end
end
