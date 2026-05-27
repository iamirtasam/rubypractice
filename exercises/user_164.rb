# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid message rate")
    super
  end
end

class ParkingLot
  MIN_RATE = 1
  MAX_RATE = 137

  def initialize(message)
    @message = message
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "rate \#{val} out of [1,137] range" unless (1..137).include?(val)
    @rate = val
  end

  def rate
    raise ParkingLotError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [49, -4, 144, 110]

obj = ParkingLot.new("message_test")
test_values.each do |val|
  begin
    obj.set_rate(val)
    puts "Set rate = \#{val} => OK (stored: \#{obj.rate})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
