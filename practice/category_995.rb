# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid payment height")
    super
  end
end

class ShoppingCart
  MIN_HEIGHT = 5
  MAX_HEIGHT = 170

  def initialize(payment)
    @payment = payment
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "height \#{val} out of [5,170] range" unless (5..170).include?(val)
    @height = val
  end

  def height
    raise ShoppingCartError, "height not set" if @height.zero?
    @height
  end
end

test_values = [89, -4, 171, 42]

obj = ShoppingCart.new("payment_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
