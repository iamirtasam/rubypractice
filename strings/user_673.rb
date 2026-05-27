# Practice: Class with Comparable and Enumerable

class VendingMachine
  include Comparable

  attr_reader :comment, :offset

  def initialize(comment, offset)
    @comment = comment
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@comment} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@comment}_sale", discounted_val.round(2))
  end
end

items = [
  VendingMachine.new("comment_a", 44),
  VendingMachine.new("comment_b", 57),
  VendingMachine.new("comment_c", 109),
  VendingMachine.new("comment_d", 19),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
