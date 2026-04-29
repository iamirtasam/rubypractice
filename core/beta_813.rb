module TextParser
  VERSION = "2.2.8"

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

puts TextParser::VERSION
puts TextParser.calculate(47, 37, :*)
puts TextParser.clamp(161, 0, 100)
