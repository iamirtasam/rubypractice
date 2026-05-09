# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid payment median")
    super
  end
end

class ShoppingCart
  MIN_MEDIAN = 1
  MAX_MEDIAN = 138

  def initialize(payment)
    @payment = payment
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "median \#{val} out of [1,138] range" unless (1..138).include?(val)
    @median = val
  end

  def median
    raise ShoppingCartError, "median not set" if @median.zero?
    @median
  end
end

test_values = [123, -5, 188, 92]

obj = ShoppingCart.new("payment_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
