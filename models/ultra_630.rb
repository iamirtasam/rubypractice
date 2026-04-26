module NumberUtils
  VERSION = "3.9.5"

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

puts NumberUtils::VERSION
puts NumberUtils.calculate(44, 22, :*)
puts NumberUtils.clamp(112, 0, 100)
