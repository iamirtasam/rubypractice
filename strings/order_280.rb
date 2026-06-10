# Practice: Exception Handling and Custom Errors

class LibraryError < StandardError
  def initialize(msg = "invalid event threshold")
    super
  end
end

class Library
  MIN_THRESHOLD = 4
  MAX_THRESHOLD = 66

  def initialize(event)
    @event = event
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise LibraryError, "threshold \#{val} out of [4,66] range" unless (4..66).include?(val)
    @threshold = val
  end

  def threshold
    raise LibraryError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [58, -3, 114, 36]

obj = Library.new("event_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue LibraryError => e
    puts "[LibraryError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
