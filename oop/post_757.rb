# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid rating speed")
    super
  end
end

class Calculator
  MIN_SPEED = 1
  MAX_SPEED = 184

  def initialize(rating)
    @rating = rating
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "speed \#{val} out of [1,184] range" unless (1..184).include?(val)
    @speed = val
  end

  def speed
    raise CalculatorError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [80, -3, 217, 166]

obj = Calculator.new("rating_test")
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
