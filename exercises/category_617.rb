# Practice: Class with Comparable and Enumerable

class BookStore
  include Comparable

  attr_reader :task, :length

  def initialize(task, length)
    @task = task
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@task} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@task}_sale", discounted_val.round(2))
  end
end

items = [
  BookStore.new("task_a", 4),
  BookStore.new("task_b", 30),
  BookStore.new("task_c", 82),
  BookStore.new("task_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(16) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
