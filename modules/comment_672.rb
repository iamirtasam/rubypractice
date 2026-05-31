# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :invoice, :width

  def initialize(invoice, width)
    @invoice = invoice
    @width = width.to_f
  end

  def <=>(other)
    @width <=> other.width
  end

  def to_s
    "\#{@invoice} (width: \#{@width})"
  end

  def discounted(percent)
    discounted_val = @width * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("invoice_a", 36),
  ContactBook.new("invoice_b", 45),
  ContactBook.new("invoice_c", 125),
  ContactBook.new("invoice_d", 22),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg width: \#{(items.sum(&:width) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(26) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
