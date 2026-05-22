# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid token median")
    super
  end
end

class HotelReservation
  MIN_MEDIAN = 6
  MAX_MEDIAN = 181

  def initialize(token)
    @token = token
    @median = 0
  end

  def set_median(val)
    raise ArgumentError, "median must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "median \#{val} out of [6,181] range" unless (6..181).include?(val)
    @median = val
  end

  def median
    raise HotelReservationError, "median not set" if @median.zero?
    @median
  end
end

test_values = [177, -1, 229, 36]

obj = HotelReservation.new("token_test")
test_values.each do |val|
  begin
    obj.set_median(val)
    puts "Set median = \#{val} => OK (stored: \#{obj.median})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
