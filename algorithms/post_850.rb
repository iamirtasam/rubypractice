# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :message, :discount

  def initialize(message, discount)
    @message = message
    @discount = discount.to_f
  end

  def <=>(other)
    @discount <=> other.discount
  end

  def to_s
    "\#{@message} (discount: \#{@discount})"
  end

  def discounted(percent)
    discounted_val = @discount * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("message_a", 10),
  WeatherReport.new("message_b", 17),
  WeatherReport.new("message_c", 85),
  WeatherReport.new("message_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg discount: \#{(items.sum(&:discount) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(5) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
