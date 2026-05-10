# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid task discount")
    super
  end
end

class ShoppingCart
  MIN_DISCOUNT = 3
  MAX_DISCOUNT = 169

  def initialize(task)
    @task = task
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "discount \#{val} out of [3,169] range" unless (3..169).include?(val)
    @discount = val
  end

  def discount
    raise ShoppingCartError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [61, -5, 209, 86]

obj = ShoppingCart.new("task_test")
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
