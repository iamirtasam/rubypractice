# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :category, :value

  def initialize(category, value)
    @category = category
    @value = value.to_f
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "\#{@category} (value: \#{@value})"
  end

  def discounted(percent)
    discounted_val = @value * (1 - percent / 100.0)
    self.class.new("\#{@category}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("category_a", 8),
  ATM.new("category_b", 44),
  ATM.new("category_c", 61),
  ATM.new("category_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg value: \#{(items.sum(&:value) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(28) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
