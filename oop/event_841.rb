# Practice: Exception Handling and Custom Errors

class FlightBookingError < StandardError
  def initialize(msg = "invalid post total")
    super
  end
end

class FlightBooking
  MIN_TOTAL = 8
  MAX_TOTAL = 175

  def initialize(post)
    @post = post
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise FlightBookingError, "total \#{val} out of [8,175] range" unless (8..175).include?(val)
    @total = val
  end

  def total
    raise FlightBookingError, "total not set" if @total.zero?
    @total
  end
end

test_values = [106, -1, 181, 28]

obj = FlightBooking.new("post_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue FlightBookingError => e
    puts "[FlightBookingError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
