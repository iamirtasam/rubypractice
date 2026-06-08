# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :product, :height

  def initialize(product, height)
    @product = product
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@product} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("product_a", 26),
  ParkingLot.new("product_b", 51),
  ParkingLot.new("product_c", 121),
  ParkingLot.new("product_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
