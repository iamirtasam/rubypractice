# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :message, :height

  def initialize(message, height)
    @message = message
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@message} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("message_a", 8),
  HotelReservation.new("message_b", 18),
  HotelReservation.new("message_c", 90),
  HotelReservation.new("message_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
