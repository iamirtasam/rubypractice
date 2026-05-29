# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid report limit")
    super
  end
end

class TodoList
  MIN_LIMIT = 8
  MAX_LIMIT = 72

  def initialize(report)
    @report = report
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "limit \#{val} out of [8,72] range" unless (8..72).include?(val)
    @limit = val
  end

  def limit
    raise TodoListError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [56, -2, 102, 53]

obj = TodoList.new("report_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
