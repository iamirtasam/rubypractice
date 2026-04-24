module DateHelper
  VERSION = "1.0.7"

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

puts DateHelper::VERSION
puts DateHelper.calculate(37, 27, :*)
puts DateHelper.clamp(28, 0, 100)
