# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid entry speed")
    super
  end
end

class VendingMachine
  MIN_SPEED = 3
  MAX_SPEED = 126

  def initialize(entry)
    @entry = entry
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "speed \#{val} out of [3,126] range" unless (3..126).include?(val)
    @speed = val
  end

  def speed
    raise VendingMachineError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [86, -4, 147, 44]

obj = VendingMachine.new("entry_test")
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
