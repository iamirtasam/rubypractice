# Practice: Exception Handling and Custom Errors

class HotelReservationError < StandardError
  def initialize(msg = "invalid rating index")
    super
  end
end

class HotelReservation
  MIN_INDEX = 1
  MAX_INDEX = 199

  def initialize(rating)
    @rating = rating
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise HotelReservationError, "index \#{val} out of [1,199] range" unless (1..199).include?(val)
    @index = val
  end

  def index
    raise HotelReservationError, "index not set" if @index.zero?
    @index
  end
end

test_values = [42, -5, 213, 68]

obj = HotelReservation.new("rating_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue HotelReservationError => e
    puts "[HotelReservationError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
