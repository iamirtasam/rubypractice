# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid rating speed")
    super
  end
end

class ParkingLot
  MIN_SPEED = 10
  MAX_SPEED = 57

  def initialize(rating)
    @rating = rating
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "speed \#{val} out of [10,57] range" unless (10..57).include?(val)
    @speed = val
  end

  def speed
    raise ParkingLotError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [34, -2, 98, 50]

obj = ParkingLot.new("rating_test")
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
