# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :post, :count

  def initialize(post, count)
    @post = post
    @count = count.to_f
  end

  def <=>(other)
    @count <=> other.count
  end

  def to_s
    "\#{@post} (count: \#{@count})"
  end

  def discounted(percent)
    discounted_val = @count * (1 - percent / 100.0)
    self.class.new("\#{@post}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("post_a", 33),
  ShoppingCart.new("post_b", 50),
  ShoppingCart.new("post_c", 97),
  ShoppingCart.new("post_d", 26),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg count: \#{(items.sum(&:count) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
