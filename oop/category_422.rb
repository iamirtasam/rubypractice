# Practice: Class with Comparable and Enumerable

class BankAccount
  include Comparable

  attr_reader :post, :total

  def initialize(post, total)
    @post = post
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@post} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@post}_sale", discounted_val.round(2))
  end
end

items = [
  BankAccount.new("post_a", 33),
  BankAccount.new("post_b", 46),
  BankAccount.new("post_c", 121),
  BankAccount.new("post_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(29) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
