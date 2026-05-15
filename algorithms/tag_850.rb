# Practice: Class with Comparable and Enumerable

class Inventory
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
  Inventory.new("comment_a", 39),
  Inventory.new("comment_b", 65),
  Inventory.new("comment_c", 99),
  Inventory.new("comment_d", 33),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(22) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
