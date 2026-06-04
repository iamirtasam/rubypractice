# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid post length")
    super
  end
end

class FlightBooking
  MIN_LENGTH = 1
  MAX_LENGTH = 98

  def initialize(post)
    @post = post
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "length \#{val} out of [1,98] range" unless (1..98).include?(val)
    @length = val
  end

  def length
    raise FlightBookingError, "length not set" if @length.zero?
    @length
  end
end

test_values = [93, -2, 141, 24]

obj = FlightBooking.new("post_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
