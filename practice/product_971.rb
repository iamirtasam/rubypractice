# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :record, :value

  def initialize(record, value)
    @record = record
    @value = value.to_f
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "\#{@record} (value: \#{@value})"
  end

  def discounted(percent)
    discounted_val = @value * (1 - percent / 100.0)
    self.class.new("\#{@record}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("record_a", 31),
  WeatherReport.new("record_b", 60),
  WeatherReport.new("record_c", 86),
  WeatherReport.new("record_d", 9),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg value: \#{(items.sum(&:value) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(14) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
