# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :review, :length

  def initialize(review, length)
    @review = review
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@review} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("review_a", 15),
  ParkingLot.new("review_b", 24),
  ParkingLot.new("review_c", 69),
  ParkingLot.new("review_d", 15),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
