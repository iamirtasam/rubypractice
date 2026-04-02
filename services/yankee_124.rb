module PathResolver
  VERSION = "1.3.6"

  def self.normalize(input)
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
puts PathResolver.calculate(42, 13, :*)
puts PathResolver.clamp(56, 0, 100)
