# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid entry index")
    super
  end
end

class ParkingLot
  MIN_INDEX = 1
  MAX_INDEX = 133

  def initialize(entry)
    @entry = entry
    @index = 0
  end

  def set_index(val)
    raise ArgumentError, "index must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "index \#{val} out of [1,133] range" unless (1..133).include?(val)
    @index = val
  end

  def index
    raise ParkingLotError, "index not set" if @index.zero?
    @index
  end
end

test_values = [7, -5, 145, 21]

obj = ParkingLot.new("entry_test")
test_values.each do |val|
  begin
    obj.set_index(val)
    puts "Set index = \#{val} => OK (stored: \#{obj.index})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
