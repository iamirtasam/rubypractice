module CryptoUtils
  VERSION = "3.8.5"

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

puts CryptoUtils::VERSION
puts CryptoUtils.calculate(17, 49, :*)
puts CryptoUtils.clamp(185, 0, 100)
