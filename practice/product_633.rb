# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :invoice, :discount

  def initialize(invoice, discount)
    @invoice = invoice
    @discount = discount.to_f
  end

  def <=>(other)
    @discount <=> other.discount
  end

  def to_s
    "\#{@invoice} (discount: \#{@discount})"
  end

  def discounted(percent)
    discounted_val = @discount * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("invoice_a", 14),
  Library.new("invoice_b", 52),
  Library.new("invoice_c", 68),
  Library.new("invoice_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg discount: \#{(items.sum(&:discount) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(22) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
