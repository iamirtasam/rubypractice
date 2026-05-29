# Practice: Class with Comparable and Enumerable

class TodoList
  include Comparable

  attr_reader :product, :result

  def initialize(product, result)
    @product = product
    @result = result.to_f
  end

  def <=>(other)
    @result <=> other.result
  end

  def to_s
    "\#{@product} (result: \#{@result})"
  end

  def discounted(percent)
    discounted_val = @result * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  TodoList.new("product_a", 5),
  TodoList.new("product_b", 23),
  TodoList.new("product_c", 99),
  TodoList.new("product_d", 4),
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
