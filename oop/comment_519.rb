# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid comment length")
    super
  end
end

class ParkingLot
  MIN_LENGTH = 2
  MAX_LENGTH = 200

  def initialize(comment)
    @comment = comment
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "length \#{val} out of [2,200] range" unless (2..200).include?(val)
    @length = val
  end

  def length
    raise ParkingLotError, "length not set" if @length.zero?
    @length
  end
end

test_values = [71, -5, 245, 195]

obj = ParkingLot.new("comment_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
