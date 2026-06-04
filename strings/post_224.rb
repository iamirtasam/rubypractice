# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid user rate")
    super
  end
end

class Calculator
  MIN_RATE = 5
  MAX_RATE = 178

  def initialize(user)
    @user = user
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "rate \#{val} out of [5,178] range" unless (5..178).include?(val)
    @rate = val
  end

  def rate
    raise CalculatorError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [132, -5, 205, 150]

obj = Calculator.new("user_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
