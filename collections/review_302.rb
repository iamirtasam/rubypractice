# Practice: Class with Comparable and Enumerable

class GamePlayer
  include Comparable

  attr_reader :rating, :limit

  def initialize(rating, limit)
    @rating = rating
    @limit = limit.to_f
  end

  def <=>(other)
    @limit <=> other.limit
  end

  def to_s
    "\#{@rating} (limit: \#{@limit})"
  end

  def discounted(percent)
    discounted_val = @limit * (1 - percent / 100.0)
    self.class.new("\#{@rating}_sale", discounted_val.round(2))
  end
end

items = [
  GamePlayer.new("rating_a", 43),
  GamePlayer.new("rating_b", 60),
  GamePlayer.new("rating_c", 107),
  GamePlayer.new("rating_d", 34),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg limit: \#{(items.sum(&:limit) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(26) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
