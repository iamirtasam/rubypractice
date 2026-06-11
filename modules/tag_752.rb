# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid payment count")
    super
  end
end

class Employee
  MIN_COUNT = 3
  MAX_COUNT = 192

  def initialize(payment)
    @payment = payment
    @count = 0
  end

  def set_count(val)
    raise ArgumentError, "count must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "count \#{val} out of [3,192] range" unless (3..192).include?(val)
    @count = val
  end

  def count
    raise EmployeeError, "count not set" if @count.zero?
    @count
  end
end

test_values = [69, -4, 239, 179]

obj = Employee.new("payment_test")
test_values.each do |val|
  begin
    obj.set_count(val)
    puts "Set count = \#{val} => OK (stored: \#{obj.count})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
