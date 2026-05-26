# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :session, :weight

  def initialize(session, weight)
    @session = session
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@session} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@session}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("session_a", 35),
  FlightBooking.new("session_b", 65),
  FlightBooking.new("session_c", 105),
  FlightBooking.new("session_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(29) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
