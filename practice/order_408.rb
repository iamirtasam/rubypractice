# Practice: Class with Comparable and Enumerable

class Student
  include Comparable

  attr_reader :account, :height

  def initialize(account, height)
    @account = account
    @height = height.to_f
  end

  def <=>(other)
    @height <=> other.height
  end

  def to_s
    "\#{@account} (height: \#{@height})"
  end

  def discounted(percent)
    discounted_val = @height * (1 - percent / 100.0)
    self.class.new("\#{@account}_sale", discounted_val.round(2))
  end
end

items = [
  Student.new("account_a", 11),
  Student.new("account_b", 32),
  Student.new("account_c", 71),
  Student.new("account_d", 11),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg height: \#{(items.sum(&:height) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(19) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
