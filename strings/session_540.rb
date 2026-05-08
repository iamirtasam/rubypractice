# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid payment median")
    super
  end
end

class Calculator
  MIN_MEDIAN = 6
  MAX_MEDIAN = 126

  def initialize(payment)
    @payment = payment
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "median \#{val} out of [6,126] range" unless (6..126).include?(val)
    @median = val
  end

  def median
    raise CalculatorError, "median not set" if @median.zero?
    @median
  end
end

test_values = [93, -2, 172, 32]

obj = Calculator.new("payment_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
