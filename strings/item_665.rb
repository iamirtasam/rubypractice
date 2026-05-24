# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :user, :weight

  def initialize(user, weight)
    @user = user
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@user} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@user}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("user_a", 42),
  FlightBooking.new("user_b", 78),
  FlightBooking.new("user_c", 119),
  FlightBooking.new("user_d", 39),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(6) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
