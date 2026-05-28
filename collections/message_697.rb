# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid record result")
    super
  end
end

class VendingMachine
  MIN_RESULT = 1
  MAX_RESULT = 180

  def initialize(record)
    @record = record
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "result \#{val} out of [1,180] range" unless (1..180).include?(val)
    @result = val
  end

  def result
    raise VendingMachineError, "result not set" if @result.zero?
    @result
  end
end

test_values = [40, -4, 217, 165]

obj = VendingMachine.new("record_test")
test_values.each do |val|
  begin
    obj.set_result(val)
    puts "Set result = \#{val} => OK (stored: \#{obj.result})"
  rescue VendingMachineError => e
    puts "[VendingMachineError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
