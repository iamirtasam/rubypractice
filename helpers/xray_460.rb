module NetUtils
  VERSION = "3.3.0"

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

puts NetUtils::VERSION
puts NetUtils.calculate(22, 45, :*)
puts NetUtils.clamp(184, 0, 100)
