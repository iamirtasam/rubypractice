# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :event, :median

  def initialize(event, median)
    @event = event
    @median = median.to_f
  end

  def <=>(other)
    @median <=> other.median
  end

  def to_s
    "\#{@event} (median: \#{@median})"
  end

  def discounted(percent)
    discounted_val = @median * (1 - percent / 100.0)
    self.class.new("\#{@event}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("event_a", 12),
  ContactBook.new("event_b", 31),
  ContactBook.new("event_c", 73),
  ContactBook.new("event_d", 6),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg median: \#{(items.sum(&:median) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(16) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
