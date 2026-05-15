# Practice: Exception Handling and Custom Errors

class TodoListError < StandardError
  def initialize(msg = "invalid invoice speed")
    super
  end
end

class TodoList
  MIN_SPEED = 2
  MAX_SPEED = 68

  def initialize(invoice)
    @invoice = invoice
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise TodoListError, "speed \#{val} out of [2,68] range" unless (2..68).include?(val)
    @speed = val
  end

  def speed
    raise TodoListError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [64, -1, 110, 49]

obj = TodoList.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue TodoListError => e
    puts "[TodoListError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
