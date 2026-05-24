# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :record, :weight

  def initialize(record, weight)
    @record = record
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@record} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@record}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("record_a", 19),
  Library.new("record_b", 32),
  Library.new("record_c", 91),
  Library.new("record_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
