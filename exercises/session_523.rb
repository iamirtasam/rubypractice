# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :message, :offset

  def initialize(message, offset)
    @message = message
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@message} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("message_a", 13),
  ShoppingCart.new("message_b", 53),
  ShoppingCart.new("message_c", 80),
  ShoppingCart.new("message_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(27) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
