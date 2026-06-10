# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :order, :count

  def initialize(order, count)
    @order = order
    @count = count.to_f
  end

  def <=>(other)
    @count <=> other.count
  end

  def to_s
    "\#{@order} (count: \#{@count})"
  end

  def discounted(percent)
    discounted_val = @count * (1 - percent / 100.0)
    self.class.new("\#{@order}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("order_a", 46),
  Library.new("order_b", 81),
  Library.new("order_c", 141),
  Library.new("order_d", 25),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg count: \#{(items.sum(&:count) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(15) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
