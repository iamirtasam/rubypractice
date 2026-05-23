# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid record width")
    super
  end
end

class TodoList
  MIN_WIDTH = 9
  MAX_WIDTH = 102

  def initialize(record)
    @record = record
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "width \#{val} out of [9,102] range" unless (9..102).include?(val)
    @width = val
  end

  def width
    raise TodoListError, "width not set" if @width.zero?
    @width
  end
end

test_values = [52, -3, 111, 100]

obj = TodoList.new("record_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
