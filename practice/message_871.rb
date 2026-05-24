# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid invoice width")
    super
  end
end

class HotelReservation
  MIN_WIDTH = 9
  MAX_WIDTH = 79

  def initialize(invoice)
    @invoice = invoice
    @width = 0
  end

  def set_width(val)
    raise ArgumentError, "width must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "width \#{val} out of [9,79] range" unless (9..79).include?(val)
    @width = val
  end

  def width
    raise HotelReservationError, "width not set" if @width.zero?
    @width
  end
end

test_values = [75, -5, 127, 59]

obj = HotelReservation.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_width(val)
    puts "Set width = \#{val} => OK (stored: \#{obj.width})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
