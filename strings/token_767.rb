# Practice: Class with Comparable and Enumerable

class VendingMachine
  include Comparable

  attr_reader :order, :threshold

  def initialize(order, threshold)
    @order = order
    @threshold = threshold.to_f
  end

  def <=>(other)
    @threshold <=> other.threshold
  end

  def to_s
    "\#{@order} (threshold: \#{@threshold})"
  end

  def discounted(percent)
    discounted_val = @threshold * (1 - percent / 100.0)
    self.class.new("\#{@order}_sale", discounted_val.round(2))
  end
end

items = [
  VendingMachine.new("order_a", 31),
  VendingMachine.new("order_b", 40),
  VendingMachine.new("order_c", 87),
  VendingMachine.new("order_d", 30),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg threshold: \#{(items.sum(&:threshold) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
