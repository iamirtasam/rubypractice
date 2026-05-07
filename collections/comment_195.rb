# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid payment rate")
    super
  end
end

class ParkingLot
  MIN_RATE = 2
  MAX_RATE = 118

  def initialize(payment)
    @payment = payment
    @rate = 0
  end

  def set_rate(val)
    raise ArgumentError, "rate must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "rate \#{val} out of [2,118] range" unless (2..118).include?(val)
    @rate = val
  end

  def rate
    raise ParkingLotError, "rate not set" if @rate.zero?
    @rate
  end
end

test_values = [57, -2, 138, 4]

obj = ParkingLot.new("payment_test")
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
