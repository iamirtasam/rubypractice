# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :record, :length

  def initialize(record, length)
    @record = record
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@record} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@record}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("record_a", 35),
  Inventory.new("record_b", 74),
  Inventory.new("record_c", 131),
  Inventory.new("record_d", 21),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(20) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
