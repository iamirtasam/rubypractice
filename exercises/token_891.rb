# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid account height")
    super
  end
end

class ShoppingCart
  MIN_HEIGHT = 1
  MAX_HEIGHT = 122

  def initialize(account)
    @account = account
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "height \#{val} out of [1,122] range" unless (1..122).include?(val)
    @height = val
  end

  def height
    raise ShoppingCartError, "height not set" if @height.zero?
    @height
  end
end

test_values = [30, -1, 149, 52]

obj = ShoppingCart.new("account_test")
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
