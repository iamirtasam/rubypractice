# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :invoice, :weight

  def initialize(invoice, weight)
    @invoice = invoice
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@invoice} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("invoice_a", 6),
  Student.new("invoice_b", 36),
  Student.new("invoice_c", 89),
  Student.new("invoice_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
