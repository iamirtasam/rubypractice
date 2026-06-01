# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :tag, :rate

  def initialize(tag, rate)
    @tag = tag
    @rate = rate.to_f
  end

  def <=>(other)
    @rate <=> other.rate
  end

  def to_s
    "\#{@tag} (rate: \#{@rate})"
  end

  def discounted(percent)
    discounted_val = @rate * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("tag_a", 23),
  Inventory.new("tag_b", 36),
  Inventory.new("tag_c", 81),
  Inventory.new("tag_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg rate: \#{(items.sum(&:rate) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
