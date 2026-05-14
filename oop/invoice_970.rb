# Practice: Class with Comparable and Enumerable

class TextEditor
  include Comparable

  attr_reader :token, :height

  def initialize(token, height)
    @token = token
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@token} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@token}_sale", discounted_val.round(2))
  end
end

items = [
  TextEditor.new("token_a", 37),
  TextEditor.new("token_b", 51),
  TextEditor.new("token_c", 109),
  TextEditor.new("token_d", 19),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(10) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
