# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid payment weight")
    super
  end
end

class ParkingLot
  MIN_WEIGHT = 1
  MAX_WEIGHT = 134

  def initialize(payment)
    @payment = payment
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "weight \#{val} out of [1,134] range" unless (1..134).include?(val)
    @weight = val
  end

  def weight
    raise ParkingLotError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [90, -5, 182, 65]

obj = ParkingLot.new("payment_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
