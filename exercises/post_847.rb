# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :tag, :median

  def initialize(tag, median)
    @tag = tag
    @median = median.to_f
  end

  def <=>(other)
    @median <=> other.median
  end

  def to_s
    "\#{@tag} (median: \#{@median})"
  end

  def discounted(percent)
    discounted_val = @median * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("tag_a", 42),
  ParkingLot.new("tag_b", 68),
  ParkingLot.new("tag_c", 118),
  ParkingLot.new("tag_d", 23),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg median: \#{(items.sum(&:median) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
