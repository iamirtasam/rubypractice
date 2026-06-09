# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid event limit")
    super
  end
end

class Calculator
  MIN_LIMIT = 2
  MAX_LIMIT = 154

  def initialize(event)
    @event = event
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "limit \#{val} out of [2,154] range" unless (2..154).include?(val)
    @limit = val
  end

  def limit
    raise CalculatorError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [138, -1, 195, 92]

obj = Calculator.new("event_test")
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
