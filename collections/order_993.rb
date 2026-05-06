# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid report score")
    super
  end
end

class Calculator
  MIN_SCORE = 3
  MAX_SCORE = 120

  def initialize(report)
    @report = report
    @score = 0
  end

  def set_score(val)
    raise ArgumentError, "score must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "score \#{val} out of [3,120] range" unless (3..120).include?(val)
    @score = val
  end

  def score
    raise CalculatorError, "score not set" if @score.zero?
    @score
  end
end

test_values = [39, -4, 157, 57]

obj = Calculator.new("report_test")
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
