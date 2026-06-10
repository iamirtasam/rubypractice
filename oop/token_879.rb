# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :session, :total

  def initialize(session, total)
    @session = session
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@session} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@session}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("session_a", 46),
  Inventory.new("session_b", 81),
  Inventory.new("session_c", 145),
  Inventory.new("session_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(13) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
