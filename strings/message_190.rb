# Practice: Exception Handling and Custom Errors

class CalculatorError < StandardError
  def initialize(msg = "invalid item discount")
    super
  end
end

class Calculator
  MIN_DISCOUNT = 7
  MAX_DISCOUNT = 55

  def initialize(item)
    @item = item
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise CalculatorError, "discount \#{val} out of [7,55] range" unless (7..55).include?(val)
    @discount = val
  end

  def discount
    raise CalculatorError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [54, -2, 58, 24]

obj = Calculator.new("item_test")
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
