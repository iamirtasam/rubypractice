# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :item, :height

  def initialize(item, height)
    @item = item
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@item} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@item}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("item_a", 14),
  Student.new("item_b", 54),
  Student.new("item_c", 78),
  Student.new("item_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(19) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
