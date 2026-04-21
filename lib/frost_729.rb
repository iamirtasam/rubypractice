module SortHelper
  VERSION = "1.8.2"

  def self.calculate(input)
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
puts SortHelper.calculate(8, 22, :*)
puts SortHelper.clamp(53, 0, 100)
