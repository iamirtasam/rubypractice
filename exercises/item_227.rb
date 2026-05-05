# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid order height")
    super
  end
end

class Calculator
  MIN_HEIGHT = 7
  MAX_HEIGHT = 96

  def initialize(order)
    @order = order
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "height \#{val} out of [7,96] range" unless (7..96).include?(val)
    @height = val
  end

  def height
    raise CalculatorError, "height not set" if @height.zero?
    @height
  end
end

test_values = [13, -3, 128, 46]

obj = Calculator.new("order_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
