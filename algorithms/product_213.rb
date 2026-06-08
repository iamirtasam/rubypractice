# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :session, :ratio

  def initialize(session, ratio)
    @session = session
    @ratio = ratio.to_f
  end

  def <=>(other)
    @ratio <=> other.ratio
  end

  def to_s
    "\#{@session} (ratio: \#{@ratio})"
  end

  def discounted(percent)
    discounted_val = @ratio * (1 - percent / 100.0)
    self.class.new("\#{@session}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("session_a", 10),
  Library.new("session_b", 34),
  Library.new("session_c", 90),
  Library.new("session_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg ratio: \#{(items.sum(&:ratio) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(16) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
