# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid entry limit")
    super
  end
end

class Calculator
  MIN_LIMIT = 10
  MAX_LIMIT = 128

  def initialize(entry)
    @entry = entry
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "limit \#{val} out of [10,128] range" unless (10..128).include?(val)
    @limit = val
  end

  def limit
    raise CalculatorError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [28, -3, 134, 80]

obj = Calculator.new("entry_test")
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
