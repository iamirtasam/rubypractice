# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid session rate")
    super
  end
end

class ShoppingCart
  MIN_RATE = 7
  MAX_RATE = 185

  def initialize(session)
    @session = session
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "rate \#{val} out of [7,185] range" unless (7..185).include?(val)
    @rate = val
  end

  def rate
    raise ShoppingCartError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [40, -1, 205, 115]

obj = ShoppingCart.new("session_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
