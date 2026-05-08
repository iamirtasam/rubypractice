# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid report total")
    super
  end
end

class Employee
  MIN_TOTAL = 8
  MAX_TOTAL = 146

  def initialize(report)
    @report = report
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "total \#{val} out of [8,146] range" unless (8..146).include?(val)
    @total = val
  end

  def total
    raise EmployeeError, "total not set" if @total.zero?
    @total
  end
end

test_values = [26, -4, 181, 107]

obj = Employee.new("report_test")
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
