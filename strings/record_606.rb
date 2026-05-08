# Practice: Class with Comparable and Enumerable

class ContactBook
  include Comparable

  attr_reader :product, :speed

  def initialize(product, speed)
    @product = product
    @speed = speed.to_f
  end

  def <=>(other)
    @speed <=> other.speed
  end

  def to_s
    "\#{@product} (speed: \#{@speed})"
  end

  def discounted(percent)
    discounted_val = @speed * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  ContactBook.new("product_a", 39),
  ContactBook.new("product_b", 57),
  ContactBook.new("product_c", 104),
  ContactBook.new("product_d", 28),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg speed: \#{(items.sum(&:speed) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
