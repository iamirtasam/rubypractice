# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :rating, :index

  def initialize(rating, index)
    @rating = rating
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@rating} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@rating}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("rating_a", 7),
  ParkingLot.new("rating_b", 16),
  ParkingLot.new("rating_c", 95),
  ParkingLot.new("rating_d", 7),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(18) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
