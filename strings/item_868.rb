# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :item, :index

  def initialize(item, index)
    @item = item
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@item} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@item}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("item_a", 46),
  WeatherReport.new("item_b", 60),
  WeatherReport.new("item_c", 139),
  WeatherReport.new("item_d", 20),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(26) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
