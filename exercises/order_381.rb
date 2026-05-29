# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid product value")
    super
  end
end

class HotelReservation
  MIN_VALUE = 6
  MAX_VALUE = 148

  def initialize(product)
    @product = product
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "value \#{val} out of [6,148] range" unless (6..148).include?(val)
    @value = val
  end

  def value
    raise HotelReservationError, "value not set" if @value.zero?
    @value
  end
end

test_values = [123, -5, 162, 72]

obj = HotelReservation.new("product_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
