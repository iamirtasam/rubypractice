# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid post average")
    super
  end
end

class FlightBooking
  MIN_AVERAGE = 5
  MAX_AVERAGE = 130

  def initialize(post)
    @post = post
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "average \#{val} out of [5,130] range" unless (5..130).include?(val)
    @average = val
  end

  def average
    raise FlightBookingError, "average not set" if @average.zero?
    @average
  end
end

test_values = [65, -4, 153, 7]

obj = FlightBooking.new("post_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
