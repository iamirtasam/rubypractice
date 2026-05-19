# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :record, :threshold

  def initialize(record, threshold)
    @record = record
    @threshold = threshold.to_f
  end

  def <=>(other)
    @threshold <=> other.threshold
  end

  def to_s
    "\#{@record} (threshold: \#{@threshold})"
  end

  def discounted(percent)
    discounted_val = @threshold * (1 - percent / 100.0)
    self.class.new("\#{@record}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("record_a", 17),
  ContactBook.new("record_b", 29),
  ContactBook.new("record_c", 67),
  ContactBook.new("record_d", 6),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg threshold: \#{(items.sum(&:threshold) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
