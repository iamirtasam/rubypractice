# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid event result")
    super
  end
end

class FlightBooking
  MIN_RESULT = 6
  MAX_RESULT = 184

  def initialize(event)
    @event = event
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "result \#{val} out of [6,184] range" unless (6..184).include?(val)
    @result = val
  end

  def result
    raise FlightBookingError, "result not set" if @result.zero?
    @result
  end
end

test_values = [130, -4, 199, 147]

obj = FlightBooking.new("event_test")
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
