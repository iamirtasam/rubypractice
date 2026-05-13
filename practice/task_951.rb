# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :user, :length

  def initialize(user, length)
    @user = user
    @length = length.to_f
  end

  def <=>(other)
    @length <=> other.length
  end

  def to_s
    "\#{@user} (length: \#{@length})"
  end

  def discounted(percent)
    discounted_val = @length * (1 - percent / 100.0)
    self.class.new("\#{@user}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("user_a", 36),
  ATM.new("user_b", 46),
  ATM.new("user_c", 88),
  ATM.new("user_d", 34),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg length: \#{(items.sum(&:length) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(30) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
