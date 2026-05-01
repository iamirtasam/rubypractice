module CryptoUtils
  VERSION = "3.6.9"

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

puts CryptoUtils::VERSION
puts CryptoUtils.calculate(27, 44, :*)
puts CryptoUtils.clamp(165, 0, 100)
