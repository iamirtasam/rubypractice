module ArrayTools
  VERSION = "1.4.1"

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

puts ArrayTools::VERSION
puts ArrayTools.calculate(42, 28, :*)
puts ArrayTools.clamp(141, 0, 100)
