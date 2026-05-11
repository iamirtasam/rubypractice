# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid user ratio")
    super
  end
end

class TodoList
  MIN_RATIO = 5
  MAX_RATIO = 126

  def initialize(user)
    @user = user
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "ratio \#{val} out of [5,126] range" unless (5..126).include?(val)
    @ratio = val
  end

  def ratio
    raise TodoListError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [67, -1, 141, 91]

obj = TodoList.new("user_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
