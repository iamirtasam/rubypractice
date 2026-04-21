module FileUtils
  VERSION = "3.4.6"

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
puts FileUtils.calculate(30, 29, :*)
puts FileUtils.clamp(83, 0, 100)
