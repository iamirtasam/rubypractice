# Practice: Exception Handling and Custom Errors

class ATMError < StandardError
  def initialize(msg = "invalid session rate")
    super
  end
end

class ATM
  MIN_RATE = 5
  MAX_RATE = 132

  def initialize(session)
    @session = session
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise ATMError, "rate \#{val} out of [5,132] range" unless (5..132).include?(val)
    @rate = val
  end

  def rate
    raise ATMError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [49, -2, 154, 54]

obj = ATM.new("session_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue ATMError => e
    puts "[ATMError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
