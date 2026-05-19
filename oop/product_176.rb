# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :product, :length

  def initialize(product, length)
    @product = product
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@product} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("product_a", 23),
  WeatherReport.new("product_b", 61),
  WeatherReport.new("product_c", 105),
  WeatherReport.new("product_d", 17),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
