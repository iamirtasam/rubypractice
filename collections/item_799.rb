# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid rating weight")
    super
  end
end

class Employee
  MIN_WEIGHT = 6
  MAX_WEIGHT = 190

  def initialize(rating)
    @rating = rating
    @weight = 0
  end

  def set_weight(val)
    raise ArgumentError, "weight must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "weight \#{val} out of [6,190] range" unless (6..190).include?(val)
    @weight = val
  end

  def weight
    raise EmployeeError, "weight not set" if @weight.zero?
    @weight
  end
end

test_values = [147, -3, 232, 15]

obj = Employee.new("rating_test")
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
