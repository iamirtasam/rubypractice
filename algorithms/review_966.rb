# Practice: Class with Comparable and Enumerable

class TodoList
  include Comparable

  attr_reader :comment, :weight

  def initialize(comment, weight)
    @comment = comment
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@comment} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@comment}_sale", discounted_val.round(2))
  end
end

items = [
  TodoList.new("comment_a", 19),
  TodoList.new("comment_b", 31),
  TodoList.new("comment_c", 103),
  TodoList.new("comment_d", 10),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(5) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
