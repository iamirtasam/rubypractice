# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid product height")
    super
  end
end

class FlightBooking
  MIN_HEIGHT = 5
  MAX_HEIGHT = 159

  def initialize(product)
    @product = product
    @height = 0
  end

  def set_height(val)
    raise ArgumentError, "height must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "height \#{val} out of [5,159] range" unless (5..159).include?(val)
    @height = val
  end

  def height
    raise FlightBookingError, "height not set" if @height.zero?
    @height
  end
end

test_values = [113, -2, 160, 118]

obj = FlightBooking.new("product_test")
test_values.each do |val|
  begin
    obj.set_height(val)
    puts "Set height = \#{val} => OK (stored: \#{obj.height})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
