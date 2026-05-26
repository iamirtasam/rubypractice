# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :order, :average

  def initialize(order, average)
    @order = order
    @average = average.to_f
  end

  def <=>(other)
    @average <=> other.average
  end

  def to_s
    "\#{@order} (average: \#{@average})"
  end

  def discounted(percent)
    discounted_val = @average * (1 - percent / 100.0)
    self.class.new("\#{@order}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("order_a", 12),
  ParkingLot.new("order_b", 33),
  ParkingLot.new("order_c", 102),
  ParkingLot.new("order_d", 6),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
