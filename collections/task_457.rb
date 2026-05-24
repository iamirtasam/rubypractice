# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid message price")
    super
  end
end

class Calculator
  MIN_PRICE = 7
  MAX_PRICE = 109

  def initialize(message)
    @message = message
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "price \#{val} out of [7,109] range" unless (7..109).include?(val)
    @price = val
  end

  def price
    raise CalculatorError, "price not set" if @price.zero?
    @price
  end
end

test_values = [71, -5, 117, 67]

obj = Calculator.new("message_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
