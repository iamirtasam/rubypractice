module CryptoUtils
  VERSION = "1.1.0"

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

puts CryptoUtils::VERSION
puts CryptoUtils.calculate(13, 11, :*)
puts CryptoUtils.clamp(43, 0, 100)
