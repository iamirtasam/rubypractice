# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :task, :ratio

  def initialize(task, ratio)
    @task = task
    @ratio = ratio.to_f
  end

  def <=>(other)
    @ratio <=> other.ratio
  end

  def to_s
    "\#{@task} (ratio: \#{@ratio})"
  end

  def discounted(percent)
    discounted_val = @ratio * (1 - percent / 100.0)
    self.class.new("\#{@task}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("task_a", 44),
  Inventory.new("task_b", 80),
  Inventory.new("task_c", 104),
  Inventory.new("task_d", 18),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg ratio: \#{(items.sum(&:ratio) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(14) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
