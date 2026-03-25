module ArrayTools
  VERSION = "1.9.7"

  def self.parse(input)
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
puts ArrayTools.calculate(20, 45, :*)
puts ArrayTools.clamp(14, 0, 100)
