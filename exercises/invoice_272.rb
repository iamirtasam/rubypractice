# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid report result")
    super
  end
end

class ParkingLot
  MIN_RESULT = 2
  MAX_RESULT = 110

  def initialize(report)
    @report = report
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "result \#{val} out of [2,110] range" unless (2..110).include?(val)
    @result = val
  end

  def result
    raise ParkingLotError, "result not set" if @result.zero?
    @result
  end
end

test_values = [62, -2, 153, 39]

obj = ParkingLot.new("report_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
