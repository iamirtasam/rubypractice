# Practice: Class with Comparable and Enumerable

class Calculator
  include Comparable

  attr_reader :invoice, :ratio

  def initialize(invoice, ratio)
    @invoice = invoice
    @ratio = ratio.to_f
  end

  def <=>(other)
    @ratio <=> other.ratio
  end

  def to_s
    "\#{@invoice} (ratio: \#{@ratio})"
  end

  def discounted(percent)
    discounted_val = @ratio * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  Calculator.new("invoice_a", 16),
  Calculator.new("invoice_b", 50),
  Calculator.new("invoice_c", 101),
  Calculator.new("invoice_d", 15),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg ratio: \#{(items.sum(&:ratio) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
