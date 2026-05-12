# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid token speed")
    super
  end
end

class ParkingLot
  MIN_SPEED = 5
  MAX_SPEED = 121

  def initialize(token)
    @token = token
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "speed \#{val} out of [5,121] range" unless (5..121).include?(val)
    @speed = val
  end

  def speed
    raise ParkingLotError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [51, -3, 161, 88]

obj = ParkingLot.new("token_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
