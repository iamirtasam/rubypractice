# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :session, :price

  def initialize(session, price)
    @session = session
    @price = price.to_f
  end

  def <=>(other)
    @price <=> other.price
  end

  def to_s
    "\#{@session} (price: \#{@price})"
  end

  def discounted(percent)
    discounted_val = @price * (1 - percent / 100.0)
    self.class.new("\#{@session}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("session_a", 6),
  ATM.new("session_b", 24),
  ATM.new("session_c", 57),
  ATM.new("session_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg price: \#{(items.sum(&:price) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
