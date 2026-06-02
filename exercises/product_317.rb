# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :rating, :total

  def initialize(rating, total)
    @rating = rating
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@rating} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@rating}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("rating_a", 25),
  WeatherReport.new("rating_b", 49),
  WeatherReport.new("rating_c", 105),
  WeatherReport.new("rating_d", 20),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
