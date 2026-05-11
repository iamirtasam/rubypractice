# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :category, :length

  def initialize(category, length)
    @category = category
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@category} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@category}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("category_a", 13),
  HotelReservation.new("category_b", 18),
  HotelReservation.new("category_c", 94),
  HotelReservation.new("category_d", 9),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(15) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
