# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid tag speed")
    super
  end
end

class Calculator
  MIN_SPEED = 8
  MAX_SPEED = 88

  def initialize(tag)
    @tag = tag
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "speed \#{val} out of [8,88] range" unless (8..88).include?(val)
    @speed = val
  end

  def speed
    raise CalculatorError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [68, -4, 132, 65]

obj = Calculator.new("tag_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
