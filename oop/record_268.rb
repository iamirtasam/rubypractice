# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :tag, :result

  def initialize(tag, result)
    @tag = tag
    @result = result.to_f
  end

  def <=>(other)
    @result <=> other.result
  end

  def to_s
    "\#{@tag} (result: \#{@result})"
  end

  def discounted(percent)
    discounted_val = @result * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("tag_a", 12),
  Student.new("tag_b", 43),
  Student.new("tag_c", 74),
  Student.new("tag_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg result: \#{(items.sum(&:result) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(15) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
