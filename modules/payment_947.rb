# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid item speed")
    super
  end
end

class Calculator
  MIN_SPEED = 6
  MAX_SPEED = 169

  def initialize(item)
    @item = item
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "speed \#{val} out of [6,169] range" unless (6..169).include?(val)
    @speed = val
  end

  def speed
    raise CalculatorError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [62, -1, 176, 77]

obj = Calculator.new("item_test")
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
