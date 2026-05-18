# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :category, :median

  def initialize(category, median)
    @category = category
    @median = median.to_f
  end

  def <=>(other)
    @median <=> other.median
  end

  def to_s
    "\#{@category} (median: \#{@median})"
  end

  def discounted(percent)
    discounted_val = @median * (1 - percent / 100.0)
    self.class.new("\#{@category}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("category_a", 1),
  ContactBook.new("category_b", 16),
  ContactBook.new("category_c", 94),
  ContactBook.new("category_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg median: \#{(items.sum(&:median) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(25) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
