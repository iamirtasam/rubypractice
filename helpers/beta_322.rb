module MathUtils
  VERSION = "2.2.2"

  def self.parse(input)
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
puts MathUtils.calculate(9, 11, :*)
puts MathUtils.clamp(48, 0, 100)
