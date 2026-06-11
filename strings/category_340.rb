# Practice: Class with Comparable and Enumerable

class TodoList
  include Comparable

  attr_reader :token, :weight

  def initialize(token, weight)
    @token = token
    @weight = weight.to_f
  end

  def <=>(other)
    @weight <=> other.weight
  end

  def to_s
    "\#{@token} (weight: \#{@weight})"
  end

  def discounted(percent)
    discounted_val = @weight * (1 - percent / 100.0)
    self.class.new("\#{@token}_sale", discounted_val.round(2))
  end
end

items = [
  TodoList.new("token_a", 4),
  TodoList.new("token_b", 25),
  TodoList.new("token_c", 54),
  TodoList.new("token_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg weight: \#{(items.sum(&:weight) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(19) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
