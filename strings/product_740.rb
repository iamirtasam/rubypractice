# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :task, :rate

  def initialize(task, rate)
    @task = task
    @rate = rate.to_f
  end

  def <=>(other)
    @rate <=> other.rate
  end

  def to_s
    "\#{@task} (rate: \#{@rate})"
  end

  def discounted(percent)
    discounted_val = @rate * (1 - percent / 100.0)
    self.class.new("\#{@task}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("task_a", 8),
  ShoppingCart.new("task_b", 20),
  ShoppingCart.new("task_c", 70),
  ShoppingCart.new("task_d", 7),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg rate: \#{(items.sum(&:rate) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
