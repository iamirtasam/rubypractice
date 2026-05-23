# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :review, :median

  def initialize(review, median)
    @review = review
    @median = median.to_f
  end

  def <=>(other)
    @median <=> other.median
  end

  def to_s
    "\#{@review} (median: \#{@median})"
  end

  def discounted(percent)
    discounted_val = @median * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("review_a", 14),
  Inventory.new("review_b", 40),
  Inventory.new("review_c", 73),
  Inventory.new("review_d", 3),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg median: \#{(items.sum(&:median) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(10) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
