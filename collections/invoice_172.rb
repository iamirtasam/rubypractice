# Practice: Class with Comparable and Enumerable

class GamePlayer
  include Comparable

  attr_reader :comment, :result

  def initialize(comment, result)
    @comment = comment
    @result = result.to_f
  end

  def <=>(other)
    @result <=> other.result
  end

  def to_s
    "\#{@comment} (result: \#{@result})"
  end

  def discounted(percent)
    discounted_val = @result * (1 - percent / 100.0)
    self.class.new("\#{@comment}_sale", discounted_val.round(2))
  end
end

items = [
  GamePlayer.new("comment_a", 48),
  GamePlayer.new("comment_b", 58),
  GamePlayer.new("comment_c", 128),
  GamePlayer.new("comment_d", 9),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg result: \#{(items.sum(&:result) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
