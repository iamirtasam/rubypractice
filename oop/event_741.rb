# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :payment, :price

  def initialize(payment, price)
    @payment = payment
    @price = price.to_f
  end

  def <=>(other)
    @price <=> other.price
  end

  def to_s
    "\#{@payment} (price: \#{@price})"
  end

  def discounted(percent)
    discounted_val = @price * (1 - percent / 100.0)
    self.class.new("\#{@payment}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("payment_a", 32),
  Inventory.new("payment_b", 52),
  Inventory.new("payment_c", 102),
  Inventory.new("payment_d", 22),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg price: \#{(items.sum(&:price) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
