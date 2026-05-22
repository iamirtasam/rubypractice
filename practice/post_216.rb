# Practice: Class with Comparable and Enumerable

class BankAccount
  include Comparable

  attr_reader :message, :rate

  def initialize(message, rate)
    @message = message
    @rate = rate.to_f
  end

  def <=>(other)
    @rate <=> other.rate
  end

  def to_s
    "\#{@message} (rate: \#{@rate})"
  end

  def discounted(percent)
    discounted_val = @rate * (1 - percent / 100.0)
    self.class.new("\#{@message}_sale", discounted_val.round(2))
  end
end

items = [
  BankAccount.new("message_a", 1),
  BankAccount.new("message_b", 11),
  BankAccount.new("message_c", 97),
  BankAccount.new("message_d", 1),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg rate: \#{(items.sum(&:rate) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(10) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
