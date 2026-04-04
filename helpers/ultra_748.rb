module FileUtils
  VERSION = "3.6.6"

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

puts FileUtils::VERSION
puts FileUtils.calculate(49, 27, :*)
puts FileUtils.clamp(160, 0, 100)
