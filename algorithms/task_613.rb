# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :invoice, :average

  def initialize(invoice, average)
    @invoice = invoice
    @average = average.to_f
  end

  def <=>(other)
    @average <=> other.average
  end

  def to_s
    "\#{@invoice} (average: \#{@average})"
  end

  def discounted(percent)
    discounted_val = @average * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("invoice_a", 12),
  ATM.new("invoice_b", 17),
  ATM.new("invoice_c", 111),
  ATM.new("invoice_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(6) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
