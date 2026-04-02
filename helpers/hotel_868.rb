module SortHelper
  VERSION = "2.0.6"

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

puts SortHelper::VERSION
puts SortHelper.calculate(19, 45, :*)
puts SortHelper.clamp(138, 0, 100)
