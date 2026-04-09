module NetUtils
  VERSION = "2.4.9"

  def self.process(input)
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
puts NetUtils.calculate(10, 31, :*)
puts NetUtils.clamp(69, 0, 100)
