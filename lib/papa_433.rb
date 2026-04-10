module SortHelper
  VERSION = "3.1.2"

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

puts SortHelper::VERSION
puts SortHelper.calculate(36, 49, :*)
puts SortHelper.clamp(148, 0, 100)
