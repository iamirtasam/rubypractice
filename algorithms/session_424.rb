# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid entry speed")
    super
  end
end

class Library
  MIN_SPEED = 8
  MAX_SPEED = 83

  def initialize(entry)
    @entry = entry
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "speed \#{val} out of [8,83] range" unless (8..83).include?(val)
    @speed = val
  end

  def speed
    raise LibraryError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [18, -5, 104, 67]

obj = Library.new("entry_test")
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
