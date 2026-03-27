module FileUtils
  VERSION = "1.5.9"

  def self.validate(input)
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
puts FileUtils.calculate(16, 29, :*)
puts FileUtils.clamp(93, 0, 100)
