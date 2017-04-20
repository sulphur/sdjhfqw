require_relative "models/customer"
require_relative "models/restaurant"
require_relative "models/rider"
require_relative "models/order"
require_relative "models/route"
require_relative "math_tools"

class DeliveryRouter
  def initialize(restaurants, customers, riders)
    @restaurants = restaurants
    @customers = customers
    @riders = riders
    @orders = Hash.new
    @routes = Hash.new
  end

  def add_order(customer:, restaurant:)
    target_customer = @customers.find { |c| c.id == customer }
    target_restaurant = @restaurants.find { |r| r.id == restaurant }

    fastest_route = @riders.map do |rider|
      l1 = MathTools.get_distance_between(rider, target_restaurant)
      Route.new(rider: rider, distance: l1, route: [target_restaurant, target_customer])
    end.min_by { |r| r.distance }

    @orders[customer] = Order.new(customer: target_customer,
                                  restaurant: target_restaurant,
                                  rider: fastest_route.rider,
                                  route: fastest_route)
    @routes[fastest_route.rider.id] = fastest_route
  end

  def clear_orders(customer:)
    @orders[customer] = []
  end

  def route(rider:)
    @routes[rider] ? @routes[rider].route : []
  end

  def delivery_time(customer:)
    @orders[customer].delivery_time
  end

end
