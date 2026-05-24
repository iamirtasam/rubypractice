# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid session value")
    super
  end
end

class TodoList
  MIN_VALUE = 7
  MAX_VALUE = 87

  def initialize(session)
    @session = session
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "value \#{val} out of [7,87] range" unless (7..87).include?(val)
    @value = val
  end

  def value
    raise TodoListError, "value not set" if @value.zero?
    @value
  end
end

test_values = [27, -1, 101, 42]

obj = TodoList.new("session_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
