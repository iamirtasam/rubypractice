# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid order threshold")
    super
  end
end

class Employee
  MIN_THRESHOLD = 7
  MAX_THRESHOLD = 170

  def initialize(order)
    @order = order
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "threshold \#{val} out of [7,170] range" unless (7..170).include?(val)
    @threshold = val
  end

  def threshold
    raise EmployeeError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [80, -2, 195, 9]

obj = Employee.new("order_test")
test_values.each do |val|
  begin
    obj.set_threshold(val)
    puts "Set threshold = \#{val} => OK (stored: \#{obj.threshold})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
