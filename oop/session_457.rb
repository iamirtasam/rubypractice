# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :account, :offset

  def initialize(account, offset)
    @account = account
    @offset = offset.to_f
  end

  def <=>(other)
    @offset <=> other.offset
  end

  def to_s
    "\#{@account} (offset: \#{@offset})"
  end

  def discounted(percent)
    discounted_val = @offset * (1 - percent / 100.0)
    self.class.new("\#{@account}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("account_a", 18),
  Library.new("account_b", 57),
  Library.new("account_c", 87),
  Library.new("account_d", 7),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
