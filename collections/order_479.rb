# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid product ratio")
    super
  end
end

class FlightBooking
  MIN_RATIO = 9
  MAX_RATIO = 159

  def initialize(product)
    @product = product
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "ratio \#{val} out of [9,159] range" unless (9..159).include?(val)
    @ratio = val
  end

  def ratio
    raise FlightBookingError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [62, -5, 162, 60]

obj = FlightBooking.new("product_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
