# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid item median")
    super
  end
end

class ShoppingCart
  MIN_MEDIAN = 9
  MAX_MEDIAN = 62

  def initialize(item)
    @item = item
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "median \#{val} out of [9,62] range" unless (9..62).include?(val)
    @median = val
  end

  def median
    raise ShoppingCartError, "median not set" if @median.zero?
    @median
  end
end

test_values = [13, -3, 109, 48]

obj = ShoppingCart.new("item_test")
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
