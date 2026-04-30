module StringHelper
  VERSION = "2.3.8"

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

puts StringHelper::VERSION
puts StringHelper.calculate(32, 29, :*)
puts StringHelper.clamp(3, 0, 100)
