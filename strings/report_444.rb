# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid comment value")
    super
  end
end

class HotelReservation
  MIN_VALUE = 4
  MAX_VALUE = 159

  def initialize(comment)
    @comment = comment
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "value \#{val} out of [4,159] range" unless (4..159).include?(val)
    @value = val
  end

  def value
    raise HotelReservationError, "value not set" if @value.zero?
    @value
  end
end

test_values = [104, -3, 172, 86]

obj = HotelReservation.new("comment_test")
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
