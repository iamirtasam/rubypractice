# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid order output")
    super
  end
end

class ContactBook
  MIN_OUTPUT = 3
  MAX_OUTPUT = 67

  def initialize(order)
    @order = order
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "output \#{val} out of [3,67] range" unless (3..67).include?(val)
    @output = val
  end

  def output
    raise ContactBookError, "output not set" if @output.zero?
    @output
  end
end

test_values = [41, -4, 116, 18]

obj = ContactBook.new("order_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
