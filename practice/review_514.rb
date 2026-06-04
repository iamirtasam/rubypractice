# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid message weight")
    super
  end
end

class HotelReservation
  MIN_WEIGHT = 6
  MAX_WEIGHT = 170

  def initialize(message)
    @message = message
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "weight \#{val} out of [6,170] range" unless (6..170).include?(val)
    @weight = val
  end

  def weight
    raise HotelReservationError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [47, -2, 215, 152]

obj = HotelReservation.new("message_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
