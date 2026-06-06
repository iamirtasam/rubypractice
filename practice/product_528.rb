# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid report result")
    super
  end
end

class FlightBooking
  MIN_RESULT = 8
  MAX_RESULT = 62

  def initialize(report)
    @report = report
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "result \#{val} out of [8,62] range" unless (8..62).include?(val)
    @result = val
  end

  def result
    raise FlightBookingError, "result not set" if @result.zero?
    @result
  end
end

test_values = [13, -5, 98, 38]

obj = FlightBooking.new("report_test")
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
