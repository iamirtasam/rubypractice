# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :comment, :value

  def initialize(comment, value)
    @comment = comment
    @value = value.to_f
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "\#{@comment} (value: \#{@value})"
  end

  def discounted(percent)
    discounted_val = @value * (1 - percent / 100.0)
    self.class.new("\#{@comment}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("comment_a", 42),
  HotelReservation.new("comment_b", 56),
  HotelReservation.new("comment_c", 126),
  HotelReservation.new("comment_d", 23),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg value: \#{(items.sum(&:value) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(16) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
