module DateHelper
  VERSION = "2.1.9"

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

puts DateHelper::VERSION
puts DateHelper.calculate(22, 34, :*)
puts DateHelper.clamp(73, 0, 100)
