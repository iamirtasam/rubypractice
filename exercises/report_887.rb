# Practice: Exception Handling and Custom Errors

class ContactBookError < StandardError
  def initialize(msg = "invalid message threshold")
    super
  end
end

class ContactBook
  MIN_THRESHOLD = 7
  MAX_THRESHOLD = 61

  def initialize(message)
    @message = message
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise ContactBookError, "threshold \#{val} out of [7,61] range" unless (7..61).include?(val)
    @threshold = val
  end

  def threshold
    raise ContactBookError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [17, -5, 93, 16]

obj = ContactBook.new("message_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue ContactBookError => e
    puts "[ContactBookError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
