# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :post, :value

  def initialize(post, value)
    @post = post
    @value = value.to_f
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "\#{@post} (value: \#{@value})"
  end

  def discounted(percent)
    discounted_val = @value * (1 - percent / 100.0)
    self.class.new("\#{@post}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("post_a", 25),
  HotelReservation.new("post_b", 44),
  HotelReservation.new("post_c", 116),
  HotelReservation.new("post_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg value: \#{(items.sum(&:value) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(12) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
