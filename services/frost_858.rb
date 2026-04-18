module SortHelper
  VERSION = "1.4.6"

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

puts SortHelper::VERSION
puts SortHelper.calculate(21, 13, :*)
puts SortHelper.clamp(92, 0, 100)
