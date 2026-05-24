# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :tag, :price

  def initialize(tag, price)
    @tag = tag
    @price = price.to_f
  end

  def <=>(other)
    @price <=> other.price
  end

  def to_s
    "\#{@tag} (price: \#{@price})"
  end

  def discounted(percent)
    discounted_val = @price * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("tag_a", 22),
  WeatherReport.new("tag_b", 31),
  WeatherReport.new("tag_c", 117),
  WeatherReport.new("tag_d", 3),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg price: \#{(items.sum(&:price) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(24) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
