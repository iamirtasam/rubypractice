# Practice: Class with Comparable and Enumerable

class TodoList
  include Comparable

  attr_reader :user, :value

  def initialize(user, value)
    @user = user
    @value = value.to_f
  end

  def <=>(other)
    @value <=> other.value
  end

  def to_s
    "\#{@user} (value: \#{@value})"
  end

  def discounted(percent)
    discounted_val = @value * (1 - percent / 100.0)
    self.class.new("\#{@user}_sale", discounted_val.round(2))
  end
end

items = [
  TodoList.new("user_a", 19),
  TodoList.new("user_b", 34),
  TodoList.new("user_c", 107),
  TodoList.new("user_d", 3),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg value: \#{(items.sum(&:value) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
