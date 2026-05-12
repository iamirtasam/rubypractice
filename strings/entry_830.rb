# Practice: Class with Comparable and Enumerable

class FlightBooking
  include Comparable

  attr_reader :review, :threshold

  def initialize(review, threshold)
    @review = review
    @threshold = threshold.to_f
  end

  def <=>(other)
    @threshold <=> other.threshold
  end

  def to_s
    "\#{@review} (threshold: \#{@threshold})"
  end

  def discounted(percent)
    discounted_val = @threshold * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  FlightBooking.new("review_a", 21),
  FlightBooking.new("review_b", 36),
  FlightBooking.new("review_c", 89),
  FlightBooking.new("review_d", 6),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg threshold: \#{(items.sum(&:threshold) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(23) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
