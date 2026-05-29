# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :user, :index

  def initialize(user, index)
    @user = user
    @index = index.to_f
  end

  def <=>(other)
    @index <=> other.index
  end

  def to_s
    "\#{@user} (index: \#{@index})"
  end

  def discounted(percent)
    discounted_val = @index * (1 - percent / 100.0)
    self.class.new("\#{@user}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("user_a", 37),
  Student.new("user_b", 48),
  Student.new("user_c", 128),
  Student.new("user_d", 18),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg index: \#{(items.sum(&:index) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(23) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
