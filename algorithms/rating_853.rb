# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :record, :price

  def initialize(record, price)
    @record = record
    @price = price.to_f
  end

  def <=>(other)
    @price <=> other.price
  end

  def to_s
    "\#{@record} (price: \#{@price})"
  end

  def discounted(percent)
    discounted_val = @price * (1 - percent / 100.0)
    self.class.new("\#{@record}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("record_a", 27),
  ShoppingCart.new("record_b", 47),
  ShoppingCart.new("record_c", 82),
  ShoppingCart.new("record_d", 17),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg price: \#{(items.sum(&:price) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(9) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
