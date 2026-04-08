module SortHelper
  VERSION = "2.2.3"

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

puts SortHelper::VERSION
puts SortHelper.calculate(36, 4, :*)
puts SortHelper.clamp(69, 0, 100)
