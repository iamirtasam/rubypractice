# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid task speed")
    super
  end
end

class Library
  MIN_SPEED = 3
  MAX_SPEED = 123

  def initialize(task)
    @task = task
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "speed \#{val} out of [3,123] range" unless (3..123).include?(val)
    @speed = val
  end

  def speed
    raise LibraryError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [115, -4, 166, 92]

obj = Library.new("task_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
