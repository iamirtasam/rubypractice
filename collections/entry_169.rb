# Practice: Class with Comparable and Enumerable

class BookStore
  include Comparable

  attr_reader :payment, :score

  def initialize(payment, score)
    @payment = payment
    @score = score.to_f
  end

  def <=>(other)
    @score <=> other.score
  end

  def to_s
    "\#{@payment} (score: \#{@score})"
  end

  def discounted(percent)
    discounted_val = @score * (1 - percent / 100.0)
    self.class.new("\#{@payment}_sale", discounted_val.round(2))
  end
end

items = [
  BookStore.new("payment_a", 25),
  BookStore.new("payment_b", 49),
  BookStore.new("payment_c", 106),
  BookStore.new("payment_d", 2),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg score: \#{(items.sum(&:score) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(20) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
