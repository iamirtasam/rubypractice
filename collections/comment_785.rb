# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :rating, :weight

  def initialize(rating, weight)
    @rating = rating
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@rating} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@rating}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("rating_a", 45),
  Student.new("rating_b", 62),
  Student.new("rating_c", 128),
  Student.new("rating_d", 16),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
