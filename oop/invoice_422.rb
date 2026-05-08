# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :product, :total

  def initialize(product, total)
    @product = product
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@product} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("product_a", 50),
  WeatherReport.new("product_b", 78),
  WeatherReport.new("product_c", 130),
  WeatherReport.new("product_d", 28),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
