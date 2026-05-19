# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid post count")
    super
  end
end

class TodoList
  MIN_COUNT = 2
  MAX_COUNT = 188

  def initialize(post)
    @post = post
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "count \#{val} out of [2,188] range" unless (2..188).include?(val)
    @count = val
  end

  def count
    raise TodoListError, "count not set" if @count.zero?
    @count
  end
end

test_values = [56, -4, 213, 67]

obj = TodoList.new("post_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
