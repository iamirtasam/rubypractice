# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :message, :median

  def initialize(message, median)
    @message = message
    @median = median.to_f
  end

  def <=>(other)
    @median <=> other.median
  end

  def to_s
    "\#{@message} (median: \#{@median})"
  end

  def discounted(percent)
    discounted_val = @median * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("message_a", 14),
  ParkingLot.new("message_b", 37),
  ParkingLot.new("message_c", 87),
  ParkingLot.new("message_d", 14),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg median: \#{(items.sum(&:median) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(12) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
