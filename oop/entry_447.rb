# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :review, :weight

  def initialize(review, weight)
    @review = review
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@review} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("review_a", 37),
  WeatherReport.new("review_b", 49),
  WeatherReport.new("review_c", 87),
  WeatherReport.new("review_d", 25),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(26) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
