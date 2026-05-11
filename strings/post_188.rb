# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid message threshold")
    super
  end
end

class ATM
  MIN_THRESHOLD = 6
  MAX_THRESHOLD = 89

  def initialize(message)
    @message = message
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise ATMError, "threshold \#{val} out of [6,89] range" unless (6..89).include?(val)
    @threshold = val
  end

  def threshold
    raise ATMError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [65, -2, 127, 26]

obj = ATM.new("message_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
