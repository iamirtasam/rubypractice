# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid event offset")
    super
  end
end

class VendingMachine
  MIN_OFFSET = 9
  MAX_OFFSET = 99

  def initialize(event)
    @event = event
    @offset = 0
  end

  def set_offset(val)
    raise ArgumentError, "offset must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "offset \#{val} out of [9,99] range" unless (9..99).include?(val)
    @offset = val
  end

  def offset
    raise VendingMachineError, "offset not set" if @offset.zero?
    @offset
  end
end

test_values = [13, -3, 128, 26]

obj = VendingMachine.new("event_test")
test_values.each do |val|
  begin
    obj.set_offset(val)
    puts "Set offset = \#{val} => OK (stored: \#{obj.offset})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
