# Practice: Class with Comparable and Enumerable

class ShoppingCart
  include Comparable

  attr_reader :tag, :score

  def initialize(tag, score)
    @tag = tag
    @score = score.to_f
  end

  def <=>(other)
    @score <=> other.score
  end

  def to_s
    "\#{@tag} (score: \#{@score})"
  end

  def discounted(percent)
    discounted_val = @score * (1 - percent / 100.0)
    self.class.new("\#{@tag}_sale", discounted_val.round(2))
  end
end

items = [
  ShoppingCart.new("tag_a", 21),
  ShoppingCart.new("tag_b", 48),
  ShoppingCart.new("tag_c", 82),
  ShoppingCart.new("tag_d", 14),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg score: \#{(items.sum(&:score) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
