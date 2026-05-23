# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid session speed")
    super
  end
end

class HotelReservation
  MIN_SPEED = 8
  MAX_SPEED = 154

  def initialize(session)
    @session = session
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "speed \#{val} out of [8,154] range" unless (8..154).include?(val)
    @speed = val
  end

  def speed
    raise HotelReservationError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [63, -3, 166, 26]

obj = HotelReservation.new("session_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
