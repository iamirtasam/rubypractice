# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :account, :output

  def initialize(account, output)
    @account = account
    @output = output.to_f
  end

  def <=>(other)
    @output <=> other.output
  end

  def to_s
    "\#{@account} (output: \#{@output})"
  end

  def discounted(percent)
    discounted_val = @output * (1 - percent / 100.0)
    self.class.new("\#{@account}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("account_a", 43),
  Inventory.new("account_b", 73),
  Inventory.new("account_c", 123),
  Inventory.new("account_d", 8),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg output: \#{(items.sum(&:output) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(23) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
