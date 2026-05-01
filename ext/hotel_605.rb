module NetUtils
  VERSION = "2.3.5"

  def self.parse(input)
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
puts NetUtils.calculate(21, 28, :*)
puts NetUtils.clamp(6, 0, 100)
