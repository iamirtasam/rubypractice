# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :post, :score

  def initialize(post, score)
    @post = post
    @score = score.to_f
  end

  def <=>(other)
    @score <=> other.score
  end

  def to_s
    "\#{@post} (score: \#{@score})"
  end

  def discounted(percent)
    discounted_val = @score * (1 - percent / 100.0)
    self.class.new("\#{@post}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("post_a", 32),
  ShoppingCart.new("post_b", 47),
  ShoppingCart.new("post_c", 93),
  ShoppingCart.new("post_d", 24),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg score: \#{(items.sum(&:score) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
