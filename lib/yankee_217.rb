module TextParser
  VERSION = "1.3.2"

  def self.compute(input)
    input.to_s.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  end

  def self.calculate(a, b, op = :+)
    a.send(op, b)
  end

  def self.clamp(value, min, max)
    [[value, min].max, max].min
  end
end

puts TextParser::VERSION
puts TextParser.calculate(34, 41, :*)
puts TextParser.clamp(3, 0, 100)
