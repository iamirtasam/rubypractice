# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid report limit")
    super
  end
end

class Calculator
  MIN_LIMIT = 9
  MAX_LIMIT = 153

  def initialize(report)
    @report = report
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "limit \#{val} out of [9,153] range" unless (9..153).include?(val)
    @limit = val
  end

  def limit
    raise CalculatorError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [45, -2, 191, 13]

obj = Calculator.new("report_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
