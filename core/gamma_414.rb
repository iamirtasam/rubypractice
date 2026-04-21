module ColorUtils
  VERSION = "2.5.8"

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

puts ColorUtils::VERSION
puts ColorUtils.calculate(33, 47, :*)
puts ColorUtils.clamp(60, 0, 100)
