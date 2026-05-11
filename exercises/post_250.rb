# Practice: Class with Comparable and Enumerable

class TodoList
  include Comparable

  attr_reader :entry, :total

  def initialize(entry, total)
    @entry = entry
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@entry} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@entry}_sale", discounted_val.round(2))
  end
end

items = [
  TodoList.new("entry_a", 2),
  TodoList.new("entry_b", 39),
  TodoList.new("entry_c", 56),
  TodoList.new("entry_d", 1),
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
