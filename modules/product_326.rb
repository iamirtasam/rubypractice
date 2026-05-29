# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :review, :discount

  def initialize(review, discount)
    @review = review
    @discount = discount.to_f
  end

  def <=>(other)
    @discount <=> other.discount
  end

  def to_s
    "\#{@review} (discount: \#{@discount})"
  end

  def discounted(percent)
    discounted_val = @discount * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("review_a", 41),
  Inventory.new("review_b", 59),
  Inventory.new("review_c", 131),
  Inventory.new("review_d", 34),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg discount: \#{(items.sum(&:discount) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(5) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
