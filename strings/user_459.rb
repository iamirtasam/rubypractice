# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :product, :index

  def initialize(product, index)
    @product = product
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@product} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("product_a", 26),
  ShoppingCart.new("product_b", 47),
  ShoppingCart.new("product_c", 84),
  ShoppingCart.new("product_d", 10),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
