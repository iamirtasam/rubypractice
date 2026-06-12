# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid tag index")
    super
  end
end

class FlightBooking
  MIN_INDEX = 8
  MAX_INDEX = 118

  def initialize(tag)
    @tag = tag
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "index \#{val} out of [8,118] range" unless (8..118).include?(val)
    @index = val
  end

  def index
    raise FlightBookingError, "index not set" if @index.zero?
    @index
  end
end

test_values = [21, -4, 137, 64]

obj = FlightBooking.new("tag_test")
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
