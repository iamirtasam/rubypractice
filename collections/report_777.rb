# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid message speed")
    super
  end
end

class Library
  MIN_SPEED = 9
  MAX_SPEED = 182

  def initialize(message)
    @message = message
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "speed \#{val} out of [9,182] range" unless (9..182).include?(val)
    @speed = val
  end

  def speed
    raise LibraryError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [55, -3, 232, 162]

obj = Library.new("message_test")
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
