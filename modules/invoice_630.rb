# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :comment, :limit

  def initialize(comment, limit)
    @comment = comment
    @limit = limit.to_f
  end

  def <=>(other)
    @limit <=> other.limit
  end

  def to_s
    "\#{@comment} (limit: \#{@limit})"
  end

  def discounted(percent)
    discounted_val = @limit * (1 - percent / 100.0)
    self.class.new("\#{@comment}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("comment_a", 50),
  ShoppingCart.new("comment_b", 86),
  ShoppingCart.new("comment_c", 121),
  ShoppingCart.new("comment_d", 24),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg limit: \#{(items.sum(&:limit) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
