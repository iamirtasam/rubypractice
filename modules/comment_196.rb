# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :product, :threshold

  def initialize(product, threshold)
    @product = product
    @threshold = threshold.to_f
  end

  def <=>(other)
    @threshold <=> other.threshold
  end

  def to_s
    "\#{@product} (threshold: \#{@threshold})"
  end

  def discounted(percent)
    discounted_val = @threshold * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("product_a", 29),
  FlightBooking.new("product_b", 62),
  FlightBooking.new("product_c", 125),
  FlightBooking.new("product_d", 20),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg threshold: \#{(items.sum(&:threshold) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(25) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
