module NetUtils
  VERSION = "2.9.9"

  def self.digest(input)
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
puts NetUtils.calculate(25, 47, :*)
puts NetUtils.clamp(123, 0, 100)
