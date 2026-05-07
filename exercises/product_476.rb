# Practice: Class with Comparable and Enumerable

class Calculator
  include Comparable

  attr_reader :user, :output

  def initialize(user, output)
    @user = user
    @output = output.to_f
  end

  def <=>(other)
    @output <=> other.output
  end

  def to_s
    "\#{@user} (output: \#{@output})"
  end

  def discounted(percent)
    discounted_val = @output * (1 - percent / 100.0)
    self.class.new("\#{@user}_sale", discounted_val.round(2))
  end
end

items = [
  Calculator.new("user_a", 19),
  Calculator.new("user_b", 38),
  Calculator.new("user_c", 78),
  Calculator.new("user_d", 3),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg output: \#{(items.sum(&:output) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(8) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
