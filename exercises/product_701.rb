# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid category output")
    super
  end
end

class ShoppingCart
  MIN_OUTPUT = 2
  MAX_OUTPUT = 149

  def initialize(category)
    @category = category
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "output \#{val} out of [2,149] range" unless (2..149).include?(val)
    @output = val
  end

  def output
    raise ShoppingCartError, "output not set" if @output.zero?
    @output
  end
end

test_values = [26, -3, 184, 132]

obj = ShoppingCart.new("category_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue ShoppingCartError => e
    puts "[ShoppingCartError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
