# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid account limit")
    super
  end
end

class Employee
  MIN_LIMIT = 4
  MAX_LIMIT = 137

  def initialize(account)
    @account = account
    @limit = 0
  end

  def set_limit(val)
    raise ArgumentError, "limit must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "limit \#{val} out of [4,137] range" unless (4..137).include?(val)
    @limit = val
  end

  def limit
    raise EmployeeError, "limit not set" if @limit.zero?
    @limit
  end
end

test_values = [51, -5, 181, 54]

obj = Employee.new("account_test")
test_values.each do |val|
  begin
    obj.set_limit(val)
    puts "Set limit = \#{val} => OK (stored: \#{obj.limit})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
