# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :account, :index

  def initialize(account, index)
    @account = account
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@account} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@account}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("account_a", 32),
  Library.new("account_b", 50),
  Library.new("account_c", 104),
  Library.new("account_d", 30),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(15) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
