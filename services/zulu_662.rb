module DateHelper
  VERSION = "3.9.7"

  def self.validate(input)
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
puts DateHelper.calculate(17, 5, :*)
puts DateHelper.clamp(17, 0, 100)
