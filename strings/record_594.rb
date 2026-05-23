# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :session, :index

  def initialize(session, index)
    @session = session
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@session} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@session}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("session_a", 24),
  ParkingLot.new("session_b", 42),
  ParkingLot.new("session_c", 88),
  ParkingLot.new("session_d", 20),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(14) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
