# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid post count")
    super
  end
end

class ParkingLot
  MIN_COUNT = 9
  MAX_COUNT = 195

  def initialize(post)
    @post = post
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "count \#{val} out of [9,195] range" unless (9..195).include?(val)
    @count = val
  end

  def count
    raise ParkingLotError, "count not set" if @count.zero?
    @count
  end
end

test_values = [89, -5, 213, 121]

obj = ParkingLot.new("post_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
