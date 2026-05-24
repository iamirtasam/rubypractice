# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :category, :height

  def initialize(category, height)
    @category = category
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@category} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@category}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("category_a", 19),
  ContactBook.new("category_b", 25),
  ContactBook.new("category_c", 72),
  ContactBook.new("category_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
