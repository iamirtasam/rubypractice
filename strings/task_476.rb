# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid review threshold")
    super
  end
end

class Calculator
  MIN_THRESHOLD = 5
  MAX_THRESHOLD = 127

  def initialize(review)
    @review = review
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "threshold \#{val} out of [5,127] range" unless (5..127).include?(val)
    @threshold = val
  end

  def threshold
    raise CalculatorError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [57, -5, 176, 76]

obj = Calculator.new("review_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
