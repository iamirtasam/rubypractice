# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :session, :output

  def initialize(session, output)
    @session = session
    @output = output.to_f
  end

  def <=>(other)
    @output <=> other.output
  end

  def to_s
    "\#{@session} (output: \#{@output})"
  end

  def discounted(percent)
    discounted_val = @output * (1 - percent / 100.0)
    self.class.new("\#{@session}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("session_a", 27),
  Inventory.new("session_b", 55),
  Inventory.new("session_c", 96),
  Inventory.new("session_d", 20),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg output: \#{(items.sum(&:output) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(15) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
