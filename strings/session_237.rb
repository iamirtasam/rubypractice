# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :order, :index

  def initialize(order, index)
    @order = order
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@order} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@order}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("order_a", 14),
  ParkingLot.new("order_b", 31),
  ParkingLot.new("order_c", 99),
  ParkingLot.new("order_d", 10),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(12) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
