# Practice: Class with Comparable and Enumerable

class ParkingLot
  include Comparable

  attr_reader :review, :score

  def initialize(review, score)
    @review = review
    @score = score.to_f
  end

  def <=>(other)
    @score <=> other.score
  end

  def to_s
    "\#{@review} (score: \#{@score})"
  end

  def discounted(percent)
    discounted_val = @score * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  ParkingLot.new("review_a", 39),
  ParkingLot.new("review_b", 68),
  ParkingLot.new("review_c", 104),
  ParkingLot.new("review_d", 6),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg score: \#{(items.sum(&:score) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(11) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
