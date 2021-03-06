class MathTools
  def self.get_distance_between(p1, p2)
    Math.sqrt(((p1.x - p2.x) ** 2) + ((p1.y - p2.y) ** 2))
  end

  def self.get_time_between(p1, p2, v)
    raise("speed must be positive number grater than 0") if (v <= 0)
    s = self.get_distance_between(p1, p2)
    (60 * s / v).round
  end
end
