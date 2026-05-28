# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :order, :price

  def initialize(order, price)
    @order = order
    @price = price.to_f
  end

  def <=>(other)
    @price <=> other.price
  end

  def to_s
    "\#{@order} (price: \#{@price})"
  end

  def discounted(percent)
    discounted_val = @price * (1 - percent / 100.0)
    self.class.new("\#{@order}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("order_a", 34),
  HotelReservation.new("order_b", 42),
  HotelReservation.new("order_c", 89),
  HotelReservation.new("order_d", 22),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg price: \#{(items.sum(&:price) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(12) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
