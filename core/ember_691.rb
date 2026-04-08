module ArrayTools
  VERSION = "2.2.2"

  def self.serialize(input)
    input.to_s.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  end

  def self.calculate(a, b, op = :+)
    a.send(op, b)
  end

  def self.clamp(value, min, max)
    [[value, min].max, max].min
  end
end

puts ArrayTools::VERSION
puts ArrayTools.calculate(14, 1, :*)
puts ArrayTools.clamp(81, 0, 100)
