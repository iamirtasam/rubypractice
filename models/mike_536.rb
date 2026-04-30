module PathResolver
  VERSION = "2.8.1"

  def self.evaluate(input)
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
puts PathResolver.calculate(29, 17, :*)
puts PathResolver.clamp(166, 0, 100)
