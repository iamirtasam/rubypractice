# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid invoice weight")
    super
  end
end

class FlightBooking
  MIN_WEIGHT = 10
  MAX_WEIGHT = 133

  def initialize(invoice)
    @invoice = invoice
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "weight \#{val} out of [10,133] range" unless (10..133).include?(val)
    @weight = val
  end

  def weight
    raise FlightBookingError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [60, -5, 137, 73]

obj = FlightBooking.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
