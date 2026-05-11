# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :token, :ratio

  def initialize(token, ratio)
    @token = token
    @ratio = ratio.to_f
  end

  def <=>(other)
    @ratio <=> other.ratio
  end

  def to_s
    "\#{@token} (ratio: \#{@ratio})"
  end

  def discounted(percent)
    discounted_val = @ratio * (1 - percent / 100.0)
    self.class.new("\#{@token}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("token_a", 10),
  WeatherReport.new("token_b", 27),
  WeatherReport.new("token_c", 86),
  WeatherReport.new("token_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg ratio: \#{(items.sum(&:ratio) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(27) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
