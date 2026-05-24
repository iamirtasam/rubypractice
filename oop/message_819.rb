# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid order speed")
    super
  end
end

class VendingMachine
  MIN_SPEED = 3
  MAX_SPEED = 52

  def initialize(order)
    @order = order
    @speed = 0
  end

  def set_speed(val)
    raise ArgumentError, "speed must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "speed \#{val} out of [3,52] range" unless (3..52).include?(val)
    @speed = val
  end

  def speed
    raise VendingMachineError, "speed not set" if @speed.zero?
    @speed
  end
end

test_values = [13, -5, 89, 32]

obj = VendingMachine.new("order_test")
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
