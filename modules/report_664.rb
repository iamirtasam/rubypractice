# Practice: Class with Comparable and Enumerable

class Calculator
  include Comparable

  attr_reader :comment, :speed

  def initialize(comment, speed)
    @comment = comment
    @speed = speed.to_f
  end

  def <=>(other)
    @speed <=> other.speed
  end

  def to_s
    "\#{@comment} (speed: \#{@speed})"
  end

  def discounted(percent)
    discounted_val = @speed * (1 - percent / 100.0)
    self.class.new("\#{@comment}_sale", discounted_val.round(2))
  end
end

items = [
  Calculator.new("comment_a", 36),
  Calculator.new("comment_b", 46),
  Calculator.new("comment_c", 115),
  Calculator.new("comment_d", 16),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg speed: \#{(items.sum(&:speed) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(7) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
