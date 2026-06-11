# Practice: Class with Comparable and Enumerable

class TextEditor
  include Comparable

  attr_reader :review, :index

  def initialize(review, index)
    @review = review
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@review} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@review}_sale", discounted_val.round(2))
  end
end

items = [
  TextEditor.new("review_a", 48),
  TextEditor.new("review_b", 59),
  TextEditor.new("review_c", 140),
  TextEditor.new("review_d", 24),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(6) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
