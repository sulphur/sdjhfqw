require 'securerandom'

class Order
  attr_reader :id, :customer, :restaurant, :rider, :route
  def initialize(customer:, restaurant:, rider:, route:)
    @id = SecureRandom.uuid
    @customer = customer
    @restaurant = restaurant
    @rider = rider
    @route = route
  end
end
