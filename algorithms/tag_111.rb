# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :tag, :offset

  def initialize(tag, offset)
    @tag = tag
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@tag} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("tag_a", 28),
  Inventory.new("tag_b", 42),
  Inventory.new("tag_c", 105),
  Inventory.new("tag_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(18) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
