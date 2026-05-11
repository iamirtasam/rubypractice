# Practice: Class with Comparable and Enumerable

class ATM
  include Comparable

  attr_reader :product, :output

  def initialize(product, output)
    @product = product
    @output = output.to_f
  end

  def <=>(other)
    @output <=> other.output
  end

  def to_s
    "\#{@product} (output: \#{@output})"
  end

  def discounted(percent)
    discounted_val = @output * (1 - percent / 100.0)
    self.class.new("\#{@product}_sale", discounted_val.round(2))
  end
end

items = [
  ATM.new("product_a", 48),
  ATM.new("product_b", 71),
  ATM.new("product_c", 143),
  ATM.new("product_d", 42),
]

puts "All items:"
items.each { |i| puts "  \#{i}" }
puts "Sorted    : \#{items.sort.map(&:to_s).inspect}"
puts "Min       : \#{items.min}"
puts "Max       : \#{items.max}"
puts "Avg output: \#{(items.sum(&:output) / items.size).round(2)}"

sale_items = items.map { |i| i.discounted(17) }
puts "After \#{}% off:"
sale_items.each { |i| puts "  \#{i}" }
