# Practice: Class with Comparable and Enumerable

class WeatherReport
  include Comparable

  attr_reader :task, :average

  def initialize(task, average)
    @task = task
    @average = average.to_f
  end

  def <=>(other)
    @average <=> other.average
  end

  def to_s
    "\#{@task} (average: \#{@average})"
  end

  def discounted(percent)
    discounted_val = @average * (1 - percent / 100.0)
    self.class.new("\#{@task}_sale", discounted_val.round(2))
  end
end

items = [
  WeatherReport.new("task_a", 21),
  WeatherReport.new("task_b", 46),
  WeatherReport.new("task_c", 92),
  WeatherReport.new("task_d", 17),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg average: \#{(items.sum(&:average) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
