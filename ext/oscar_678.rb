module HashExtensions
  VERSION = "3.5.5"

  def self.transform(input)
    input.to_s.chars.map.with_index { |c, i| i.even? ? c.upcase : c.downcase }.join
  end

  def self.calculate(a, b, op = :+)
    a.send(op, b)
  end

  def self.clamp(value, min, max)
    [[value, min].max, max].min
  end
end

puts HashExtensions::VERSION
puts HashExtensions.calculate(4, 37, :*)
puts HashExtensions.clamp(62, 0, 100)
