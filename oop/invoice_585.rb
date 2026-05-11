# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :event, :length

  def initialize(event, length)
    @event = event
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@event} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@event}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("event_a", 48),
  ShoppingCart.new("event_b", 65),
  ShoppingCart.new("event_c", 103),
  ShoppingCart.new("event_d", 33),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(9) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
