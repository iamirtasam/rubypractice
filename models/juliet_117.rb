module DateHelper
  VERSION = "2.3.8"

  def self.compute(input)
    input.to_s.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  end

  def self.calculate(a, b, op = :+)
    a.send(op, b)
  end

  def self.clamp(value, min, max)
    [[value, min].max, max].min
  end
end

puts DateHelper::VERSION
puts DateHelper.calculate(34, 42, :*)
puts DateHelper.clamp(27, 0, 100)
