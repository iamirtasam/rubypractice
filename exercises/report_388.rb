# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :review, :limit

  def initialize(review, limit)
    @review = review
    @limit = limit.to_f
  end

  def <=>(other)
    @limit <=> other.limit
  end

  def to_s
    "\#{@review} (limit: \#{@limit})"
  end

  def discounted(percent)
    discounted_val = @limit * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("review_a", 44),
  Student.new("review_b", 62),
  Student.new("review_c", 99),
  Student.new("review_d", 9),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg limit: \#{(items.sum(&:limit) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(13) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
