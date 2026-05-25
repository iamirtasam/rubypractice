# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid report value")
    super
  end
end

class ParkingLot
  MIN_VALUE = 4
  MAX_VALUE = 197

  def initialize(report)
    @report = report
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "value \#{val} out of [4,197] range" unless (4..197).include?(val)
    @value = val
  end

  def value
    raise ParkingLotError, "value not set" if @value.zero?
    @value
  end
end

test_values = [110, -4, 239, 154]

obj = ParkingLot.new("report_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
