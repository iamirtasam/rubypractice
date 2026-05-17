# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid invoice output")
    super
  end
end

class TodoList
  MIN_OUTPUT = 3
  MAX_OUTPUT = 144

  def initialize(invoice)
    @invoice = invoice
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "output \#{val} out of [3,144] range" unless (3..144).include?(val)
    @output = val
  end

  def output
    raise TodoListError, "output not set" if @output.zero?
    @output
  end
end

test_values = [110, -3, 152, 44]

obj = TodoList.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
