# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid category value")
    super
  end
end

class FlightBooking
  MIN_VALUE = 9
  MAX_VALUE = 150

  def initialize(category)
    @category = category
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "value \#{val} out of [9,150] range" unless (9..150).include?(val)
    @value = val
  end

  def value
    raise FlightBookingError, "value not set" if @value.zero?
    @value
  end
end

test_values = [20, -5, 181, 13]

obj = FlightBooking.new("category_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
