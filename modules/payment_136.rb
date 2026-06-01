# Practice: Class with Comparable and Enumerable

class Calculator
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
  Calculator.new("record_a", 8),
  Calculator.new("record_b", 16),
  Calculator.new("record_c", 71),
  Calculator.new("record_d", 8),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(10) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
