module HashExtensions
  VERSION = "2.5.3"

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

puts HashExtensions::VERSION
puts HashExtensions.calculate(34, 5, :*)
puts HashExtensions.clamp(75, 0, 100)
