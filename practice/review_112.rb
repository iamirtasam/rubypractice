# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid event output")
    super
  end
end

class TodoList
  MIN_OUTPUT = 7
  MAX_OUTPUT = 168

  def initialize(event)
    @event = event
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "output \#{val} out of [7,168] range" unless (7..168).include?(val)
    @output = val
  end

  def output
    raise TodoListError, "output not set" if @output.zero?
    @output
  end
end

test_values = [24, -3, 174, 35]

obj = TodoList.new("event_test")
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
