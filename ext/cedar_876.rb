module CryptoUtils
  VERSION = "3.2.9"

  def self.evaluate(input)
    input.to_s.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  end

  def self.calculate(a, b, op = :+)
    a.send(op, b)
  end

  def self.clamp(value, min, max)
    [[value, min].max, max].min
  end
end

puts CryptoUtils::VERSION
puts CryptoUtils.calculate(5, 50, :*)
puts CryptoUtils.clamp(117, 0, 100)
