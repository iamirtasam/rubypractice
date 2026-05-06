# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :record, :rate

  def initialize(record, rate)
    @record = record
    @rate = rate.to_f
  end

  def <=>(other)
    @rate <=> other.rate
  end

  def to_s
    "\#{@record} (rate: \#{@rate})"
  end

  def discounted(percent)
    discounted_val = @rate * (1 - percent / 100.0)
    self.class.new("\#{@record}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("record_a", 22),
  Student.new("record_b", 44),
  Student.new("record_c", 92),
  Student.new("record_d", 14),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg rate: \#{(items.sum(&:rate) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(24) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
