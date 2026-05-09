# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :item, :average

  def initialize(item, average)
    @item = item
    @average = average.to_f
  end

  def <=>(other)
    @average <=> other.average
  end

  def to_s
    "\#{@item} (average: \#{@average})"
  end

  def discounted(percent)
    discounted_val = @average * (1 - percent / 100.0)
    self.class.new("\#{@item}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("item_a", 25),
  FlightBooking.new("item_b", 63),
  FlightBooking.new("item_c", 83),
  FlightBooking.new("item_d", 21),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(21) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
