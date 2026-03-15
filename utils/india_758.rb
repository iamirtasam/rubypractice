module ColorUtils
  VERSION = "3.3.1"

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

puts ColorUtils::VERSION
puts ColorUtils.calculate(15, 48, :*)
puts ColorUtils.clamp(134, 0, 100)
