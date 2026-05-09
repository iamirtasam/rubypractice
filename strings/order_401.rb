# Practice: Class with Comparable and Enumerable

class BankAccount
  include Comparable

  attr_reader :post, :length

  def initialize(post, length)
    @post = post
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@post} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@post}_sale", discounted_val.round(2))
  end
end

items = [
  BankAccount.new("post_a", 19),
  BankAccount.new("post_b", 31),
  BankAccount.new("post_c", 80),
  BankAccount.new("post_d", 19),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(24) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
