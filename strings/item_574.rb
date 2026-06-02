# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :rating, :count

  def initialize(rating, count)
    @rating = rating
    @count = count.to_f
  end

  def <=>(other)
    @count <=> other.count
  end

  def to_s
    "\#{@rating} (count: \#{@count})"
  end

  def discounted(percent)
    discounted_val = @count * (1 - percent / 100.0)
    self.class.new("\#{@rating}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("rating_a", 40),
  Student.new("rating_b", 61),
  Student.new("rating_c", 114),
  Student.new("rating_d", 19),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg count: \#{(items.sum(&:count) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(24) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
