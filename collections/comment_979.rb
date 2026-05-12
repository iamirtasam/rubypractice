# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid message price")
    super
  end
end

class ShoppingCart
  MIN_PRICE = 1
  MAX_PRICE = 91

  def initialize(message)
    @message = message
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "price \#{val} out of [1,91] range" unless (1..91).include?(val)
    @price = val
  end

  def price
    raise ShoppingCartError, "price not set" if @price.zero?
    @price
  end
end

test_values = [67, -3, 134, 9]

obj = ShoppingCart.new("message_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
