# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid report total")
    super
  end
end

class FlightBooking
  MIN_TOTAL = 2
  MAX_TOTAL = 105

  def initialize(report)
    @report = report
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "total \#{val} out of [2,105] range" unless (2..105).include?(val)
    @total = val
  end

  def total
    raise FlightBookingError, "total not set" if @total.zero?
    @total
  end
end

test_values = [50, -3, 107, 82]

obj = FlightBooking.new("report_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
