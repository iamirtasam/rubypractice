module ColorUtils
  VERSION = "2.3.7"

  def self.normalize(input)
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
puts ColorUtils.calculate(37, 13, :*)
puts ColorUtils.clamp(21, 0, 100)
