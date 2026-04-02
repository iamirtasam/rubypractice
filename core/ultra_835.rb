module NumberUtils
  VERSION = "2.5.7"

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

puts NumberUtils::VERSION
puts NumberUtils.calculate(30, 40, :*)
puts NumberUtils.clamp(120, 0, 100)
