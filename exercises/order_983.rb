# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid order width")
    super
  end
end

class FlightBooking
  MIN_WIDTH = 7
  MAX_WIDTH = 179

  def initialize(order)
    @order = order
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "width \#{val} out of [7,179] range" unless (7..179).include?(val)
    @width = val
  end

  def width
    raise FlightBookingError, "width not set" if @width.zero?
    @width
  end
end

test_values = [23, -4, 217, 9]

obj = FlightBooking.new("order_test")
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
