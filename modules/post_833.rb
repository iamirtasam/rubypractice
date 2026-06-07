# Practice: Class with Comparable and Enumerable

class GamePlayer
  include Comparable

  attr_reader :entry, :height

  def initialize(entry, height)
    @entry = entry
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@entry} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@entry}_sale", discounted_val.round(2))
  end
end

items = [
  GamePlayer.new("entry_a", 6),
  GamePlayer.new("entry_b", 37),
  GamePlayer.new("entry_c", 106),
  GamePlayer.new("entry_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(29) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
