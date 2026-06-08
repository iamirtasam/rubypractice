# Practice: Class with Comparable and Enumerable

class VendingMachine
  include Comparable

  attr_reader :order, :width

  def initialize(order, width)
    @order = order
    @width = width.to_f
  end

  def <=>(other)
    @width <=> other.width
  end

  def to_s
    "\#{@order} (width: \#{@width})"
  end

  def discounted(percent)
    discounted_val = @width * (1 - percent / 100.0)
    self.class.new("\#{@order}_sale", discounted_val.round(2))
  end
end

items = [
  VendingMachine.new("order_a", 40),
  VendingMachine.new("order_b", 72),
  VendingMachine.new("order_c", 138),
  VendingMachine.new("order_d", 29),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg width: \#{(items.sum(&:width) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(9) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
