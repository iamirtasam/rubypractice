# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid invoice output")
    super
  end
end

class Calculator
  MIN_OUTPUT = 6
  MAX_OUTPUT = 134

  def initialize(invoice)
    @invoice = invoice
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "output \#{val} out of [6,134] range" unless (6..134).include?(val)
    @output = val
  end

  def output
    raise CalculatorError, "output not set" if @output.zero?
    @output
  end
end

test_values = [113, -3, 148, 16]

obj = Calculator.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
