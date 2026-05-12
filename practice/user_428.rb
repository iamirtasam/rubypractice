# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid message discount")
    super
  end
end

class ShoppingCart
  MIN_DISCOUNT = 6
  MAX_DISCOUNT = 194

  def initialize(message)
    @message = message
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "discount \#{val} out of [6,194] range" unless (6..194).include?(val)
    @discount = val
  end

  def discount
    raise ShoppingCartError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [147, -4, 197, 71]

obj = ShoppingCart.new("message_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
