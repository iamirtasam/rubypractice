module StringHelper
  VERSION = "3.3.8"

  def self.digest(input)
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
puts StringHelper.calculate(36, 23, :*)
puts StringHelper.clamp(58, 0, 100)
