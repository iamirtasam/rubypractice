# Practice: Class with Comparable and Enumerable

class BankAccount
  include Comparable

  attr_reader :invoice, :offset

  def initialize(invoice, offset)
    @invoice = invoice
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@invoice} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@invoice}_sale", discounted_val.round(2))
  end
end

items = [
  BankAccount.new("invoice_a", 2),
  BankAccount.new("invoice_b", 40),
  BankAccount.new("invoice_c", 80),
  BankAccount.new("invoice_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(16) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
