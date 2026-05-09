# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :report, :discount

  def initialize(report, discount)
    @report = report
    @discount = discount.to_f
  end

  def <=>(other)
    @discount <=> other.discount
  end

  def to_s
    "\#{@report} (discount: \#{@discount})"
  end

  def discounted(percent)
    discounted_val = @discount * (1 - percent / 100.0)
    self.class.new("\#{@report}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("report_a", 9),
  ShoppingCart.new("report_b", 40),
  ShoppingCart.new("report_c", 69),
  ShoppingCart.new("report_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg discount: \#{(items.sum(&:discount) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(29) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
