module NetUtils
  VERSION = "1.2.1"

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

puts NetUtils::VERSION
puts NetUtils.calculate(42, 14, :*)
puts NetUtils.clamp(80, 0, 100)
