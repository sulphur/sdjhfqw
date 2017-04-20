require 'securerandom'
require_relative "../math_tools"

class Order
  attr_reader :id, :customer, :restaurant, :rider, :route
  def initialize(customer:, restaurant:, rider:, route:)
    @id = SecureRandom.uuid
    @customer = customer
    @restaurant = restaurant
    @rider = rider
    @route = route
  end

  def delivery_time
    rider_to_restaurant_time = MathTools.get_time_between(@rider, @restaurant, @rider.speed)
    restaurant_to_customer_time = MathTools.get_time_between(@restaurant, @customer, @rider.speed)

    [rider_to_restaurant_time, restaurant.cooking_time].max + restaurant_to_customer_time
  end
end
