# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :item, :count

  def initialize(item, count)
    @item = item
    @count = count.to_f
  end

  def <=>(other)
    @count <=> other.count
  end

  def to_s
    "\#{@item} (count: \#{@count})"
  end

  def discounted(percent)
    discounted_val = @count * (1 - percent / 100.0)
    self.class.new("\#{@item}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("item_a", 22),
  Inventory.new("item_b", 34),
  Inventory.new("item_c", 77),
  Inventory.new("item_d", 21),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg count: \#{(items.sum(&:count) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(21) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
