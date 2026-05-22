# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :event, :height

  def initialize(event, height)
    @event = event
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@event} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@event}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("event_a", 1),
  ContactBook.new("event_b", 30),
  ContactBook.new("event_c", 54),
  ContactBook.new("event_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(29) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
