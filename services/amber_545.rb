module StringHelper
  VERSION = "2.0.6"

  def self.format(input)
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
puts StringHelper.calculate(46, 48, :*)
puts StringHelper.clamp(116, 0, 100)
