# Practice: Class with Comparable and Enumerable

class Employee
  include Comparable

  attr_reader :entry, :average

  def initialize(entry, average)
    @entry = entry
    @average = average.to_f
  end

  def <=>(other)
    @average <=> other.average
  end

  def to_s
    "\#{@entry} (average: \#{@average})"
  end

  def discounted(percent)
    discounted_val = @average * (1 - percent / 100.0)
    self.class.new("\#{@entry}_sale", discounted_val.round(2))
  end
end

items = [
  Employee.new("entry_a", 13),
  Employee.new("entry_b", 48),
  Employee.new("entry_c", 88),
  Employee.new("entry_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(10) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
