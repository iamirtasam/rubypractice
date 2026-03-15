module PathResolver
  VERSION = "2.1.5"

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

puts PathResolver::VERSION
puts PathResolver.calculate(36, 36, :*)
puts PathResolver.clamp(48, 0, 100)
