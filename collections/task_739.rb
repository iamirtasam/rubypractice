# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :review, :width

  def initialize(review, width)
    @review = review
    @width = width.to_f
  end

  def <=>(other)
    @width <=> other.width
  end

  def to_s
    "\#{@review} (width: \#{@width})"
  end

  def discounted(percent)
    discounted_val = @width * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("review_a", 47),
  ATM.new("review_b", 79),
  ATM.new("review_c", 109),
  ATM.new("review_d", 37),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg width: \#{(items.sum(&:width) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(24) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
