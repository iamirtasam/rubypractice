# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid category ratio")
    super
  end
end

class TodoList
  MIN_RATIO = 6
  MAX_RATIO = 198

  def initialize(category)
    @category = category
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "ratio \#{val} out of [6,198] range" unless (6..198).include?(val)
    @ratio = val
  end

  def ratio
    raise TodoListError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [171, -1, 223, 80]

obj = TodoList.new("category_test")
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
