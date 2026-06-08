# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :product, :width

  def initialize(product, width)
    @product = product
    @width = width.to_f
  end

  def <=>(other)
    @width <=> other.width
  end

  def to_s
    "\#{@product} (width: \#{@width})"
  end

  def discounted(percent)
    discounted_val = @width * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("product_a", 1),
  Inventory.new("product_b", 27),
  Inventory.new("product_c", 78),
  Inventory.new("product_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg width: \#{(items.sum(&:width) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(23) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
