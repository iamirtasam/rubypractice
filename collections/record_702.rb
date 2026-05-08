# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid review total")
    super
  end
end

class ShoppingCart
  MIN_TOTAL = 1
  MAX_TOTAL = 182

  def initialize(review)
    @review = review
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "total \#{val} out of [1,182] range" unless (1..182).include?(val)
    @total = val
  end

  def total
    raise ShoppingCartError, "total not set" if @total.zero?
    @total
  end
end

test_values = [29, -1, 186, 85]

obj = ShoppingCart.new("review_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
