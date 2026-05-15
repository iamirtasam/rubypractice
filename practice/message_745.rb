# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid task price")
    super
  end
end

class ShoppingCart
  MIN_PRICE = 3
  MAX_PRICE = 67

  def initialize(task)
    @task = task
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "price \#{val} out of [3,67] range" unless (3..67).include?(val)
    @price = val
  end

  def price
    raise ShoppingCartError, "price not set" if @price.zero?
    @price
  end
end

test_values = [13, -4, 94, 55]

obj = ShoppingCart.new("task_test")
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
