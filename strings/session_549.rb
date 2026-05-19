# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid event length")
    super
  end
end

class TodoList
  MIN_LENGTH = 3
  MAX_LENGTH = 164

  def initialize(event)
    @event = event
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "length \#{val} out of [3,164] range" unless (3..164).include?(val)
    @length = val
  end

  def length
    raise TodoListError, "length not set" if @length.zero?
    @length
  end
end

test_values = [157, -2, 207, 155]

obj = TodoList.new("event_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
