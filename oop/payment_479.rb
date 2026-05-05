# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid message value")
    super
  end
end

class TodoList
  MIN_VALUE = 8
  MAX_VALUE = 156

  def initialize(message)
    @message = message
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "value \#{val} out of [8,156] range" unless (8..156).include?(val)
    @value = val
  end

  def value
    raise TodoListError, "value not set" if @value.zero?
    @value
  end
end

test_values = [112, -3, 203, 135]

obj = TodoList.new("message_test")
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
