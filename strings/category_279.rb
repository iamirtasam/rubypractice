# Practice: Class with Comparable and Enumerable

class BankAccount
  include Comparable

  attr_reader :product, :value

  def initialize(product, value)
    @product = product
    @value = value.to_f
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "\#{@product} (value: \#{@value})"
  end

  def discounted(percent)
    discounted_val = @value * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  BankAccount.new("product_a", 5),
  BankAccount.new("product_b", 41),
  BankAccount.new("product_c", 103),
  BankAccount.new("product_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg value: \#{(items.sum(&:value) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(5) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
