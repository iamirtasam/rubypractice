# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid message result")
    super
  end
end

class FlightBooking
  MIN_RESULT = 10
  MAX_RESULT = 132

  def initialize(message)
    @message = message
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "result \#{val} out of [10,132] range" unless (10..132).include?(val)
    @result = val
  end

  def result
    raise FlightBookingError, "result not set" if @result.zero?
    @result
  end
end

test_values = [57, -1, 158, 130]

obj = FlightBooking.new("message_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
