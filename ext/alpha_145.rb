module MathUtils
  VERSION = "2.5.6"

  def self.transform(input)
    input.to_s.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  end

  def self.calculate(a, b, op = :+)
    a.send(op, b)
  end

  def self.clamp(value, min, max)
    [[value, min].max, max].min
  end
end

puts MathUtils::VERSION
puts MathUtils.calculate(10, 39, :*)
puts MathUtils.clamp(6, 0, 100)
