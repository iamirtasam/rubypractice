# Practice: Exception Handling and Custom Errors

class ShoppingCartError < StandardError
  def initialize(msg = "invalid rating output")
    super
  end
end

class ShoppingCart
  MIN_OUTPUT = 10
  MAX_OUTPUT = 51

  def initialize(rating)
    @rating = rating
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise ShoppingCartError, "output \#{val} out of [10,51] range" unless (10..51).include?(val)
    @output = val
  end

  def output
    raise ShoppingCartError, "output not set" if @output.zero?
    @output
  end
end

test_values = [42, -3, 69, 30]

obj = ShoppingCart.new("rating_test")
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
