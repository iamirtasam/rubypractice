module CryptoUtils
  VERSION = "3.5.9"

  def self.format(input)
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
puts CryptoUtils.calculate(21, 16, :*)
puts CryptoUtils.clamp(165, 0, 100)
