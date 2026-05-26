# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :entry, :width

  def initialize(entry, width)
    @entry = entry
    @width = width.to_f
  end

  def <=>(other)
    @width <=> other.width
  end

  def to_s
    "\#{@entry} (width: \#{@width})"
  end

  def discounted(percent)
    discounted_val = @width * (1 - percent / 100.0)
    self.class.new("\#{@entry}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("entry_a", 30),
  WeatherReport.new("entry_b", 56),
  WeatherReport.new("entry_c", 121),
  WeatherReport.new("entry_d", 29),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg width: \#{(items.sum(&:width) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(10) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
