# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid rating total")
    super
  end
end

class ParkingLot
  MIN_TOTAL = 3
  MAX_TOTAL = 141

  def initialize(rating)
    @rating = rating
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "total \#{val} out of [3,141] range" unless (3..141).include?(val)
    @total = val
  end

  def total
    raise ParkingLotError, "total not set" if @total.zero?
    @total
  end
end

test_values = [121, -3, 149, 130]

obj = ParkingLot.new("rating_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
