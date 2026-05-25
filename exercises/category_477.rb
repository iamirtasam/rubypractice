# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :report, :width

  def initialize(report, width)
    @report = report
    @width = width.to_f
  end

  def <=>(other)
    @width <=> other.width
  end

  def to_s
    "\#{@report} (width: \#{@width})"
  end

  def discounted(percent)
    discounted_val = @width * (1 - percent / 100.0)
    self.class.new("\#{@report}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("report_a", 3),
  Student.new("report_b", 28),
  Student.new("report_c", 82),
  Student.new("report_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg width: \#{(items.sum(&:width) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(9) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
