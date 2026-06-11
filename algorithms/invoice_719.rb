# Practice: Class with Comparable and Enumerable

class TodoList
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
  TodoList.new("account_a", 7),
  TodoList.new("account_b", 24),
  TodoList.new("account_c", 72),
  TodoList.new("account_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg offset: \#{(items.sum(&:offset) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(6) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
