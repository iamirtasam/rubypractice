# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :category, :index

  def initialize(category, index)
    @category = category
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@category} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@category}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("category_a", 12),
  WeatherReport.new("category_b", 32),
  WeatherReport.new("category_c", 63),
  WeatherReport.new("category_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
