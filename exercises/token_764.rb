# Practice: Class with Comparable and Enumerable

class BookStore
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
  BookStore.new("product_a", 17),
  BookStore.new("product_b", 42),
  BookStore.new("product_c", 93),
  BookStore.new("product_d", 14),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(19) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
