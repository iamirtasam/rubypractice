# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid rating discount")
    super
  end
end

class HotelReservation
  MIN_DISCOUNT = 1
  MAX_DISCOUNT = 73

  def initialize(rating)
    @rating = rating
    @discount = 0
  end

  def set_discount(val)
    raise ArgumentError, "discount must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "discount \#{val} out of [1,73] range" unless (1..73).include?(val)
    @discount = val
  end

  def discount
    raise HotelReservationError, "discount not set" if @discount.zero?
    @discount
  end
end

test_values = [54, -5, 77, 39]

obj = HotelReservation.new("rating_test")
test_values.each do |val|
  begin
    obj.set_discount(val)
    puts "Set discount = \#{val} => OK (stored: \#{obj.discount})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
