# Practice: Class with Comparable and Enumerable

class Library
  include Comparable

  attr_reader :token, :total

  def initialize(token, total)
    @token = token
    @total = total.to_f
  end

  def <=>(other)
    @total <=> other.total
  end

  def to_s
    "\#{@token} (total: \#{@total})"
  end

  def discounted(percent)
    discounted_val = @total * (1 - percent / 100.0)
    self.class.new("\#{@token}_sale", discounted_val.round(2))
  end
end

items = [
  Library.new("token_a", 34),
  Library.new("token_b", 52),
  Library.new("token_c", 107),
  Library.new("token_d", 32),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg total: \#{(items.sum(&:total) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(14) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
