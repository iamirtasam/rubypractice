module NumberUtils
  VERSION = "3.2.5"

  def self.transform(input)
    input.to_s.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  end

  def self.calculate(a, b, op = :+)
    a.send(op, b)
  end

  def self.clamp(value, min, max)
    [[value, min].max, max].min
  end
end

puts NumberUtils::VERSION
puts NumberUtils.calculate(41, 12, :*)
puts NumberUtils.clamp(116, 0, 100)
