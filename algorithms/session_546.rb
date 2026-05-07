# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid task ratio")
    super
  end
end

class ShoppingCart
  MIN_RATIO = 4
  MAX_RATIO = 80

  def initialize(task)
    @task = task
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "ratio \#{val} out of [4,80] range" unless (4..80).include?(val)
    @ratio = val
  end

  def ratio
    raise ShoppingCartError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [28, -5, 123, 16]

obj = ShoppingCart.new("task_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
