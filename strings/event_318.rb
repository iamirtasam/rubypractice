# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid rating speed")
    super
  end
end

class VendingMachine
  MIN_SPEED = 9
  MAX_SPEED = 162

  def initialize(rating)
    @rating = rating
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "speed \#{val} out of [9,162] range" unless (9..162).include?(val)
    @speed = val
  end

  def speed
    raise VendingMachineError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [153, -4, 212, 76]

obj = VendingMachine.new("rating_test")
test_values.each do |val|
  begin
    obj.set_speed(val)
    puts "Set speed = \#{val} => OK (stored: \#{obj.speed})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
