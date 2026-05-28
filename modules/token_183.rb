# Practice: Class with Comparable and Enumerable

class GamePlayer
  include Comparable

  attr_reader :message, :length

  def initialize(message, length)
    @message = message
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@message} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  GamePlayer.new("message_a", 11),
  GamePlayer.new("message_b", 50),
  GamePlayer.new("message_c", 105),
  GamePlayer.new("message_d", 8),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
