# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid post total")
    super
  end
end

class Employee
  MIN_TOTAL = 7
  MAX_TOTAL = 89

  def initialize(post)
    @post = post
    @total = 0
  end

  def set_total(val)
    raise ArgumentError, "total must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "total \#{val} out of [7,89] range" unless (7..89).include?(val)
    @total = val
  end

  def total
    raise EmployeeError, "total not set" if @total.zero?
    @total
  end
end

test_values = [17, -2, 92, 85]

obj = Employee.new("post_test")
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
