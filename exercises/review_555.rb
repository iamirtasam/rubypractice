# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid review threshold")
    super
  end
end

class HotelReservation
  MIN_THRESHOLD = 10
  MAX_THRESHOLD = 88

  def initialize(review)
    @review = review
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "threshold \#{val} out of [10,88] range" unless (10..88).include?(val)
    @threshold = val
  end

  def threshold
    raise HotelReservationError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [26, -1, 92, 72]

obj = HotelReservation.new("review_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
