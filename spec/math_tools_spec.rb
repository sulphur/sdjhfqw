require 'math_tools'

class Point < Struct.new(:x, :y)
end

describe MathTools do
  let :point1 { Point.new(1,1) }
  let :point2 { Point.new(4,6) }

  describe "self.get_distance_between" do
    it "calculates euclidean distance in 2 dimensional kartesian space" do
      expect(described_class.get_distance_between(point1,point2).round(2)).to eq(5.83)
    end
  end

  describe "self.get_time_between" do
    it "return travel time in minutes" do
      expect(described_class.get_time_between(point1, point2, 60)).to eq(6)
    end

    it "raise an error if speed is 0 or less" do
      expect { described_class.get_time_between(point1, point2, 0)}.to raise_error("speed must be positive number grater than 0")
    end
  end
end
