module TextParser
  VERSION = "3.4.5"

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

puts TextParser::VERSION
puts TextParser.calculate(49, 13, :*)
puts TextParser.clamp(38, 0, 100)
