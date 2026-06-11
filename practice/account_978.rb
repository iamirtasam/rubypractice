# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid order price")
    super
  end
end

class FlightBooking
  MIN_PRICE = 1
  MAX_PRICE = 130

  def initialize(order)
    @order = order
    @price = 0
  end

  def set_price(val)
    raise ArgumentError, "price must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "price \#{val} out of [1,130] range" unless (1..130).include?(val)
    @price = val
  end

  def price
    raise FlightBookingError, "price not set" if @price.zero?
    @price
  end
end

test_values = [97, -5, 137, 118]

obj = FlightBooking.new("order_test")
test_values.each do |val|
  begin
    obj.set_price(val)
    puts "Set price = \#{val} => OK (stored: \#{obj.price})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
