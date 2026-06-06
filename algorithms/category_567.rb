# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid message ratio")
    super
  end
end

class ATM
  MIN_RATIO = 8
  MAX_RATIO = 113

  def initialize(message)
    @message = message
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise ATMError, "ratio \#{val} out of [8,113] range" unless (8..113).include?(val)
    @ratio = val
  end

  def ratio
    raise ATMError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [78, -1, 148, 102]

obj = ATM.new("message_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
