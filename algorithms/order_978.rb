# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :item, :ratio

  def initialize(item, ratio)
    @item = item
    @ratio = ratio.to_f
  end

  def <=>(other)
    @ratio <=> other.ratio
  end

  def to_s
    "\#{@item} (ratio: \#{@ratio})"
  end

  def discounted(percent)
    discounted_val = @ratio * (1 - percent / 100.0)
    self.class.new("\#{@item}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("item_a", 40),
  Student.new("item_b", 65),
  Student.new("item_c", 139),
  Student.new("item_d", 32),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg ratio: \#{(items.sum(&:ratio) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(6) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
