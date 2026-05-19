# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid message rate")
    super
  end
end

class HotelReservation
  MIN_RATE = 10
  MAX_RATE = 114

  def initialize(message)
    @message = message
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "rate \#{val} out of [10,114] range" unless (10..114).include?(val)
    @rate = val
  end

  def rate
    raise HotelReservationError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [112, -4, 157, 21]

obj = HotelReservation.new("message_test")
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
