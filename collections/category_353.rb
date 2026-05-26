# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :post, :weight

  def initialize(post, weight)
    @post = post
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@post} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@post}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("post_a", 25),
  HotelReservation.new("post_b", 63),
  HotelReservation.new("post_c", 102),
  HotelReservation.new("post_d", 19),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(20) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
