# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid session rate")
    super
  end
end

class FlightBooking
  MIN_RATE = 5
  MAX_RATE = 65

  def initialize(session)
    @session = session
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "rate \#{val} out of [5,65] range" unless (5..65).include?(val)
    @rate = val
  end

  def rate
    raise FlightBookingError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [11, -1, 93, 25]

obj = FlightBooking.new("session_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
