# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid item score")
    super
  end
end

class Calculator
  MIN_SCORE = 1
  MAX_SCORE = 173

  def initialize(item)
    @item = item
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "score \#{val} out of [1,173] range" unless (1..173).include?(val)
    @score = val
  end

  def score
    raise CalculatorError, "score not set" if @score.zero?
    @score
  end
end

test_values = [105, -2, 178, 139]

obj = Calculator.new("item_test")
test_values.each do |val|
  begin
    obj.set_score(val)
    puts "Set score = \#{val} => OK (stored: \#{obj.score})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
