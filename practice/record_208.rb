# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid event weight")
    super
  end
end

class Calculator
  MIN_WEIGHT = 3
  MAX_WEIGHT = 143

  def initialize(event)
    @event = event
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "weight \#{val} out of [3,143] range" unless (3..143).include?(val)
    @weight = val
  end

  def weight
    raise CalculatorError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [142, -3, 177, 112]

obj = Calculator.new("event_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
