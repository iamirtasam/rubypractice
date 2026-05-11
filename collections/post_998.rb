# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :report, :limit

  def initialize(report, limit)
    @report = report
    @limit = limit.to_f
  end

  def <=>(other)
    @limit <=> other.limit
  end

  def to_s
    "\#{@report} (limit: \#{@limit})"
  end

  def discounted(percent)
    discounted_val = @limit * (1 - percent / 100.0)
    self.class.new("\#{@report}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("report_a", 26),
  ATM.new("report_b", 42),
  ATM.new("report_c", 107),
  ATM.new("report_d", 9),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg limit: \#{(items.sum(&:limit) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(11) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
