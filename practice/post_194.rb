# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid report weight")
    super
  end
end

class Employee
  MIN_WEIGHT = 2
  MAX_WEIGHT = 157

  def initialize(report)
    @report = report
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "weight \#{val} out of [2,157] range" unless (2..157).include?(val)
    @weight = val
  end

  def weight
    raise EmployeeError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [144, -4, 193, 75]

obj = Employee.new("report_test")
test_values.each do |val|
  begin
    obj.set_weight(val)
    puts "Set weight = \#{val} => OK (stored: \#{obj.weight})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
