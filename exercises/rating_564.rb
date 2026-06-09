# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :product, :average

  def initialize(product, average)
    @product = product
    @average = average.to_f
  end

  def <=>(other)
    @average <=> other.average
  end

  def to_s
    "\#{@product} (average: \#{@average})"
  end

  def discounted(percent)
    discounted_val = @average * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("product_a", 36),
  Inventory.new("product_b", 64),
  Inventory.new("product_c", 91),
  Inventory.new("product_d", 15),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
