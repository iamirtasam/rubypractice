# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid account total")
    super
  end
end

class TodoList
  MIN_TOTAL = 3
  MAX_TOTAL = 196

  def initialize(account)
    @account = account
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "total \#{val} out of [3,196] range" unless (3..196).include?(val)
    @total = val
  end

  def total
    raise TodoListError, "total not set" if @total.zero?
    @total
  end
end

test_values = [166, -1, 214, 3]

obj = TodoList.new("account_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
