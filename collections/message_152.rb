# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid tag value")
    super
  end
end

class Employee
  MIN_VALUE = 2
  MAX_VALUE = 105

  def initialize(tag)
    @tag = tag
    @value = 0
  end

  def set_value(val)
    raise ArgumentError, "value must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "value \#{val} out of [2,105] range" unless (2..105).include?(val)
    @value = val
  end

  def value
    raise EmployeeError, "value not set" if @value.zero?
    @value
  end
end

test_values = [30, -4, 121, 52]

obj = Employee.new("tag_test")
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
