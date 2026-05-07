# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :event, :total

  def initialize(event, total)
    @event = event
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@event} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@event}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("event_a", 45),
  WeatherReport.new("event_b", 70),
  WeatherReport.new("event_c", 117),
  WeatherReport.new("event_d", 27),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(27) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
