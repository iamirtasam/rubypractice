# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid rating width")
    super
  end
end

class FlightBooking
  MIN_WIDTH = 10
  MAX_WIDTH = 162

  def initialize(rating)
    @rating = rating
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "width \#{val} out of [10,162] range" unless (10..162).include?(val)
    @width = val
  end

  def width
    raise FlightBookingError, "width not set" if @width.zero?
    @width
  end
end

test_values = [95, -2, 185, 46]

obj = FlightBooking.new("rating_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
