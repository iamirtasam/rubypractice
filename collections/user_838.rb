# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid token value")
    super
  end
end

class Employee
  MIN_VALUE = 4
  MAX_VALUE = 196

  def initialize(token)
    @token = token
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "value \#{val} out of [4,196] range" unless (4..196).include?(val)
    @value = val
  end

  def value
    raise EmployeeError, "value not set" if @value.zero?
    @value
  end
end

test_values = [162, -5, 206, 46]

obj = Employee.new("token_test")
test_values.each do |val|
  begin
    obj.set_value(val)
    puts "Set value = \#{val} => OK (stored: \#{obj.value})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
