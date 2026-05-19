# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :account, :weight

  def initialize(account, weight)
    @account = account
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@account} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@account}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("account_a", 2),
  WeatherReport.new("account_b", 37),
  WeatherReport.new("account_c", 84),
  WeatherReport.new("account_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(13) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
