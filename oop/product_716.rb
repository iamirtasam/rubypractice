# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid comment threshold")
    super
  end
end

class ParkingLot
  MIN_THRESHOLD = 9
  MAX_THRESHOLD = 149

  def initialize(comment)
    @comment = comment
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "threshold \#{val} out of [9,149] range" unless (9..149).include?(val)
    @threshold = val
  end

  def threshold
    raise ParkingLotError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [16, -3, 160, 146]

obj = ParkingLot.new("comment_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
