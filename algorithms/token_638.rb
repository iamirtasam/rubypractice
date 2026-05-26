# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid entry discount")
    super
  end
end

class Calculator
  MIN_DISCOUNT = 7
  MAX_DISCOUNT = 106

  def initialize(entry)
    @entry = entry
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "discount \#{val} out of [7,106] range" unless (7..106).include?(val)
    @discount = val
  end

  def discount
    raise CalculatorError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [22, -5, 149, 77]

obj = Calculator.new("entry_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue CalculatorError => e
    puts "[CalculatorError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
