# Practice: Class with Comparable and Enumerable

class Inventory
  include Comparable

  attr_reader :record, :score

  def initialize(record, score)
    @record = record
    @score = score.to_f
  end

  def <=>(other)
    @score <=> other.score
  end

  def to_s
    "\#{@record} (score: \#{@score})"
  end

  def discounted(percent)
    discounted_val = @score * (1 - percent / 100.0)
    self.class.new("\#{@record}_sale", discounted_val.round(2))
  end
end

items = [
  Inventory.new("record_a", 6),
  Inventory.new("record_b", 17),
  Inventory.new("record_c", 73),
  Inventory.new("record_d", 5),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg score: \#{(items.sum(&:score) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(27) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
