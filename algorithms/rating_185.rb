# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid session index")
    super
  end
end

class FlightBooking
  MIN_INDEX = 7
  MAX_INDEX = 89

  def initialize(session)
    @session = session
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "index \#{val} out of [7,89] range" unless (7..89).include?(val)
    @index = val
  end

  def index
    raise FlightBookingError, "index not set" if @index.zero?
    @index
  end
end

test_values = [25, -1, 130, 41]

obj = FlightBooking.new("session_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
