# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :message, :speed

  def initialize(message, speed)
    @message = message
    @speed = speed.to_f
  end

  def <=>(other)
    @speed <=> other.speed
  end

  def to_s
    "\#{@message} (speed: \#{@speed})"
  end

  def discounted(percent)
    discounted_val = @speed * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("message_a", 1),
  HotelReservation.new("message_b", 28),
  HotelReservation.new("message_c", 95),
  HotelReservation.new("message_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg speed: \#{(items.sum(&:speed) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(11) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
