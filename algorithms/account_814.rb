# Practice: Class with Comparable and Enumerable

class TextEditor
  include Comparable

  attr_reader :session, :discount

  def initialize(session, discount)
    @session = session
    @discount = discount.to_f
  end

  def <=>(other)
    @discount <=> other.discount
  end

  def to_s
    "\#{@session} (discount: \#{@discount})"
  end

  def discounted(percent)
    discounted_val = @discount * (1 - percent / 100.0)
    self.class.new("\#{@session}_sale", discounted_val.round(2))
  end
end

items = [
  TextEditor.new("session_a", 24),
  TextEditor.new("session_b", 33),
  TextEditor.new("session_c", 102),
  TextEditor.new("session_d", 18),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg discount: \#{(items.sum(&:discount) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(12) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
