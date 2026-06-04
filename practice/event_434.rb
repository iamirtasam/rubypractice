# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :review, :price

  def initialize(review, price)
    @review = review
    @price = price.to_f
  end

  def <=>(other)
    @price <=> other.price
  end

  def to_s
    "\#{@review} (price: \#{@price})"
  end

  def discounted(percent)
    discounted_val = @price * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("review_a", 15),
  Inventory.new("review_b", 30),
  Inventory.new("review_c", 75),
  Inventory.new("review_d", 3),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg price: \#{(items.sum(&:price) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(20) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
