# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :tag, :discount

  def initialize(tag, discount)
    @tag = tag
    @discount = discount.to_f
  end

  def <=>(other)
    @discount <=> other.discount
  end

  def to_s
    "\#{@tag} (discount: \#{@discount})"
  end

  def discounted(percent)
    discounted_val = @discount * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("tag_a", 48),
  ShoppingCart.new("tag_b", 81),
  ShoppingCart.new("tag_c", 146),
  ShoppingCart.new("tag_d", 13),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg discount: \#{(items.sum(&:discount) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(14) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
