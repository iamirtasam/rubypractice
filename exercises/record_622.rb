# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid user speed")
    super
  end
end

class Library
  MIN_SPEED = 10
  MAX_SPEED = 143

  def initialize(user)
    @user = user
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "speed \#{val} out of [10,143] range" unless (10..143).include?(val)
    @speed = val
  end

  def speed
    raise LibraryError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [135, -5, 182, 104]

obj = Library.new("user_test")
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
