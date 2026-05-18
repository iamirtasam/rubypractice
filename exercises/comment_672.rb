# Practice: Class with Comparable and Enumerable

class GamePlayer
  include Comparable

  attr_reader :report, :value

  def initialize(report, value)
    @report = report
    @value = value.to_f
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "\#{@report} (value: \#{@value})"
  end

  def discounted(percent)
    discounted_val = @value * (1 - percent / 100.0)
    self.class.new("\#{@report}_sale", discounted_val.round(2))
  end
end

items = [
  GamePlayer.new("report_a", 9),
  GamePlayer.new("report_b", 21),
  GamePlayer.new("report_c", 59),
  GamePlayer.new("report_d", 8),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg value: \#{(items.sum(&:value) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
