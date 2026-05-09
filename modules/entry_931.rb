# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid post speed")
    super
  end
end

class FlightBooking
  MIN_SPEED = 2
  MAX_SPEED = 122

  def initialize(post)
    @post = post
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "speed \#{val} out of [2,122] range" unless (2..122).include?(val)
    @speed = val
  end

  def speed
    raise FlightBookingError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [95, -2, 144, 101]

obj = FlightBooking.new("post_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
