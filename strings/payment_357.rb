# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid order threshold")
    super
  end
end

class ShoppingCart
  MIN_THRESHOLD = 1
  MAX_THRESHOLD = 159

  def initialize(order)
    @order = order
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "threshold \#{val} out of [1,159] range" unless (1..159).include?(val)
    @threshold = val
  end

  def threshold
    raise ShoppingCartError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [96, -2, 206, 10]

obj = ShoppingCart.new("order_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
