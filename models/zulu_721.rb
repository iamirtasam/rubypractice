module FileUtils
  VERSION = "2.6.8"

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

puts FileUtils::VERSION
puts FileUtils.calculate(1, 10, :*)
puts FileUtils.clamp(30, 0, 100)
