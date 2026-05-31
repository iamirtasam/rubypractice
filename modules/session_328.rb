# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :event, :offset

  def initialize(event, offset)
    @event = event
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@event} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@event}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("event_a", 28),
  ContactBook.new("event_b", 48),
  ContactBook.new("event_c", 125),
  ContactBook.new("event_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(25) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
