class Route
  attr_reader :rider, :distance, :checkpoints
  def initialize(rider:, distance:, checkpoints:)
    @rider = rider
    @distance = distance
    @checkpoints = checkpoints
  end
end
