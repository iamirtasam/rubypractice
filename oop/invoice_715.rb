# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :product, :rate

  def initialize(product, rate)
    @product = product
    @rate = rate.to_f
  end

  def <=>(other)
    @rate <=> other.rate
  end

  def to_s
    "\#{@product} (rate: \#{@rate})"
  end

  def discounted(percent)
    discounted_val = @rate * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("product_a", 7),
  ParkingLot.new("product_b", 19),
  ParkingLot.new("product_c", 89),
  ParkingLot.new("product_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg rate: \#{(items.sum(&:rate) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(19) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
