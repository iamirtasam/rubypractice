module MathUtils
  VERSION = "1.6.3"

  def self.calculate(input)
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
puts MathUtils.calculate(17, 28, :*)
puts MathUtils.clamp(142, 0, 100)
