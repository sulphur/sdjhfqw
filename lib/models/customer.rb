class Customer
  attr_reader :id, :x, :y
  def initialize(id:, x:, y:)
    @id = id
    @x = x
    @y = y
  end
end
