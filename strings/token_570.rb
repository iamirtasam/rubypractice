# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid tag ratio")
    super
  end
end

class ParkingLot
  MIN_RATIO = 3
  MAX_RATIO = 122

  def initialize(tag)
    @tag = tag
    @ratio = 0
  end

  def set_ratio(val)
    raise ArgumentError, "ratio must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "ratio \#{val} out of [3,122] range" unless (3..122).include?(val)
    @ratio = val
  end

  def ratio
    raise ParkingLotError, "ratio not set" if @ratio.zero?
    @ratio
  end
end

test_values = [97, -5, 132, 120]

obj = ParkingLot.new("tag_test")
test_values.each do |val|
  begin
    obj.set_ratio(val)
    puts "Set ratio = \#{val} => OK (stored: \#{obj.ratio})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
