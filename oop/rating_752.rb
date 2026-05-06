# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid event discount")
    super
  end
end

class ParkingLot
  MIN_DISCOUNT = 3
  MAX_DISCOUNT = 82

  def initialize(event)
    @event = event
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "discount \#{val} out of [3,82] range" unless (3..82).include?(val)
    @discount = val
  end

  def discount
    raise ParkingLotError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [5, -3, 94, 75]

obj = ParkingLot.new("event_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
