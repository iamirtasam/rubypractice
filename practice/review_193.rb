# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :payment, :width

  def initialize(payment, width)
    @payment = payment
    @width = width.to_f
  end

  def <=>(other)
    @width <=> other.width
  end

  def to_s
    "\#{@payment} (width: \#{@width})"
  end

  def discounted(percent)
    discounted_val = @width * (1 - percent / 100.0)
    self.class.new("\#{@payment}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("payment_a", 42),
  FlightBooking.new("payment_b", 63),
  FlightBooking.new("payment_c", 99),
  FlightBooking.new("payment_d", 28),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg width: \#{(items.sum(&:width) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(16) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
