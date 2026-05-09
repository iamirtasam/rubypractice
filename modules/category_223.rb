# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :payment, :offset

  def initialize(payment, offset)
    @payment = payment
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@payment} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@payment}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("payment_a", 25),
  Student.new("payment_b", 30),
  Student.new("payment_c", 75),
  Student.new("payment_d", 9),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(22) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
