# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid event output")
    super
  end
end

class Employee
  MIN_OUTPUT = 3
  MAX_OUTPUT = 195

  def initialize(event)
    @event = event
    @output = 0
  end

  def set_output(val)
    raise ArgumentError, "output must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "output \#{val} out of [3,195] range" unless (3..195).include?(val)
    @output = val
  end

  def output
    raise EmployeeError, "output not set" if @output.zero?
    @output
  end
end

test_values = [17, -2, 202, 85]

obj = Employee.new("event_test")
test_values.each do |val|
  begin
    obj.set_output(val)
    puts "Set output = \#{val} => OK (stored: \#{obj.output})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
