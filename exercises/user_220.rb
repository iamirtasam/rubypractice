# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid tag rate")
    super
  end
end

class HotelReservation
  MIN_RATE = 2
  MAX_RATE = 88

  def initialize(tag)
    @tag = tag
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "rate \#{val} out of [2,88] range" unless (2..88).include?(val)
    @rate = val
  end

  def rate
    raise HotelReservationError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [62, -3, 112, 25]

obj = HotelReservation.new("tag_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
