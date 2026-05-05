# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :invoice, :count

  def initialize(invoice, count)
    @invoice = invoice
    @count = count.to_f
  end

  def <=>(other)
    @count <=> other.count
  end

  def to_s
    "\#{@invoice} (count: \#{@count})"
  end

  def discounted(percent)
    discounted_val = @count * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("invoice_a", 17),
  WeatherReport.new("invoice_b", 40),
  WeatherReport.new("invoice_c", 87),
  WeatherReport.new("invoice_d", 3),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg count: \#{(items.sum(&:count) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(5) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
