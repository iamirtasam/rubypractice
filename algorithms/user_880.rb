# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :rating, :speed

  def initialize(rating, speed)
    @rating = rating
    @speed = speed.to_f
  end

  def <=>(other)
    @speed <=> other.speed
  end

  def to_s
    "\#{@rating} (speed: \#{@speed})"
  end

  def discounted(percent)
    discounted_val = @speed * (1 - percent / 100.0)
    self.class.new("\#{@rating}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("rating_a", 41),
  FlightBooking.new("rating_b", 63),
  FlightBooking.new("rating_c", 125),
  FlightBooking.new("rating_d", 7),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg speed: \#{(items.sum(&:speed) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
