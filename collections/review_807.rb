# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid event limit")
    super
  end
end

class VendingMachine
  MIN_LIMIT = 5
  MAX_LIMIT = 191

  def initialize(event)
    @event = event
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "limit \#{val} out of [5,191] range" unless (5..191).include?(val)
    @limit = val
  end

  def limit
    raise VendingMachineError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [28, -5, 208, 187]

obj = VendingMachine.new("event_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
