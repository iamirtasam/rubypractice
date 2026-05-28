# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :payment, :offset

  def initialize(payment, offset)
    @payment = payment
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@payment} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@payment}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("payment_a", 48),
  HotelReservation.new("payment_b", 66),
  HotelReservation.new("payment_c", 142),
  HotelReservation.new("payment_d", 39),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(6) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
