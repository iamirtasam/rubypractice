# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid record total")
    super
  end
end

class ParkingLot
  MIN_TOTAL = 4
  MAX_TOTAL = 120

  def initialize(record)
    @record = record
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "total \#{val} out of [4,120] range" unless (4..120).include?(val)
    @total = val
  end

  def total
    raise ParkingLotError, "total not set" if @total.zero?
    @total
  end
end

test_values = [96, -1, 166, 64]

obj = ParkingLot.new("record_test")
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
