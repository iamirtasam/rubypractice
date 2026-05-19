# Practice: Class with Comparable and Enumerable

class BookStore
  include Comparable

  attr_reader :invoice, :length

  def initialize(invoice, length)
    @invoice = invoice
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@invoice} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  BookStore.new("invoice_a", 41),
  BookStore.new("invoice_b", 81),
  BookStore.new("invoice_c", 100),
  BookStore.new("invoice_d", 16),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(22) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
