# Practice: Exception Handling and Custom Errors

class VendingMachineError < StandardError
  def initialize(msg = "invalid session result")
    super
  end
end

class VendingMachine
  MIN_RESULT = 5
  MAX_RESULT = 54

  def initialize(session)
    @session = session
    @result = 0
  end

  def set_result(val)
    raise ArgumentError, "result must be a number" unless val.is_a?(Numeric)
    raise VendingMachineError, "result \#{val} out of [5,54] range" unless (5..54).include?(val)
    @result = val
  end

  def result
    raise VendingMachineError, "result not set" if @result.zero?
    @result
  end
end

test_values = [44, -5, 56, 43]

obj = VendingMachine.new("session_test")
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
