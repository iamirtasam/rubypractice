module ArrayTools
  VERSION = "3.9.3"

  def self.format(input)
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
puts ArrayTools.calculate(43, 49, :*)
puts ArrayTools.clamp(151, 0, 100)
