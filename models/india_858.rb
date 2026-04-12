module DateHelper
  VERSION = "3.6.4"

  def self.serialize(input)
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
puts DateHelper.calculate(35, 22, :*)
puts DateHelper.clamp(21, 0, 100)
