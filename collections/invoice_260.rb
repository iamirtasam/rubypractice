# Practice: Class with Comparable and Enumerable

class TodoList
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
  TodoList.new("order_a", 17),
  TodoList.new("order_b", 55),
  TodoList.new("order_c", 69),
  TodoList.new("order_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg threshold: \#{(items.sum(&:threshold) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(26) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
