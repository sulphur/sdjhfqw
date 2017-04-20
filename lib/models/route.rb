class Route
  attr_reader :rider, :distance, :route
  def initialize(rider:, distance:, route:)
    @rider = rider
    @distance = distance
    @route = route
  end
end
