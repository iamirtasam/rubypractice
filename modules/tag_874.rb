# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid message total")
    super
  end
end

class Employee
  MIN_TOTAL = 9
  MAX_TOTAL = 93

  def initialize(message)
    @message = message
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "total \#{val} out of [9,93] range" unless (9..93).include?(val)
    @total = val
  end

  def total
    raise EmployeeError, "total not set" if @total.zero?
    @total
  end
end

test_values = [25, -3, 130, 27]

obj = Employee.new("message_test")
test_values.each do |val|
  begin
    obj.set_total(val)
    puts "Set total = \#{val} => OK (stored: \#{obj.total})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
