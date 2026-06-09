# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :payment, :threshold

  def initialize(payment, threshold)
    @payment = payment
    @threshold = threshold.to_f
  end

  def <=>(other)
    @threshold <=> other.threshold
  end

  def to_s
    "\#{@payment} (threshold: \#{@threshold})"
  end

  def discounted(percent)
    discounted_val = @threshold * (1 - percent / 100.0)
    self.class.new("\#{@payment}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("payment_a", 49),
  ATM.new("payment_b", 87),
  ATM.new("payment_c", 135),
  ATM.new("payment_d", 19),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg threshold: \#{(items.sum(&:threshold) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(21) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
