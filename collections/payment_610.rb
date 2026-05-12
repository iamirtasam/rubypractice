# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid review result")
    super
  end
end

class Calculator
  MIN_RESULT = 10
  MAX_RESULT = 82

  def initialize(review)
    @review = review
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "result \#{val} out of [10,82] range" unless (10..82).include?(val)
    @result = val
  end

  def result
    raise CalculatorError, "result not set" if @result.zero?
    @result
  end
end

test_values = [80, -5, 112, 49]

obj = Calculator.new("review_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
