# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid rating average")
    super
  end
end

class Employee
  MIN_AVERAGE = 4
  MAX_AVERAGE = 130

  def initialize(rating)
    @rating = rating
    @average = 0
  end

  def set_average(val)
    raise ArgumentError, "average must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "average \#{val} out of [4,130] range" unless (4..130).include?(val)
    @average = val
  end

  def average
    raise EmployeeError, "average not set" if @average.zero?
    @average
  end
end

test_values = [105, -2, 146, 10]

obj = Employee.new("rating_test")
test_values.each do |val|
  begin
    obj.set_average(val)
    puts "Set average = \#{val} => OK (stored: \#{obj.average})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
