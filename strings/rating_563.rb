# Practice: Class with Comparable and Enumerable

class TodoList
  include Comparable

  attr_reader :comment, :total

  def initialize(comment, total)
    @comment = comment
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@comment} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@comment}_sale", discounted_val.round(2))
  end
end

items = [
  TodoList.new("comment_a", 17),
  TodoList.new("comment_b", 40),
  TodoList.new("comment_c", 86),
  TodoList.new("comment_d", 14),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
