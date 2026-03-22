module MathUtils
  VERSION = "3.8.4"

  def self.resolve(input)
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
puts MathUtils.calculate(37, 38, :*)
puts MathUtils.clamp(136, 0, 100)
