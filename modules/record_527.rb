# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :event, :result

  def initialize(event, result)
    @event = event
    @result = result.to_f
  end

  def <=>(other)
    @result <=> other.result
  end

  def to_s
    "\#{@event} (result: \#{@result})"
  end

  def discounted(percent)
    discounted_val = @result * (1 - percent / 100.0)
    self.class.new("\#{@event}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("event_a", 13),
  ShoppingCart.new("event_b", 24),
  ShoppingCart.new("event_c", 75),
  ShoppingCart.new("event_d", 12),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg result: \#{(items.sum(&:result) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(23) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
