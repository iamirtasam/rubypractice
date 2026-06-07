# Practice: Class with Comparable and Enumerable

class HotelReservation
  include Comparable

  attr_reader :entry, :weight

  def initialize(entry, weight)
    @entry = entry
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@entry} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@entry}_sale", discounted_val.round(2))
  end
end

items = [
  HotelReservation.new("entry_a", 30),
  HotelReservation.new("entry_b", 60),
  HotelReservation.new("entry_c", 90),
  HotelReservation.new("entry_d", 27),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(10) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
