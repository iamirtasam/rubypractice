# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid payment index")
    super
  end
end

class Calculator
  MIN_INDEX = 1
  MAX_INDEX = 185

  def initialize(payment)
    @payment = payment
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "index \#{val} out of [1,185] range" unless (1..185).include?(val)
    @index = val
  end

  def index
    raise CalculatorError, "index not set" if @index.zero?
    @index
  end
end

test_values = [184, -3, 229, 143]

obj = Calculator.new("payment_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
