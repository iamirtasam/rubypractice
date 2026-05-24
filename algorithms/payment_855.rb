# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :post, :speed

  def initialize(post, speed)
    @post = post
    @speed = speed.to_f
  end

  def <=>(other)
    @speed <=> other.speed
  end

  def to_s
    "\#{@post} (speed: \#{@speed})"
  end

  def discounted(percent)
    discounted_val = @speed * (1 - percent / 100.0)
    self.class.new("\#{@post}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("post_a", 28),
  FlightBooking.new("post_b", 42),
  FlightBooking.new("post_c", 104),
  FlightBooking.new("post_d", 26),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg speed: \#{(items.sum(&:speed) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
