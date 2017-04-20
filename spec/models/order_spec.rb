require 'spec_helper'
require 'models/order'
require 'models/customer'
require 'models/rider'
require 'models/restaurant'
require 'models/route'

describe Order do
  describe "#delivery_time" do
    let :customer { Customer.new(id: 1, x: 2, y: 0) }
    let :restaurant { Restaurant.new(id: 1, cooking_time: 0, x: 1, y: 0) }
    let :rider { Rider.new(id: 1, x: 0, y: 0, speed: 2) }
    let :route { Route.new(checkpoints: [customer, restaurant], rider: rider, distance: 2) }



    subject { Order.new(customer: customer,
                        restaurant: restaurant,
                        rider: rider,
                        route: route) }

    context "given a valid order" do
      context "when meal is already cooked" do
        it { expect(subject.delivery_time).to eq(60) }
      end

      context "when driver has to wait for cooking to be finished" do
        let :restaurant { Restaurant.new(id: 1, cooking_time: 40, x: 1, y: 0) }
        it { expect(subject.delivery_time).to eq(70) }
      end
    end
  end
end
