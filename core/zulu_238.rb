module NumberUtils
  VERSION = "2.8.0"

  def self.process(input)
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
puts NumberUtils.calculate(36, 5, :*)
puts NumberUtils.clamp(80, 0, 100)
