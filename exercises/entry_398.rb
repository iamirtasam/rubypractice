# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :invoice, :ratio

  def initialize(invoice, ratio)
    @invoice = invoice
    @ratio = ratio.to_f
  end

  def <=>(other)
    @ratio <=> other.ratio
  end

  def to_s
    "\#{@invoice} (ratio: \#{@ratio})"
  end

  def discounted(percent)
    discounted_val = @ratio * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("invoice_a", 45),
  ParkingLot.new("invoice_b", 52),
  ParkingLot.new("invoice_c", 142),
  ParkingLot.new("invoice_d", 42),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg ratio: \#{(items.sum(&:ratio) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(21) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
