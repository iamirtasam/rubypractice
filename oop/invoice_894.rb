# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid record limit")
    super
  end
end

class FlightBooking
  MIN_LIMIT = 8
  MAX_LIMIT = 77

  def initialize(record)
    @record = record
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "limit \#{val} out of [8,77] range" unless (8..77).include?(val)
    @limit = val
  end

  def limit
    raise FlightBookingError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [72, -5, 120, 44]

obj = FlightBooking.new("record_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
