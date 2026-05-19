# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :tag, :weight

  def initialize(tag, weight)
    @tag = tag
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@tag} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("tag_a", 43),
  Inventory.new("tag_b", 64),
  Inventory.new("tag_c", 98),
  Inventory.new("tag_d", 21),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(18) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
