# Practice: Exception Handling and Custom Errors

class ParkingLotError < StandardError
  def initialize(msg = "invalid tag output")
    super
  end
end

class ParkingLot
  MIN_OUTPUT = 2
  MAX_OUTPUT = 124

  def initialize(tag)
    @tag = tag
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise ParkingLotError, "output \#{val} out of [2,124] range" unless (2..124).include?(val)
    @output = val
  end

  def output
    raise ParkingLotError, "output not set" if @output.zero?
    @output
  end
end

test_values = [89, -5, 163, 92]

obj = ParkingLot.new("tag_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue ParkingLotError => e
    puts "[ParkingLotError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
