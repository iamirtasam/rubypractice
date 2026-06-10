# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid token threshold")
    super
  end
end

class TodoList
  MIN_THRESHOLD = 1
  MAX_THRESHOLD = 104

  def initialize(token)
    @token = token
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "threshold \#{val} out of [1,104] range" unless (1..104).include?(val)
    @threshold = val
  end

  def threshold
    raise TodoListError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [16, -2, 142, 28]

obj = TodoList.new("token_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
