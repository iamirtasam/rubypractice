# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid category result")
    super
  end
end

class FlightBooking
  MIN_RESULT = 4
  MAX_RESULT = 51

  def initialize(category)
    @category = category
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "result \#{val} out of [4,51] range" unless (4..51).include?(val)
    @result = val
  end

  def result
    raise FlightBookingError, "result not set" if @result.zero?
    @result
  end
end

test_values = [13, -2, 58, 7]

obj = FlightBooking.new("category_test")
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
