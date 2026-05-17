# Practice: Class with Comparable and Enumerable

class VendingMachine
  include Comparable

  attr_reader :rating, :result

  def initialize(rating, result)
    @rating = rating
    @result = result.to_f
  end

  def <=>(other)
    @result <=> other.result
  end

  def to_s
    "\#{@rating} (result: \#{@result})"
  end

  def discounted(percent)
    discounted_val = @result * (1 - percent / 100.0)
    self.class.new("\#{@rating}_sale", discounted_val.round(2))
  end
end

items = [
  VendingMachine.new("rating_a", 30),
  VendingMachine.new("rating_b", 38),
  VendingMachine.new("rating_c", 123),
  VendingMachine.new("rating_d", 27),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg result: \#{(items.sum(&:result) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(26) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
