# Practice: Class with Comparable and Enumerable

class VendingMachine
  include Comparable

  attr_reader :review, :average

  def initialize(review, average)
    @review = review
    @average = average.to_f
  end

  def <=>(other)
    @average <=> other.average
  end

  def to_s
    "\#{@review} (average: \#{@average})"
  end

  def discounted(percent)
    discounted_val = @average * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  VendingMachine.new("review_a", 50),
  VendingMachine.new("review_b", 57),
  VendingMachine.new("review_c", 143),
  VendingMachine.new("review_d", 33),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(23) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
