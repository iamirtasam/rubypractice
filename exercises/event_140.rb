# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid report price")
    super
  end
end

class HotelReservation
  MIN_PRICE = 10
  MAX_PRICE = 119

  def initialize(report)
    @report = report
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "price \#{val} out of [10,119] range" unless (10..119).include?(val)
    @price = val
  end

  def price
    raise HotelReservationError, "price not set" if @price.zero?
    @price
  end
end

test_values = [100, -5, 145, 41]

obj = HotelReservation.new("report_test")
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
