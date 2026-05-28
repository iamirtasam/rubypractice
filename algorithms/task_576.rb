# Practice: Class with Comparable and Enumerable

class Employee
  include Comparable

  attr_reader :token, :count

  def initialize(token, count)
    @token = token
    @count = count.to_f
  end

  def <=>(other)
    @count <=> other.count
  end

  def to_s
    "\#{@token} (count: \#{@count})"
  end

  def discounted(percent)
    discounted_val = @count * (1 - percent / 100.0)
    self.class.new("\#{@token}_sale", discounted_val.round(2))
  end
end

items = [
  Employee.new("token_a", 40),
  Employee.new("token_b", 59),
  Employee.new("token_c", 103),
  Employee.new("token_d", 4),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg count: \#{(items.sum(&:count) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(14) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
