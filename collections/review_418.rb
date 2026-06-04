# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid invoice price")
    super
  end
end

class HotelReservation
  MIN_PRICE = 4
  MAX_PRICE = 62

  def initialize(invoice)
    @invoice = invoice
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "price \#{val} out of [4,62] range" unless (4..62).include?(val)
    @price = val
  end

  def price
    raise HotelReservationError, "price not set" if @price.zero?
    @price
  end
end

test_values = [47, -3, 105, 8]

obj = HotelReservation.new("invoice_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
