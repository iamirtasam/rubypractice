# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :order, :total

  def initialize(order, total)
    @order = order
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@order} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@order}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("order_a", 8),
  Library.new("order_b", 20),
  Library.new("order_c", 75),
  Library.new("order_d", 8),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(24) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
