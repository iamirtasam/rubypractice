module StringHelper
  VERSION = "1.9.2"

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

puts StringHelper::VERSION
puts StringHelper.calculate(45, 48, :*)
puts StringHelper.clamp(10, 0, 100)
