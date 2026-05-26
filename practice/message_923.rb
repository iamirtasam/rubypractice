# Practice: Exception Handling and Custom Errors

class EmployeeError < StandardError
  def initialize(msg = "invalid tag length")
    super
  end
end

class Employee
  MIN_LENGTH = 10
  MAX_LENGTH = 187

  def initialize(tag)
    @tag = tag
    @length = 0
  end

  def set_length(val)
    raise ArgumentError, "length must be a number" unless val.is_a?(Numeric)
    raise EmployeeError, "length \#{val} out of [10,187] range" unless (10..187).include?(val)
    @length = val
  end

  def length
    raise EmployeeError, "length not set" if @length.zero?
    @length
  end
end

test_values = [72, -3, 212, 108]

obj = Employee.new("tag_test")
test_values.each do |val|
  begin
    obj.set_length(val)
    puts "Set length = \#{val} => OK (stored: \#{obj.length})"
  rescue EmployeeError => e
    puts "[EmployeeError] \#{e.message}"
  rescue ArgumentError => e
    puts "[ArgumentError] \#{e.message}"
  ensure
    puts "  -> attempted value: \#{val}"
  end
end
