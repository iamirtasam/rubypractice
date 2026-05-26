# Practice: Class with Comparable and Enumerable

class TextEditor
  include Comparable

  attr_reader :token, :speed

  def initialize(token, speed)
    @token = token
    @speed = speed.to_f
  end

  def <=>(other)
    @speed <=> other.speed
  end

  def to_s
    "\#{@token} (speed: \#{@speed})"
  end

  def discounted(percent)
    discounted_val = @speed * (1 - percent / 100.0)
    self.class.new("\#{@token}_sale", discounted_val.round(2))
  end
end

items = [
  TextEditor.new("token_a", 30),
  TextEditor.new("token_b", 46),
  TextEditor.new("token_c", 85),
  TextEditor.new("token_d", 14),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg speed: \#{(items.sum(&:speed) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(18) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
