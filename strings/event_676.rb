# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid product threshold")
    super
  end
end

class Employee
  MIN_THRESHOLD = 2
  MAX_THRESHOLD = 167

  def initialize(product)
    @product = product
    @threshold = 0
  end

  def set_threshold(val)
    raise ArgumentError, "threshold must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "threshold \#{val} out of [2,167] range" unless (2..167).include?(val)
    @threshold = val
  end

  def threshold
    raise EmployeeError, "threshold not set" if @threshold.zero?
    @threshold
  end
end

test_values = [27, -1, 180, 144]

obj = Employee.new("product_test")
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
