# Practice: Class with Comparable and Enumerable

class GamePlayer
  include Comparable

  attr_reader :message, :ratio

  def initialize(message, ratio)
    @message = message
    @ratio = ratio.to_f
  end

  def <=>(other)
    @ratio <=> other.ratio
  end

  def to_s
    "\#{@message} (ratio: \#{@ratio})"
  end

  def discounted(percent)
    discounted_val = @ratio * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  GamePlayer.new("message_a", 4),
  GamePlayer.new("message_b", 30),
  GamePlayer.new("message_c", 85),
  GamePlayer.new("message_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg ratio: \#{(items.sum(&:ratio) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(22) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
