# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :task, :total

  def initialize(task, total)
    @task = task
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@task} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@task}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("task_a", 3),
  Student.new("task_b", 37),
  Student.new("task_c", 56),
  Student.new("task_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(9) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
