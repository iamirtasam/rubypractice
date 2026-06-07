# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :entry, :output

  def initialize(entry, output)
    @entry = entry
    @output = output.to_f
  end

  def <=>(other)
    @output <=> other.output
  end

  def to_s
    "\#{@entry} (output: \#{@output})"
  end

  def discounted(percent)
    discounted_val = @output * (1 - percent / 100.0)
    self.class.new("\#{@entry}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("entry_a", 46),
  ParkingLot.new("entry_b", 51),
  ParkingLot.new("entry_c", 139),
  ParkingLot.new("entry_d", 13),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg output: \#{(items.sum(&:output) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(14) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
