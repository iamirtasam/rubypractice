# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid entry index")
    super
  end
end

class Calculator
  MIN_INDEX = 6
  MAX_INDEX = 133

  def initialize(entry)
    @entry = entry
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "index \#{val} out of [6,133] range" unless (6..133).include?(val)
    @index = val
  end

  def index
    raise CalculatorError, "index not set" if @index.zero?
    @index
  end
end

test_values = [21, -5, 158, 73]

obj = Calculator.new("entry_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
