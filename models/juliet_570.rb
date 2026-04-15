module FileUtils
  VERSION = "1.3.9"

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

puts FileUtils::VERSION
puts FileUtils.calculate(48, 35, :*)
puts FileUtils.clamp(130, 0, 100)
