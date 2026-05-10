# Practice: Class with Comparable and Enumerable

class Calculator
  include Comparable

  attr_reader :account, :result

  def initialize(account, result)
    @account = account
    @result = result.to_f
  end

  def <=>(other)
    @result <=> other.result
  end

  def to_s
    "\#{@account} (result: \#{@result})"
  end

  def discounted(percent)
    discounted_val = @result * (1 - percent / 100.0)
    self.class.new("\#{@account}_sale", discounted_val.round(2))
  end
end

items = [
  Calculator.new("account_a", 21),
  Calculator.new("account_b", 38),
  Calculator.new("account_c", 119),
  Calculator.new("account_d", 8),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg result: \#{(items.sum(&:result) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(18) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
