# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :user, :limit

  def initialize(user, limit)
    @user = user
    @limit = limit.to_f
  end

  def <=>(other)
    @limit <=> other.limit
  end

  def to_s
    "\#{@user} (limit: \#{@limit})"
  end

  def discounted(percent)
    discounted_val = @limit * (1 - percent / 100.0)
    self.class.new("\#{@user}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("user_a", 10),
  FlightBooking.new("user_b", 23),
  FlightBooking.new("user_c", 84),
  FlightBooking.new("user_d", 6),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg limit: \#{(items.sum(&:limit) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(24) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
