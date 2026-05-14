# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :item, :result

  def initialize(item, result)
    @item = item
    @result = result.to_f
  end

  def <=>(other)
    @result <=> other.result
  end

  def to_s
    "\#{@item} (result: \#{@result})"
  end

  def discounted(percent)
    discounted_val = @result * (1 - percent / 100.0)
    self.class.new("\#{@item}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("item_a", 35),
  Student.new("item_b", 53),
  Student.new("item_c", 99),
  Student.new("item_d", 35),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg result: \#{(items.sum(&:result) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(12) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
