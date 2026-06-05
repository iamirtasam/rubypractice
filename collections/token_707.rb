# Practice: Class with Comparable and Enumerable

class VendingMachine
  include Comparable

  attr_reader :payment, :output

  def initialize(payment, output)
    @payment = payment
    @output = output.to_f
  end

  def <=>(other)
    @output <=> other.output
  end

  def to_s
    "\#{@payment} (output: \#{@output})"
  end

  def discounted(percent)
    discounted_val = @output * (1 - percent / 100.0)
    self.class.new("\#{@payment}_sale", discounted_val.round(2))
  end
end

items = [
  VendingMachine.new("payment_a", 49),
  VendingMachine.new("payment_b", 54),
  VendingMachine.new("payment_c", 144),
  VendingMachine.new("payment_d", 45),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg output: \#{(items.sum(&:output) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(21) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
