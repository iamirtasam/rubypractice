# Practice: Class with Comparable and Enumerable

class BookStore
  include Comparable

  attr_reader :entry, :discount

  def initialize(entry, discount)
    @entry = entry
    @discount = discount.to_f
  end

  def <=>(other)
    @discount <=> other.discount
  end

  def to_s
    "\#{@entry} (discount: \#{@discount})"
  end

  def discounted(percent)
    discounted_val = @discount * (1 - percent / 100.0)
    self.class.new("\#{@entry}_sale", discounted_val.round(2))
  end
end

items = [
  BookStore.new("entry_a", 48),
  BookStore.new("entry_b", 71),
  BookStore.new("entry_c", 124),
  BookStore.new("entry_d", 29),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg discount: \#{(items.sum(&:discount) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(13) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
